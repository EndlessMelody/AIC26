# ADR-002: Compete in Group A (Youth / University Students)

- **Status**: Accepted
- **Date**: 2026-05-11
- **Authors**: Team Lead

## Context

AI Challenge HCMC 2026 offers two divisions:

- **Group A** - Youth and University Students. Advanced tech stack expected, larger / harder data scope.
- **Group B** - High-school Students. Reduced scope and difficulty.

The team composition and ambitions determine which division to enter.

## Decision

Enter **Group A**.

## Consequences

### Positive
- Larger problem scope → more interesting engineering.
- Access to the full ~300 h video corpus and the final-round Video KIS task.
- Competitive context aligned with the team's experience.

### Negative
- Higher bar: must use advanced techniques (CLIP ViT-L+, hybrid retrieval, possibly LLM agents).
- More setup work: full backend + frontend + ML pipeline.
- Tougher competition from university research groups.

### Neutral / Follow-up
- The whole workspace is calibrated for Group A complexity (see `docs/04-tech-stack.md`).
- `.windsurf/rules/competition-context.md` records Group A as fixed context.
- Registration deadline: 15 / 6 / 2026.

## Alternatives Considered

- **Group B** - rejected because it would not exercise the team's full skill set, and post-event reusability of the system is lower.

## References

- `.windsurf/rules/competition-context.md`
- `docs/00-competition-overview.md`
- <https://aichallenge.hochiminhcity.gov.vn>
