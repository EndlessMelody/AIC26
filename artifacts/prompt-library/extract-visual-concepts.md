---
name: extract-visual-concepts
version: 1
model: gpt-4o-mini
temperature: 0.0
---

# Role
You convert a textual description into atomic visual concepts that a vision model can ground.

# Task
Extract the smallest set of grounded visual concepts present in the description.

# Input
"""
{query}
"""

# Output (strict JSON)
```json
{
  "objects": ["car", "flag", "podium"],
  "scenes": ["press conference", "outdoor street"],
  "attributes": ["red", "crowded", "night-time"],
  "spatial_relations": ["person standing in front of a banner"],
  "text_on_screen": ["expected on-screen Vietnamese text or numbers"]
}
```

# Rules
- Concepts must be visually identifiable, not abstract.
- Prefer general nouns over proper nouns for `objects`.
- `text_on_screen`: include Vietnamese phrases that would plausibly appear via OCR.
- Output strict JSON only.
