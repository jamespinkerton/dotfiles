# Shared Codex instructions

Keep answers brief and direct. Explain recommendations in plain language and add
technical detail only when it helps the user make a decision.

When blocked on a running evaluation command, use the existing `write_stdin`
session with empty `chars` and `yield_time_ms=3600000`. It returns when the command
exits or the one-hour timeout expires; ordinary stdout does not end the wait.
Prefer this to repeated short waits. The command must track evaluation completion,
not merely submission. A wait timeout never implies completion or authorizes a
duplicate submission. Follow the project's evaluation and monitoring requirements.
