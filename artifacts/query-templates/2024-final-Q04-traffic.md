---
year: 2024
round: final
query_id: 2024-FINAL-Q04
type: textual-kis
difficulty: medium
gold:
  video_id: PLACEHOLDER
  frame_idx: 0
---

# Query (Vietnamese)
> Tai nạn giao thông trên cao tốc, có xe ô tô bị lật, lực lượng cứu hộ đang làm việc.

# Translation (English)
> Traffic accident on a highway; an overturned car; rescue personnel working at the scene.

# Strategy
1. CLIP prompts:
   - "highway traffic accident with overturned car and rescue workers"
   - "overturned vehicle on Vietnamese highway with police on scene"
2. Object filter: `car`, `person`, `police_car`.
3. OCR: look for highway sign (`Cao tốc`, `QL`).

# Notes
- Overturned cars are visually distinctive; CLIP usually surfaces them.
- Re-rank candidates by counting `person` boxes near the car.
