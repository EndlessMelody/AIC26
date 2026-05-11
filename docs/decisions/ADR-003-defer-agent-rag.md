# ADR-003: Defer Agent / RAG implementation until the official 2026 spec is published

- **Status**: Accepted
- **Date**: 2026-05-11
- **Authors**: Team Lead + Cascade

## Context

The 2026 theme uses the phrases "intelligent virtual assistant" and "in-depth analysis", which suggests an LLM-driven, possibly agentic component on top of the classic Known-Item Search task.

Our internal estimate of what the spec will require:
- Pure KIS like 2022-2024 only: ~25%
- KIS + at least one RAG / Q&A sub-task: ~55%
- Full agentic multi-turn assistant: ~20%

Building an agent layer is expensive and adds risk (latency, hallucination, network dependence, cost). On the other hand, an embedding retrieval engine is required regardless of the final spec.

## Decision

**Defer** any Agent / RAG implementation until the organiser publishes the 2026 spec (expected 7-8 / 2026). In the meantime:

- Build the **retrieval engine** as the foundation.
- Keep the architectural sketch and the 4-tier rollout plan (T0 → T3) ready in memory.
- Do NOT add `agent-rag.md` rule, `docs/07-agent-architecture.md`, or agent prompt templates yet.

When the spec is announced, revisit this ADR and either supersede it with an implementation plan or formalise its retirement.

## Consequences

### Positive
- No wasted engineering on speculative tooling.
- The team focuses on the high-confidence foundation (retrieval).
- Easier to course-correct based on the actual spec.

### Negative
- If the spec demands a full agentic system, we start from cold on the agent layer.
- Less time to harden the agent path before the preliminary round.

### Neutral / Follow-up
- A complete strategic analysis is captured in Cascade memory under the title "AI Challenge 2026 - Agent/RAG Strategic Analysis (DEFERRED)".
- `progress.txt` carries a short log of this discussion.
- The 4-tier rollout plan we will execute if/when we proceed:
  - **T0** Fast path - pure retrieval (always on, < 200 ms)
  - **T1** LLM query rewrite (low risk, high value)
  - **T2** LLM rerank top-20 (medium risk)
  - **T3** Autonomous multi-tool agent (high risk, final-round only)

## Alternatives Considered

- **Build agent layer now** - rejected. Premature optimisation; too speculative without the spec; would compete for time with retrieval hardening.
- **Build agent layer alongside retrieval, in parallel** - rejected. Increases scope creep; risks shipping neither well.

## References

- Cascade memory: "AI Challenge 2026 - Agent/RAG Strategic Analysis (DEFERRED)"
- `progress.txt` - entry dated 2026-05-11 ("Strategy note - Agent/RAG capability")
- `.windsurf/rules/competition-context.md`
