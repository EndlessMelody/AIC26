# Operator Manual

The operator is the single most important scoring agent on contest day. This manual is the operator's mental model. Read it. Practise it. Live it.

> The cheat sheet is in `artifacts/operator-cheatsheet.md` - shortcuts only.
> This file is the **why** behind the cheat sheet.

---

## 1. Your Job

Find the gold item that matches the jury's query, faster than every other team, with as few wrong submissions as possible.

You are not the system - you are the **driver** of the system. The system surfaces candidates; you decide. Trust it less than you think.

---

## 2. The Four Phases of Every Query

### Phase A - Listen (5-15 s)
- Wait for the coach to finish reading.
- Resist the urge to type while listening. You will hear something key.
- For incremental queries (final round), **do not type at all** during chunk 1.

### Phase B - Encode (5-10 s)
- Turn the description into a **concrete visual phrase** in your head.
  - Bad: "an important meeting"
  - Good: "press conference with red banner, male speaker, podium with microphone"
- Identify the **strongest signal**:
  - Strong: distinctive logo, unusual costume, specific scene (e.g. flood, fire).
  - Weak: generic indoor/outdoor, common backgrounds.

### Phase C - Search (15-60 s)
- Type the concrete phrase. Hit `Enter` (fast path).
- Scan the top 12 thumbnails. If the gold frame is there - select it.
- If not, decide: **rewrite or filter**.
  - **Rewrite**: change the phrase to emphasise a different visual.
  - **Filter**: add OCR keyword, object class, or time range.
  - **Switch model**: `M` to swap CLIP for SigLIP.
- If still nothing in 30 s: `Shift + Enter` (smart path with LLM rerank).

### Phase D - Verify & Submit (5-15 s)
- Hover-preview the candidate. Watch 2 s of the source clip.
- Confirm `video_id` and `frame_idx` in the inspector.
- **Submit only when the visible match is unambiguous.**
- If unsure with 30 s left in the budget, submit your top guess - sitting on it scores nothing.

---

## 3. Decision Rules

### When to submit
- ✅ The top thumbnail shows >= 3 distinctive visual signals from the description.
- ✅ Hover-preview confirms motion / context.
- ✅ OCR (if any in the description) matches what is on the frame.

### When NOT to submit
- ❌ Only 1 weak signal matches.
- ❌ You are within 60 s of the start of an incremental query and only have generic clues.
- ❌ The frame "looks similar" but a key visual is missing or wrong.

### When to use smart path (`Shift + Enter`)
- Top-12 of fast path has no clear winner AND you have >= 60 s of budget left.
- Description is abstract ("important event", "famous person") and dense alone misses.
- Final round, after chunk 2 reveals - smart path can re-rank with the new context.

### When to switch models
- CLIP ViT-L/14 fails - try SigLIP. SigLIP often handles textual nuance better.
- SigLIP fails - try EVA-CLIP if available.

---

## 4. Common Query Archetypes (memorise the strategy)

| Archetype | Signal | Best tools |
|---|---|---|
| Press conference | Logo on backdrop | OCR filter on org name + CLIP "press conference" |
| Sport celebration | Jersey colour + flag | CLIP "celebrating goal" + flag object filter |
| Disaster scene | Water / fire / smoke | CLIP "flooded street" / "fire scene" alone usually enough |
| Diplomatic meeting | Handshake + flags | CLIP "handshake meeting" + flag count rerank |
| Interview | Person + microphone | CLIP "interview with microphone" + setting (indoor/outdoor) |
| Anchor in studio | Newsroom monitors | CLIP "news anchor studio" + OCR for the date / ticker |
| Aerial / drone | High-angle composition | CLIP "aerial view of..." + scene-type filter |
| Cultural / festival | Costume colour + activity | CLIP "dragon dance" / "lion dance" + OCR `Tết` |

---

## 5. Filters: the Operator's Multipliers

- **OCR filter** - the cheapest, highest-leverage filter on Vietnamese news. Almost every news frame has burnt-in text.
- **ASR filter** - good when the description quotes spoken content. Less reliable on music or interviews with overlapping voices.
- **Object filter** - effective for visually distinctive classes (motorcycle, flag, podium).
- **Time-range filter** - use when the description hints at a year or season; cheap to apply.
- **Composite filters** - combining 2 narrow filters often nails the gold frame.

**Rule of thumb**: start unfiltered, add filters one at a time, never more than 2 simultaneously.

---

## 6. Mistakes the Operator Makes Under Stress

1. **Submitting from the first thumbnail without scanning.** Slow down by 2 seconds. It saves 30.
2. **Forgetting to clear filters between queries.** Always `Ctrl + Shift + R` between queries.
3. **Reading the wrong keyframe id.** Open the inspector and read the value, do not eyeball.
4. **Switching models mid-query without resetting filters.** Different models surface different candidates - clear filters first.
5. **Trusting hover-preview on still scenes.** Always scrub a few seconds on the timeline.
6. **Typing in English when OCR is in Vietnamese.** Match the language of the text you expect on screen.

---

## 7. Communication with the Coach

- Coach reads the description aloud - **do not interrupt**.
- After scanning top 12, say aloud: "I have a candidate" or "Nothing matches".
- Before submitting, say aloud: "Submitting `<video_id>` frame `<idx>`."
- The coach can veto with a single word: "Wait."
- If the coach says "Submit your best guess" - submit immediately.

---

## 8. Recovery: When Things Go Wrong

| Situation | Action |
|---|---|
| First submission was wrong | Don't panic. Change **one** variable. Re-search. |
| Wrong twice in a row | Pause for 3 seconds. Re-read the description in your head. |
| System lags > 1 s | Stop typing. Wait. Use the time to think. |
| Backend down | Coach calls a halt. Engineer restarts. Do NOT keep clicking. |
| Network down to BTC | Queue submissions locally. Engineer switches to hotspot. |

---

## 9. Training Plan (before each round)

- **2 weeks before**: 1 mock contest per day, 5 queries each.
- **1 week before**: 1 mock contest every other day, 10 queries each.
- **2 days before**: full-budget mock contest with all team members watching.
- **Day before**: rest. No new code. No new shortcuts.

Track every mock in `progress.txt`:
```
2026-08-10  Mock contest: 8/10 correct, P95 search latency 180ms,
            2 wrong submissions, 1 system stall (fixed with backend restart).
```

---

## 10. The Operator's Oath

- I will scan before I select.
- I will verify before I submit.
- I will clear before I search.
- I will trust the team and the timer.
- I will speak when I am unsure.
