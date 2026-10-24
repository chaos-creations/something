#!/usr/bin/env python3
"""Checks that the Anthropic-compatible relay answers plain messages and tool use.

Stdlib only, so it runs on a bare VPS before the venv exists.
Reads STAR_KEY / STAR_URL / STAR_MODEL from the environment, or from the
env file given as the first argument (default /etc/llm-bridge/env).

    sudo python3 check_relay.py                 # uses /etc/llm-bridge/env
    STAR_KEY=... python3 check_relay.py -       # environment only
"""

import json
import os
import sys
import time
import urllib.error
import urllib.request

ENV_FILE = sys.argv[1] if len(sys.argv) > 1 else "/etc/llm-bridge/env"


def load_env_file(path):
    if path == "-" or not os.path.isfile(path):
        return
    with open(path, encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#") or "=" not in line:
                continue
            key, value = line.split("=", 1)
            os.environ.setdefault(key.strip(), value.strip().strip('"').strip("'"))


load_env_file(ENV_FILE)
KEY = os.environ.get("STAR_KEY", "")
URL = os.environ.get("STAR_URL", "https://ai.starimg.ru").rstrip("/")
MODEL = os.environ.get("STAR_MODEL", "claude-haiku-5-5")

if not KEY:
    sys.exit("STAR_KEY is not set (env or %s)" % ENV_FILE)


def headers(auth):
    h = {"content-type": "application/json", "anthropic-version": "2023-06-01"}
    if auth == "bearer":
        h["authorization"] = "Bearer " + KEY
    else:
        h["x-api-key"] = KEY
    return h


def request(method, path, auth, body=None):
    data = json.dumps(body).encode() if body is not None else None
    req = urllib.request.Request(URL + path, data=data, method=method, headers=headers(auth))
    started = time.monotonic()
    try:
        with urllib.request.urlopen(req, timeout=60) as resp:
            payload = resp.read().decode()
            code = resp.status
    except urllib.error.HTTPError as e:
        payload = e.read().decode(errors="replace")
        code = e.code
    elapsed = time.monotonic() - started
    try:
        parsed = json.loads(payload)
    except ValueError:
        parsed = None
    return code, parsed, payload, elapsed


def report(name, ok, detail):
    print("[%s] %s: %s" % ("OK  " if ok else "FAIL", name, detail))
    return ok


# 1. Auth scheme and model list
auth = None
for scheme in ("bearer", "x-api-key"):
    code, parsed, raw, _ = request("GET", "/v1/models", scheme)
    if code == 200:
        auth = scheme
        ids = [m.get("id") for m in (parsed or {}).get("data", [])]
        report("models (%s)" % scheme, True, ", ".join(ids) or raw[:200])
        if ids and MODEL not in ids:
            print("       WARNING: %s is not in the list, set STAR_MODEL to one of the above" % MODEL)
        break
    report("models (%s)" % scheme, False, "HTTP %s %s" % (code, raw[:200]))

if auth is None:
    # Some relays do not implement /v1/models; try messages with bearer anyway
    auth = "bearer"
    print("       /v1/models failed for both schemes, trying /v1/messages with bearer")

# 2. Plain message
code, parsed, raw, elapsed = request("POST", "/v1/messages", auth, {
    "model": MODEL,
    "max_tokens": 64,
    "messages": [{"role": "user", "content": "Ответь одним словом: какого цвета небо?"}],
})
text_ok = code == 200 and parsed and parsed.get("content")
report("plain message", bool(text_ok), "%.1fs model=%s %s" % (
    elapsed,
    (parsed or {}).get("model"),
    json.dumps((parsed or {}).get("content"), ensure_ascii=False)[:200] if text_ok else "HTTP %s %s" % (code, raw[:300]),
))

# 3. Tool use (forced, so a text-only answer means the relay drops tools)
tool = {
    "name": "say",
    "description": "Say a line out loud in character.",
    "input_schema": {
        "type": "object",
        "properties": {"text": {"type": "string"}},
        "required": ["text"],
    },
}
code, parsed, raw, elapsed = request("POST", "/v1/messages", auth, {
    "model": MODEL,
    "max_tokens": 128,
    "tools": [tool],
    "tool_choice": {"type": "any"},
    "messages": [{"role": "user", "content": "Морпех говорит тебе: 'Привет, рядовой!' Ответь ему."}],
})
blocks = (parsed or {}).get("content") or []
tool_calls = [b for b in blocks if b.get("type") == "tool_use"]
report("tool use", bool(tool_calls), "%.1fs stop_reason=%s %s" % (
    elapsed,
    (parsed or {}).get("stop_reason"),
    json.dumps(tool_calls or blocks, ensure_ascii=False)[:300] if code == 200 else "HTTP %s %s" % (code, raw[:300]),
))

# 4. Prompt caching is reported in usage; zero is fine for short prompts
usage = (parsed or {}).get("usage") or {}
print("       usage: %s" % json.dumps(usage))
print("auth scheme to use in the bridge: %s" % auth)
