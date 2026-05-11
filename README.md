# AI Challenge HCMC 2026 - Team Workspace

Interactive multimedia retrieval system for the AI Challenge Ho Chi Minh City 2026 competition.

> **Theme**: Intelligent virtual assistant for in-depth analysis and retrieval of information from large-scale multimedia data (images, audio, text, video).
>
> **Format**: Known-Item Search (KIS), inheriting from Video Browser Showdown (VBS) and Lifelog Search Challenge (LSC).
>
> **Division**: Group A - Youth & University Students.
>
> Official website: <https://aichallenge.hochiminhcity.gov.vn>

> 🇻🇳 **Thành viên Việt Nam mới onboarding**: mở [`docs/team-guide-vi.md`](docs/team-guide-vi.md) trước - hướng dẫn tiếng Việt đầy đủ về cách sử dụng workspace.

## Quick Start (Phase 0 - planning & docs only)

Backend, frontend, and ML pipeline are intentionally **placeholders** during Phase 0.
The only thing you need now is the docs and the Cascade rules / workflows.

```powershell
# (Optional) Set up a minimal Python env for notebooks and tooling
python -m venv .venv
.\.venv\Scripts\activate
pip install -e .[dev]

# Copy environment variables template
copy .env.example .env
```

Implementation of `backend/`, `frontend/`, and `ml/` starts in **Phase 1**.
See `docs/03-timeline-milestones.md` for the schedule.

## Repository Layout

```
.
├── .windsurf/          # Cascade AI assistant rules and workflows
├── docs/               # Knowledge base (start here)
├── data/               # Datasets, indices, models (gitignored)
├── notebooks/          # Experiments                  (placeholder)
├── backend/            # FastAPI server               (placeholder)
├── frontend/           # Next.js app                  (placeholder)
├── ml/                 # ML pipeline                  (placeholder)
├── scripts/            # CLI entry points             (placeholder)
├── tests/              # Unit + integration tests     (placeholder)
└── artifacts/          # Prompts, query templates, submission examples
```

## Documentation Index

Start with `docs/README.md` and follow the suggested reading order.

| Document                                                             | What it covers                                |
| -------------------------------------------------------------------- | --------------------------------------------- |
| [`docs/00-competition-overview.md`](docs/00-competition-overview.md) | Contest identity, theme, divisions, format    |
| [`docs/01-rules-and-format.md`](docs/01-rules-and-format.md)         | Scoring, submission format, allowed/forbidden |
| [`docs/02-data-spec.md`](docs/02-data-spec.md)                       | Expected dataset layout and our local layout  |
| [`docs/03-timeline-milestones.md`](docs/03-timeline-milestones.md)   | External dates + internal phases              |
| [`docs/04-tech-stack.md`](docs/04-tech-stack.md)                     | Libraries, models, hardware                   |
| [`docs/05-references-papers.md`](docs/05-references-papers.md)       | Reading list                                  |
| [`docs/06-team-roles.md`](docs/06-team-roles.md)                     | Who owns what                                 |
| [`docs/glossary.md`](docs/glossary.md)                               | Shared vocabulary (KIS, RRF, MRR, ...)        |
| [`docs/operator-manual.md`](docs/operator-manual.md)                 | Mental model for the contest operator         |
| [`docs/contest-day-checklist.md`](docs/contest-day-checklist.md)     | T-24h / during / after the round              |
| [`docs/risk-register.md`](docs/risk-register.md)                     | 20 ranked risks + mitigations                 |
| [`docs/decisions/`](docs/decisions/)                                 | Architecture Decision Records (3 ADRs)        |
| [`docs/minutes/00-kickoff.html`](docs/minutes/00-kickoff.html)       | Team kickoff meeting #0 (HTML)                |
| [`docs/team-guide-vi.md`](docs/team-guide-vi.md)                     | 🇻🇳 **Vietnamese onboarding guide**            |

## Cascade Workflows

Run a workflow with `/<name>` in Cascade chat:

Data pipeline:

- `/extract-keyframes` - keyframe extraction
- `/build-embeddings` - CLIP encoding + FAISS index
- `/ingest-data` - full pipeline (heavy)

Development:

- `/run-dev` - start backend + frontend
- `/submit-result` - submit a result to the grading server
- `/eval-local` - local evaluation on a query set

Contest readiness:

- `/mock-contest` - timed mock contest
- `/profile-latency` - measure P50 / P95 search latency
- `/export-audit-snapshot` - bundle submissions + logs for jury audit

## Conventions

- **Workspace language**: all code, comments, docs, and commits are in **English**.
- **Chat language**: Vietnamese by default for this team.
- **Commits**: Conventional Commits (`feat:`, `fix:`, `docs:`, ...).
- **Python**: 3.11, `uv` or `pip`, formatted with `ruff` + `black`.
- **Node**: pinned in `package.json`, `npm` only.
- **Data**: `data/` is gitignored. Never commit raw videos or model weights.

## Status

Phase 0 - Foundations. See `docs/03-timeline-milestones.md` for the active phase.
