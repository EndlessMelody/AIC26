---
year: 2024
round: final
query_id: Q-EXAMPLE-VKIS
type: video-kis
difficulty: hard
constraint: no-screenshot
gold:
  video_id: L02_V003
  frame_idx: 56789
  timestamp_ms: 1893000
---

# Query (a 15s clip is played by the jury)
We observed:
- An overhead view of a busy market street, daytime.
- A red awning prominent at the centre.
- Two motorcycles parked in front of a fruit stall.
- A Vietnamese street sign with the word "Lê" visible.

# Strategy used
1. **Operator describes what they saw** to the tool via a structured form, NOT a screenshot.
2. CLIP prompts:
   - "Aerial view of busy Vietnamese street market with red awning and motorcycles"
   - "Vietnamese street sign starting with the word Le, fruit stalls in foreground"
3. **OCR filter**: `Lê` to constrain to frames with the sign.
4. Reviewed top 30 in the grid; selected the matching frame.

# Failure modes observed
- The clip showed motion; static keyframes felt less distinctive. Adding the OCR clue was critical.
- Aerial framing biased CLIP towards drone shots that did not exist in our corpus; relaxing to "high angle view" helped.

# Time to solve
- 3m 18s, one correct submission on the second attempt.
