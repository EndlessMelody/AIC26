# Prompt Library

Reusable LLM prompt templates. Keep each prompt in its own file so it can be versioned and tested.

| File | Purpose |
|---|---|
| `query-rewrite.md` | Expand and normalize a Vietnamese query into a richer English+Vietnamese search prompt |
| `extract-visual-concepts.md` | Pull visual concepts (objects, scenes, attributes) from a description for CLIP search |
| `keyframe-caption.md` | Generate a rich English caption for a keyframe (used during indexing) |
| `vi-en-translate.md` | Vietnamese ↔ English translation tuned for news-style content |
| `rerank-results.md` | Final-stage LLM rerank: given a query and 20 candidate captions, return the best k |

## Conventions

- Each file uses front-matter for metadata:
  ```yaml
  ---
  name: query-rewrite
  version: 1
  model: gpt-4o-mini
  temperature: 0.2
  ---
  ```
- Body is the prompt template using `{placeholders}`.
- When iterating, bump `version` and keep the previous file as `name-v{n}.md` for comparison.
