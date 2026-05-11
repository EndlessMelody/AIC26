---
year: 2024
round: final
query_id: 2024-FINAL-Q05
type: textual-kis
difficulty: hard
gold:
  video_id: PLACEHOLDER
  frame_idx: 0
---

# Query (Vietnamese)
> Lễ hội truyền thống ở miền Bắc, có múa rồng trên đường phố, người dân mặc áo đỏ.

# Translation (English)
> A traditional festival in northern Vietnam with a dragon dance on the street; people wearing red.

# Strategy
1. CLIP prompts:
   - "Vietnamese dragon dance on street with red costumes at lunar new year festival"
   - "traditional festival with people in red holding a large dragon puppet"
2. Object filter: `person`, `flag`.
3. OCR: festival banners often contain `Tết` or `Lễ hội`.

# Notes
- Dragon dance is rare and visually unique - dense alone often works.
- Distinguish from southern Vietnam festivals (lion dance vs dragon dance).
