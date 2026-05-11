# Architecture Decision Records (ADRs)

This folder holds the team's significant technical decisions, written down so anyone can understand **why** a choice was made.

We use a lightweight Michael Nygard-style ADR template.

## When to write an ADR

Write one when a decision:
- Is **hard to reverse** (e.g. choice of design system, framework, vector DB).
- Has **trade-offs** worth documenting (e.g. latency vs accuracy, build vs buy).
- Concerns **non-obvious** ordering (e.g. when to defer building agent capabilities).

Trivial decisions live in `progress.txt`, not here.

## Status values

- `Proposed` - under discussion.
- `Accepted` - in force.
- `Superseded by ADR-NNN` - replaced by a newer decision.
- `Deprecated` - no longer applicable but kept for history.

## Index

| ID | Title | Status | Date |
|---|---|---|---|
| [ADR-001](./ADR-001-once-ui-design-system.md) | Adopt Once UI as the sole frontend design system | Accepted | 2026-05-11 |
| [ADR-002](./ADR-002-compete-in-group-a.md) | Compete in Group A (Youth / University Students) | Accepted | 2026-05-11 |
| [ADR-003](./ADR-003-defer-agent-rag.md) | Defer Agent / RAG implementation until BTC publishes the official spec | Accepted | 2026-05-11 |

## Template (copy this when writing a new ADR)

```markdown
# ADR-NNN: <Title>

- **Status**: Proposed / Accepted / Superseded by ADR-MMM / Deprecated
- **Date**: YYYY-MM-DD
- **Authors**: <names>

## Context
What is the situation? What forces are at play? What constraints exist?

## Decision
What did we decide?

## Consequences
- Positive: ...
- Negative: ...
- Neutral / Follow-up: ...

## Alternatives Considered
- **Option A** - why rejected.
- **Option B** - why rejected.

## References
- Links to relevant docs, papers, discussions.
```
