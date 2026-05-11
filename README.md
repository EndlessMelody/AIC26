# AI Challenge HCMC 2026 - Team Workspace

Interactive multimedia retrieval system for the AI Challenge Ho Chi Minh City 2026 competition.

> **Theme**: Intelligent virtual assistant for in-depth analysis and retrieval of information from large-scale multimedia data (images, audio, text, video).
>
> **Format**: Known-Item Search (KIS), inheriting from Video Browser Showdown (VBS) and Lifelog Search Challenge (LSC).
>
> **Division**: Group A - Youth & University Students.
>
> Official website: <https://aichallenge.hochiminhcity.gov.vn>

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

## Cascade Workflows

Run a workflow with `/<name>` in Cascade chat:

- `/extract-keyframes` - keyframe extraction
- `/build-embeddings` - CLIP encoding + FAISS index
- `/ingest-data` - full pipeline (heavy)
- `/run-dev` - start backend + frontend
- `/submit-result` - submit a result to the grading server
- `/eval-local` - local evaluation on a query set

## Conventions

- **Workspace language**: all code, comments, docs, and commits are in **English**.
- **Chat language**: Vietnamese by default for this team.
- **Commits**: Conventional Commits (`feat:`, `fix:`, `docs:`, ...).
- **Python**: 3.11, `uv` or `pip`, formatted with `ruff` + `black`.
- **Node**: pinned in `package.json`, `npm` only.
- **Data**: `data/` is gitignored. Never commit raw videos or model weights.

## Status

Phase 0 - Foundations. See `docs/03-timeline-milestones.md` for the active phase.
