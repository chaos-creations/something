# LLM bridge

Посредник между игровым сервером и Anthropic-совместимым API для human AI NPC.
Игровой сервер шлёт наблюдение на `https://<домен>/think` и получает список
действий из белого списка. Ключ перекупа хранится только здесь, поэтому игровой
сервер может стоять на чужой машине (TGS, тест-мержи): ему нужны только адрес
bridge и общий токен.

```
игровой сервер ──HTTPS + Bearer BRIDGE_TOKEN──► Caddy (TLS) ──► uvicorn 127.0.0.1:8765 ──► перекуп
```

## Файлы

- `check_relay.py` проверяет перекуп: список моделей, обычный ответ, tool use, схему авторизации. Нужна только стандартная библиотека.
- `bridge.py` — сам сервис (FastAPI).
- `llm-bridge.service` — юнит systemd.
- `env.example` — шаблон `/etc/llm-bridge/env`.
- `Caddyfile` — TLS-прокси перед сервисом.

## Установка на Ubuntu (22.04+)

```sh
# 1. Пакеты и пользователь без логина
sudo apt update
sudo apt install -y python3 python3-venv
sudo useradd --system --no-create-home --shell /usr/sbin/nologin llm-bridge

# 2. Код (из клона репозитория на VPS)
sudo mkdir -p /opt/llm-bridge
sudo cp tools/llm_bridge/bridge.py tools/llm_bridge/requirements.txt /opt/llm-bridge/
sudo python3 -m venv /opt/llm-bridge/venv
sudo /opt/llm-bridge/venv/bin/pip install -r /opt/llm-bridge/requirements.txt

# 3. Ключ: только root может читать файл, systemd передаст его сервису
sudo mkdir -p /etc/llm-bridge
sudo cp tools/llm_bridge/env.example /etc/llm-bridge/env
sudo chmod 600 /etc/llm-bridge/env
openssl rand -hex 32                 # это будет BRIDGE_TOKEN
sudo nano /etc/llm-bridge/env        # вписать STAR_KEY=... и BRIDGE_TOKEN=...

# 4. Проверка перекупа
sudo python3 tools/llm_bridge/check_relay.py
```

По результатам `check_relay.py` поправь `/etc/llm-bridge/env`:

- `STAR_AUTH`: схема, которую скрипт напечатал в конце (`bearer` или `x-api-key`).
- `STAR_MODEL`: если модели нет в списке, возьми подходящую из списка.
- `STAR_TOOLS=0`, если `tool use` получил FAIL. Тогда модель отвечает чистым JSON.

```sh
# 5. Запуск
sudo cp tools/llm_bridge/llm-bridge.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now llm-bridge
systemctl status llm-bridge
curl -s http://127.0.0.1:8765/health
```

```sh
# 6. HTTPS снаружи. Нужен домен или поддомен (подойдёт бесплатный, например DuckDNS),
#    у которого A-запись указывает на IP VPS. Без нормального сертификата rust-g
#    на игровом сервере соединение не примет.
sudo apt install -y caddy
sudo cp tools/llm_bridge/Caddyfile /etc/caddy/Caddyfile
sudo nano /etc/caddy/Caddyfile       # заменить llm.example.com на свой домен
sudo ufw allow 80,443/tcp            # если ufw включён
sudo systemctl reload caddy
curl -s https://<домен>/health
curl -s https://<домен>/stats -H "Authorization: Bearer <BRIDGE_TOKEN>"

# Логи (какие действия выбирает каждый NPC и за сколько секунд)
journalctl -u llm-bridge -f
```

После `git pull` обновлённый `bridge.py` надо снова скопировать в `/opt/llm-bridge/`
и выполнить `sudo systemctl restart llm-bridge`.

Порт 8765 наружу не открывается: uvicorn слушает только `127.0.0.1`, снаружи
доступен только Caddy на 443.

## Подключение игрового сервера

Адрес `https://<домен>` и `BRIDGE_TOKEN` задаются либо в конфиге сервера
(`LLM_BRIDGE_URL`, `LLM_BRIDGE_TOKEN` в `config.txt`), либо админ-командой
в раунде. Значения из конфига главнее.

## Лимиты

Игроки на чужом сервере тратят твой ключ, поэтому сервис режет запросы
(значения в `/etc/llm-bridge/env`):

- `BRIDGE_RPM` — запросов в минуту на все NPC вместе (60);
- `BRIDGE_BRAIN_COOLDOWN` — секунд между запросами одного NPC (3);
- `BRIDGE_DAILY` — запросов в сутки, UTC (3000).

Сверх лимита `/think` отвечает `error` (`rate_limited`, `cooldown`,
`daily_limit`), и NPC остаётся на обычном AI. Если токен утёк, смени
`BRIDGE_TOKEN` в env, `sudo systemctl restart llm-bridge`, и впиши новый
на игровом сервере.

## Протокол

`POST /think`

```json
{
  "brain_id": "b12",
  "persona": {"name": "Pvt. Kowalski", "rank": "Private", "job": "Rifleman",
              "faction": "USCM", "personality": "нервный новобранец из колонии, много шутит"},
  "observation": {
    "self": {"hp": "ранен", "in_combat": false, "held": "i1"},
    "heard": [{"from": "m1", "name": "Sgt. Hall", "text": "Подбери тот магазин и за мной"}],
    "mobs": [{"id": "m1", "name": "Sgt. Hall", "faction": "USCM", "dist": 2}],
    "items": [{"id": "i2", "name": "M41A magazine", "dist": 3}],
    "objects": [{"id": "o1", "name": "NanoMed", "dist": 5}],
    "held": [{"id": "i1", "name": "M41A pulse rifle"}],
    "results": [{"action": "examine", "target": "i2", "text": "Магазин на 40 патронов."}]
  }
}
```

Ответ: `{"actions": [{"name": "say", "args": {"text": "Есть!"}}, {"name": "pick_up", "args": {"target": "i2"}}], "error": null}`.
Если `error` не пустой, NPC просто остаётся на обычном AI. Без заголовка
`Authorization: Bearer <BRIDGE_TOKEN>` все запросы, кроме `/health`, получают 401.

Действия: `say`, `emote`, `follow`, `stop`, `hold`, `move_to`, `attack`, `heal`,
`examine`, `pick_up`, `drop`, `give`, `use`, `wait`. Сервис отбрасывает
неизвестные действия и id, которых нет в наблюдении, но DM обязан проверить
всё ещё раз (дистанцию, фракцию, `can_target`, `friendly_check`).

`POST /reset {"brain_id": "b12"}` стирает историю NPC (например, после смены личности).
`GET /health` — живость, без токена.
`GET /stats` — модель, режим tools, счётчики лимитов.
