---
year: 2024
round: final
query_id: 2024-FINAL-Q02
type: video-kis
difficulty: hard
constraint: no-screenshot
gold:
  video_id: PLACEHOLDER
  frame_idx: 0
---

# Clip observed (≤ 20 s, no recording allowed)
Operator notes (typed into the tool's describe-flow form):
- "Aerial drone shot of a Vietnamese market street, daytime."
- "Many motorbikes parked on the right; red awnings centred."
- "A street sign starting with the letter `Lê` is visible."
- "Crowd density: medium; sky: lightly cloudy."

# Strategy
1. CLIP prompts:
   - "Aerial view of busy Vietnamese street market with red awning"
   - "Drone shot of Saigon market with motorbikes and street vendors"
2. OCR filter: `Lê` (a common Vietnamese name prefix in street signs).
3. Object filter: `motorcycle`, `awning`.

# Notes
- The describe-flow form is REQUIRED - never paste the actual clip.
- Even partial OCR (`Lê`) cuts the candidate pool dramatically.
- Aerial framing biases CLIP towards drone shots; relax to "high angle view" if recall is low.
