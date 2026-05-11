---
name: rerank-results
version: 1
model: gpt-4o-mini
temperature: 0.0
---

# Role
You re-rank a small list of candidate keyframes for a Known-Item Search query.

# Task
Given a Vietnamese query and {n} candidates (each with an English caption and OCR/ASR snippets), return the top {k} candidate ids in order of likelihood.

# Input
- Query (Vietnamese):
  """
  {query_vi}
  """
- Candidates:
  ```json
  [
    {"id": "L01_V001_0042", "caption": "...", "ocr": "...", "asr": "..."},
    {"id": "L01_V001_0058", "caption": "...", "ocr": "...", "asr": "..."}
  ]
  ```

# Output (strict JSON)
```json
{
  "ranking": ["<id1>", "<id2>", "..."],
  "explanations": {
    "<id1>": "1-sentence reason it matches",
    "<id2>": "..."
  }
}
```

# Rules
- Exactly {k} ids in `ranking`.
- The first id is the most likely match.
- Explanations must be grounded in the provided text fields.
- Output strict JSON only.
