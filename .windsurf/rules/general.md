---
trigger: always_on
description: General working rules for all tasks
---

# General Rules

## Language Policy

- **All workspace content (code, comments, docs, commits, file names) MUST be in English.**
- Chat replies follow the user's preferred language (Vietnamese by default for this user).
- Variable / function / class names: English, lowerCamelCase or snake_case per language convention.
- File names: kebab-case for docs and configs (`tech-stack.md`), snake_case for Python (`build_clip_index.py`), PascalCase for React components (`KeyframeCard.tsx`).

## Code Style

- **Conventional Commits**: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`, `perf:`, `build:`, `ci:`, `revert:`.
- Commits are **atomic and focused** - one logical change per commit. Subject ≤ 72 chars; body explains _why_, not _what_.
- Prefix multi-package commits with a scope: `feat(backend): ...`, `fix(frontend): ...`, `perf(ml): ...`.
- Do not create throwaway scripts or junk files. Keep the workspace clean.
- Never delete anything under `data/` without explicit user confirmation.
- Never run heavy commands (full training, full-dataset indexing, full re-embedding of 300h) without explicit confirmation.

## File Safety

- Always read a file before editing it. Keep edits **minimal and focused**.
- Do not delete comments or tests unless explicitly asked.
- File paths: use `pathlib.Path` (Python) or `path.join` (Node). Never hardcode `\\` or platform-specific separators.
- Dataset paths: always read from env var `DATA_ROOT` or config. NEVER hardcode `D:\...`.
- Prefer adding new code over rewriting existing code; rewrite only when the old approach is structurally broken.

## Idempotency & Recovery

- Every script that touches the file system must be **idempotent** - rerunning it must not corrupt the previous state.
- Long-running scripts must support `--resume` and write a checkpoint file (`*.checkpoint.json`) after every 1,000 items (or every 5 minutes - whichever is sooner).
- Outputs must be written atomically: write to `*.tmp`, then `os.replace()` to the final name.
- Never partially write a Parquet / Numpy file - either the full file or nothing.

## Error Handling

- **Fail fast** during development; **fail loud** in production. Surface errors with full context (input, stage, retry count).
- Catch only what you can handle. Never write `except: pass` or `try { ... } catch {}`.
- API responses use a stable error envelope: `{ error_code: string, message: string, request_id: string, details?: object }`.
- For external APIs (LLM providers, BTC submission server): retry with **exponential backoff + jitter**, max 3 attempts, total budget < 10 s.

## Logging & Progress

- Use `tqdm` for any batch-processing loop. Set a descriptive `desc=` so multi-stage logs are readable.
- Use `loguru` (Python) or `pino` (Node). NEVER use `print` / `console.log` in production code.
- Log progress and write checkpoints periodically (≤ every 1,000 items or 5 minutes) so jobs are crash-recoverable.
- Every log line within a request scope must carry `request_id`. Every ML job log line must carry `job_id`.

## Documentation Policy

- A change is not done until docs are updated.
- Public functions / classes: docstring describing purpose, args, returns, raises, example.
- Architectural decisions: add a short note to `progress.txt` and (if significant) a new section to the relevant `docs/*.md`.
- README files in each top-level folder describe **what lives there and why**; keep them under 80 lines.

## Testing

- Every extractor / service must have a unit test under `tests/`.
- Do not remove or weaken existing tests without a clear reason - document the reason in the commit.
- Test names: `test_<unit>_<scenario>_<expectation>` (e.g. `test_clip_encoder_handles_empty_batch_returns_empty_array`).
- Before declaring a task "done", run `pytest tests/` (Python) / `npm test` (Node) if relevant.
- Critical paths must have **regression tests** the moment a bug is found.

## Code Review Checklist (self-review before pushing)

- [ ] Tests added / updated and passing.
- [ ] No `print`, `console.log`, or `TODO` left in code.
- [ ] No hardcoded paths, secrets, or magic numbers.
- [ ] Imports sorted (`ruff` / `isort` for Python, ESLint for TS).
- [ ] No commented-out blocks of code.
- [ ] `progress.txt` updated if the change is user-visible.
- [ ] Type hints / TS types present on every public API.

## Dependencies

- Python: pin versions in `pyproject.toml`. Do not bump major versions automatically.
- Node: pin in `package.json`. Use `npm` exclusively (do not mix yarn / pnpm).
- Before adding a new dependency: check whether an equivalent already exists, then justify the new one in the commit message.
- License-check new deps: avoid GPL / AGPL when the result is intended to be shared with the organisers.

## Secrets & API Keys

- NEVER commit `.env`, API keys, or model weights to git.
- Use `.env.example` to document required variable names without real values.
- Rotate any key that has been pasted in chat or screenshots, even if you think nobody saw.
- Use OS-level keyring or a `.netrc` outside the repo for personal HuggingFace tokens.

## Communication With User

- Be concise and direct. Surface progress, blockers, and decisions early.
- When uncertain about intent, ask one specific question rather than making assumptions.
- Surface trade-offs explicitly (latency vs recall, simplicity vs flexibility) so the user can choose.
