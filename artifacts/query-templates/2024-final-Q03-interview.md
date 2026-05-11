---
year: 2024
round: final
query_id: 2024-FINAL-Q03
type: textual-kis
difficulty: hard
gold:
  video_id: PLACEHOLDER
  frame_idx: 0
---

# Query (Vietnamese)
> Cuộc phỏng vấn một người nông dân lớn tuổi trên cánh đồng, ông đội nón lá, phía xa có núi.

# Translation (English)
> An interview with an elderly farmer on a field; he wears a conical hat (nón lá), with mountains in the distance.

# Strategy
1. CLIP prompts:
   - "interview with elderly Vietnamese farmer wearing conical hat in rice field"
   - "outdoor TV interview with a farmer, mountains in the background"
2. Object filter: `person`, `hat`.
3. Optional ASR filter for "nông dân" or "cánh đồng".

# Notes
- "Nón lá" is iconic and visually grounded; CLIP handles it well.
- Beware of confusion with stock B-roll of farmers from documentary segments (no interview).
