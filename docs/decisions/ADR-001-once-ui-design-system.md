# ADR-001: Adopt Once UI as the sole frontend design system

- **Status**: Accepted
- **Date**: 2026-05-11
- **Authors**: Team Lead + Cascade

## Context

We need a frontend stack for the operator UI. The contest demands:
- Dark-mode-first, high-density information display (multiple keyframes, filters, video preview).
- Keyboard-first ergonomics for the operator under time pressure.
- A consistent visual language so the team can ship product components fast.
- Accessibility (ARIA, semantic tags) without each engineer reinventing it.

Initially the workspace was scaffolded to use **TailwindCSS + shadcn/ui**, which is the popular default for Next.js apps. The user then chose **Once UI** (<https://once-ui.com>) and asked us to swap.

## Decision

Use **Once UI** as the **only** design system on the frontend.

- Banned dependencies: `tailwindcss`, `@radix-ui/*` (direct), `shadcn/ui`, `@mui/material`, `chakra-ui`, `mantine`.
- All layout uses `<Column>`, `<Row>`, `<Grid>` - never `<div>`.
- All colours via Once UI tokens (`background`, `onBackground`, `solid`, `onSolid`). Never hex codes.
- Icons via Once UI's `<Icon>` when available, otherwise Lucide.

## Consequences

### Positive
- **Semantic layout** is enforced by the type system; harder to write low-quality CSS.
- **Dark-mode-first**: matches the contest hall ergonomic setting.
- **Design tokens**: one prop change updates the entire app's aesthetics.
- **Vercel / Linear / Raycast-grade polish** with low effort.
- **Accessibility-by-default** on most primitives.

### Negative
- Smaller ecosystem than Tailwind / shadcn - some niche components must be built by us from primitives.
- Less community Q&A on Stack Overflow.
- Engineers familiar with utility-class CSS need a short ramp-up to learn the prop-driven layout API.

### Neutral / Follow-up
- `frontend-ui.md` rule file holds the enforced conventions and anti-patterns.
- Engineers must consult <https://once-ui.com> for component reference.

## Alternatives Considered

- **TailwindCSS + shadcn/ui** - excellent ecosystem and copy-paste primitives, but introduces utility-class noise, hex colours leak into code, and the result feels generic; harder to converge on a coherent aesthetic.
- **MUI (Material UI)** - heavy bundle, opinionated look that does not match the contest mood.
- **Chakra / Mantine** - similar prop-driven philosophy to Once UI but less polished defaults and worse dark mode.
- **Build from scratch** - too costly given the contest timeline.

## References

- Once UI documentation: <https://once-ui.com>
- `.windsurf/rules/frontend-ui.md`
- `docs/04-tech-stack.md`
