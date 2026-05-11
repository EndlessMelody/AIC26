# Knowledge Base - AI Challenge 2026

## Reading Order (start here)

1. [`00-competition-overview.md`](./00-competition-overview.md) - what the contest is.
2. [`01-rules-and-format.md`](./01-rules-and-format.md) - how scoring and submission work.
3. [`02-data-spec.md`](./02-data-spec.md) - what data we receive and how we store it.
4. [`03-timeline-milestones.md`](./03-timeline-milestones.md) - external dates and internal phases.
5. [`04-tech-stack.md`](./04-tech-stack.md) - the libraries and tools we use.
6. [`05-references-papers.md`](./05-references-papers.md) - reading list (start with the Annotated section).
7. [`06-team-roles.md`](./06-team-roles.md) - who owns what.

## Operational Documents

| Document                                                 | What it covers                                                               | Read when                             |
| -------------------------------------------------------- | ---------------------------------------------------------------------------- | ------------------------------------- |
| [`glossary.md`](./glossary.md)                           | Shared vocabulary (KIS, AVS, RRF, MRR, Recall@k, ...)                        | Anytime you see an unfamiliar acronym |
| [`operator-manual.md`](./operator-manual.md)             | Mental model for the contest operator                                        | Before every mock contest             |
| [`contest-day-checklist.md`](./contest-day-checklist.md) | T-24h, T-30min, during, between, after                                       | Print and bring on contest day        |
| [`risk-register.md`](./risk-register.md)                 | Known risks with mitigation owners                                           | Weekly review by team lead            |
| [`team-guide-vi.md`](./team-guide-vi.md)                 | **Vietnamese onboarding guide** (intentional exception to English-only rule) | New team members on day 1             |

## Architecture Decision Records

[`decisions/`](./decisions/) holds significant technical decisions with rationale.
See [`decisions/README.md`](./decisions/README.md) for the index and template.

Active ADRs:

- [ADR-001 - Once UI as the sole frontend design system](./decisions/ADR-001-once-ui-design-system.md)
- [ADR-002 - Compete in Group A](./decisions/ADR-002-compete-in-group-a.md)
- [ADR-003 - Defer Agent / RAG implementation](./decisions/ADR-003-defer-agent-rag.md)

## Meeting Minutes

[`minutes/`](./minutes/) records team meetings.

- [`minutes/00-kickoff.html`](./minutes/00-kickoff.html) - Phase 0 kickoff (theme, workspace, tech stack deep-dive).

## Conventions

- Keep these documents up to date - they are the source of truth for onboarding and orientation between sessions.
- Every document is in **English** (workspace rule). Chat with the user can be in Vietnamese.
- When making an architectural decision, write an ADR (see template in `decisions/README.md`).
- When holding a team meeting, save minutes under `minutes/NN-topic.html` or `.md`.
