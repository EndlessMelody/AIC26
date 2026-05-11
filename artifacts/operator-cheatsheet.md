# Operator Cheat Sheet

**Print this. Tape it next to your keyboard. Memorise it.**
Times are tight - every second the operator looks away costs points.

---

## Global Shortcuts (work anywhere in the UI)

| Key | Action |
|---|---|
| `Ctrl` + `K` | Open command palette |
| `/` | Focus the search input |
| `Esc` | Cancel current dialog / clear focus |
| `?` | Show this cheat sheet inside the app |
| `Ctrl` + `Shift` + `R` | Reset query + filters (between queries) |
| `Ctrl` + `Z` | Undo last action |
| `Ctrl` + `Y` | Redo |

## Search Mode

| Key | Action |
|---|---|
| `Enter` (in search box) | Run the query (fast path) |
| `Shift` + `Enter` (in search box) | Run with smart path (LLM rerank) |
| `F` | Toggle OCR filter |
| `A` | Toggle ASR filter |
| `O` | Toggle object-class filter |
| `T` | Toggle time-range filter |
| `M` | Switch CLIP model (ViT-L/14 ↔ SigLIP) |

## Result Grid Navigation

| Key | Action |
|---|---|
| `↑` `↓` `←` `→` | Move selection |
| `1`-`9` | Select the Nth visible result |
| `Space` | Toggle hover preview play / pause |
| `Page Down` | Next page of results |
| `Page Up` | Previous page |
| `J` / `K` | Vim-style next / previous result |

## Inspection

| Key | Action |
|---|---|
| `I` | Open keyframe inspector (full video + timeline) |
| `,` | Step to the previous keyframe in the same video |
| `.` | Step to the next keyframe in the same video |
| `<` | Jump to first keyframe of the video |
| `>` | Jump to last keyframe of the video |
| `B` | Bookmark this result (added to side panel) |

## Submission

| Key | Action |
|---|---|
| `Enter` (on selected result) | Submit this result |
| `Shift` + `Enter` (on selected result) | Submit with confirm dialog (safer) |
| `Ctrl` + `Enter` | Submit and immediately clear for next query |
| `Backspace` (within 2 s of submit) | Cancel the submission if still pending |

## History & Replay

| Key | Action |
|---|---|
| `H` | Open query history side panel |
| `R` | Replay the previous query (useful for audit) |
| `Ctrl` + `H` | Open the full submissions log |

## Modes

| Key | Action |
|---|---|
| `1` (with `Ctrl`) | Switch to Textual KIS mode |
| `2` (with `Ctrl`) | Switch to Video KIS mode (describe-flow) |
| `3` (with `Ctrl`) | Switch to inspection / browse mode |

---

## Operator Mental Checklist (every query)

1. **Listen** to the full description first (or wait for the first 2-3 clues in final round).
2. **Type** a concrete visual phrase, not a paraphrase. "Red banner press conference" beats "official event".
3. **Scan** the top 12 thumbnails - that is your visible top-k.
4. **If nothing fits**: add an OCR keyword filter or switch to SigLIP.
5. **Before submitting**: hover-preview the candidate; verify the video timeline.
6. **Submit**. Watch the response.
7. **If wrong**: don't panic. Adjust ONE variable, try again.
8. **Between queries**: `Ctrl + Shift + R` always.

## Anti-patterns to Avoid

- Submitting from the **first** thumbnail without scanning.
- Forgetting to **clear filters** from the previous query.
- **Typing in English** when the OCR is in Vietnamese - flip the mode.
- **Mis-reading the keyframe id** (`0042` vs `0142`). Always read the inspector value.
- **Trusting hover preview alone** on still scenes - scrub the timeline.

## When to Use Smart Path

Use `Shift + Enter` (smart path with LLM rerank) when:
- Fast path returned > 8 visually distinct candidates and none feel right.
- Query contains abstract terms ("important meeting", "famous person") that need expansion.
- You are early in the final-round budget and can afford 1-2 s.

Avoid smart path when:
- The query is very visual and concrete (smart adds latency for no gain).
- You are in the last 30 s of the budget.

---

*Last updated: 2026-05-11. Shortcuts are PROPOSED until the UI ships in Phase 1; they may shift slightly but the philosophy stays.*
