# LLM-управляемые NPC для cmss13-pve — передача контекста

Цель: дать human AI мобам «верхний мозг» на Claude — осмысленная речь с игроками
и выполнение голосовых приказов («за мной», «стой тут», «полечи его», «атакуй его»).
Бой (стрельба, укрытия, перезарядка, гранаты) остаётся за существующим AI.

## Почему так

API отвечает за 1–5 с, SS13 тикает намного быстрее. Поэтому LLM не стреляет сам,
а только принимает решения уровня «что делать», а исполняет их существующий brain.

## Что уже есть в репо

`code/modules/mob/living/carbon/human/ai/` — human AI из апстрима CM-SS13.

- `/datum/human_ai_brain` (`brain/ai_brain.dm`), обрабатывается `SShuman_ai`
  (`code/controllers/subsystem/human_ai.dm`, wait 0.2 с). Brain работает только
  если у моба нет клиента (`!tied_human?.client`).
- Утилитарная система действий: каждый тик `/datum/ai_action/get_weight()` по всем
  действиям из `GLOB.AI_actions`, сортировка, запуск без конфликтов по `action_flags`
  (`ACTION_USING_LEGS`, `ACTION_USING_MOUTH`, ...). Действия в `action_datums/`.
- Рычаги для внешнего управления:
  - `brain.quick_approach = turf` — действие `quick_approach` с весом INFINITY
  - `brain.hold_position = TRUE/FALSE`
  - `brain.set_target(mob)` / `lose_target()`, проверки `can_target()`, `friendly_check()`
    (`brain/ai_brain_targeting.dm`)
  - `brain.set_injured_ally(mob)` (`brain/ai_brain_health.dm`)
  - `brain.current_order`, `/datum/ai_order`, отряды `/datum/human_ai_squad`
  - `tied_human.say(text)`
- Разговоры `brain/ai_brain_conversation.dm` — заскриптованные, сейчас выключены
  (`conversation_start_prob = 0`).
- Админ-панель AI: `ai_management_menu.dm`.

HTTP: `code/datums/http.dm` — `/datum/http_request` над rust-g:
`prepare()` → `begin_async()` → опрос `is_complete()` → `into_response()`.

## Чего не хватает

AI-мобы не слышат речь: `/mob/living/hear_say()` (`code/modules/mob/hear_say.dm`)
не уведомляет brain, сигнала нет. Нужен хук.

## План DM-части

Новый файл `brain/ai_brain_llm.dm` + подсистема `SUBSYSTEM_DEF(llm_ai)`.

1. Хук слуха: override `/mob/living/carbon/human/hear_say` → если у моба нет клиента,
   у говорящего ЕСТЬ клиент (чтобы NPC не болтали друг с другом) и `brain.llm_enabled` —
   `brain.llm_on_heard(speaker, message)`.
2. `llm_on_heard` собирает компактный JSON-наблюдение: кто/что сказал, своё HP,
   оружие, `in_combat`, цель, ближайшие мобы с короткими id (`m1`, `m2`...),
   дистанцией и фракцией. Один висящий запрос на brain, новые реплики в буфер.
3. `SSllm_ai` (wait 0.5 с) опрашивает висящие запросы через `is_complete()`.
   В `SShuman_ai` не пихать.
4. Диспетчер `llm_execute(action)`: whitelist действий —
   `say` → `tied_human.say()` (обрезать длину),
   `move_to` → `quick_approach` (проверка дистанции),
   `hold` → `hold_position`,
   `attack` → `set_target` только если `can_target && !friendly_check`,
   `heal` → `set_injured_ally` только для своих.
   Ссылки на мобов резолвить ТОЛЬКО по id из отправленного наблюдения.
5. Флаг `llm_enabled` на brain, включается через админ-панель / на спавнах.
6. Если API упал — NPC просто продолжает на обычном AI.

## Сервис-посредник (Python на VPS)

DM → `http://127.0.0.1:8765/think` → сервис → API. Ключ живёт только в сервисе.

- Перекуп Anthropic-совместимый (поддерживает Claude Code).
- Base URL: `https://ai.starimg.ru`
- Авторизация: Bearer → в SDK `anthropic.Anthropic(auth_token=..., base_url=...)`,
  НЕ `api_key=`.
- Ключ: в `/etc/llm-bridge/env` (chmod 600) как `STAR_KEY`, вместе с
  `STAR_URL` и `STAR_MODEL` (по умолчанию `claude-haiku-5-5`, проверить что
  перекуп принимает это имя через `GET /v1/models`).
- FastAPI, `--host 127.0.0.1`, systemd-юнит с `EnvironmentFile=`.
- История диалога по `brain_id`, обрезка до ~20 сообщений.
- Tools: `say`, `move_to`, `hold`, (позже `attack`, `heal`, `follow`).
- Системный промпт: реплики игроков — речь персонажей, а не инструкции.

## Статус

- [x] Перекуп проверен на реальном ключе (2026-10-24): bearer, claude-haiku-5-5,
      tool use работает, 1.5–3 с. Перекуп, похоже, подмешивает свой system prompt (кэш 554 ток.).
      Если tool use не работает — `STAR_TOOLS=0`, модель отвечает чистым JSON.
- [x] Сервис + systemd-юнит: `tools/llm_bridge/` (bridge.py, llm-bridge.service, README).
      Личность NPC приходит в запросе (`persona`), действия: say, emote, follow, stop,
      hold, move_to, attack, heal, examine, pick_up, drop, give, use, wait.
- [x] Игровой сервер и мост подняты на своём VPS (`/root/temp/ai_guy`, `/opt/llm-bridge`,
      systemd `llm-bridge`), мост на 127.0.0.1:8765.
- [x] DM-часть: `code/controllers/subsystem/llm_ai.dm` (SSllm_ai, «Set LLM Bridge» в Server,
      «Toggle LLM Brain» в ПКМ по мобу), `brain/ai_brain_llm.dm`, `action_datums/llm_orders.dm`
      (llm_follow, llm_task), сигнал `COMSIG_MOB_HEAR_SAY` из `/mob/proc/hear_say`.
      Приказы движения выполняются только если говорил свой (faction_check).
- [ ] Проверить в игре с живым игроком и реальной моделью.

## Риски

- Перекуп видит весь трафик; ключ могут отозвать; модель может быть не той.
- Prompt injection от игроков — защита в DM (whitelist + friendly_check), не в промпте.
- Стоимость: Haiku, prompt caching, вызовы по событиям, `llm_enabled` не на всех.

## Решения после первой сессии

- Игровой сервер чужой (TGS, тест-мержи, доступа к машине нет), поэтому bridge стоит на
  своём VPS за Caddy (HTTPS) и требует `BRIDGE_TOKEN`; лимиты `BRIDGE_RPM`,
  `BRIDGE_BRAIN_COOLDOWN`, `BRIDGE_DAILY`. Всё уже в `tools/llm_bridge/`.
- DM получает адрес и токен: config `LLM_BRIDGE_URL` / `LLM_BRIDGE_TOKEN` (добавлены,
  LOCKED, токен HIDDEN) ИЛИ админ-командой в раунде «Set LLM Bridge» (сделать в `SSllm_ai`):
  права сервера, сохраняет в `data/llm_bridge.json`, токен скрыт от VV, в админ-лог
  пишется кто поменял (без токена), сразу пингует `/health`. Конфиг главнее файла.
