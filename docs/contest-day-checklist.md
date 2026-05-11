# Contest-Day Checklist

A single source of truth for what to do before, during, and after each round.
**Print this and bring a paper copy.** Phones may be locked.

---

## T-24 h - Code Freeze

- [ ] Tag a release branch: `git tag release/<round>-<date>`
- [ ] All open PRs merged or postponed
- [ ] `pytest tests/` green
- [ ] Frontend build green: `npm run build --prefix frontend`
- [ ] Submission script dry-run passes
- [ ] Telemetry sink (logs file or service) confirmed working

## T-12 h - Dry Run

- [ ] One full dry run with a synthetic query against the full index
- [ ] Latency telemetry: P95 < 250 ms on the fast path
- [ ] Operator does a 5-query mock with timing
- [ ] Coach reviews scores and identifies any UX friction

## T-2 h - Hall Arrival

- [ ] Bring: laptop + charger + spare charger + ethernet cable + mobile hotspot
- [ ] Bring: printed `operator-cheatsheet.md` + printed `risk-register.md` top-5
- [ ] Bring: water, snacks, paper notebook + pens
- [ ] Charge phone to 100 %

## T-30 min - System Boot

- [ ] Open the laptop, plug power, plug ethernet
- [ ] Start backend: confirm `/api/v1/health/ready` returns 200
- [ ] Start frontend: confirm UI loads at <http://localhost:3000>
- [ ] Verify FAISS index loaded (check log line "Retrieval service ready")
- [ ] Verify model cache warm: encode the dummy phrase "test" and time it (< 100 ms target)
- [ ] Validate connectivity to BTC submission server: `curl $AICHALLENGE_SUBMIT_URL/health` or equivalent
- [ ] Sound check the secondary screen (if any)
- [ ] Brightness ~ 80 %; turn off screen savers, notifications, auto-update

## T-5 min - Operator Final Drill

- [ ] Operator runs **one** synthetic query end-to-end
- [ ] Confirms keyboard shortcuts work
- [ ] Confirms hover preview plays
- [ ] Confirms submission dry-run hits the BTC endpoint (NOT the real submit)
- [ ] Clear all client state: queries, filters, history
- [ ] Take 3 deep breaths

## During Each Query

### Coach
- [ ] Read the description aloud, slowly
- [ ] Start the timer (mental + visible)
- [ ] Track wrong-submission count for this query
- [ ] **At 60 % of the budget**: prompt the operator to commit unless very uncertain

### Operator
- [ ] Listen first, then type
- [ ] Use the **fast path** first; switch to smart path only if fast results are clearly wrong
- [ ] **Look at the video timeline preview** before submitting
- [ ] Confirm `video_id` and `frame_idx` match what is on screen
- [ ] Submit with `Enter`. Confirm jury response (correct / wrong).

### Secondary Operator
- [ ] Write down: which strategy worked, which failed, time-to-correct, # wrong attempts
- [ ] Watch for repeated failure modes (e.g. "OCR filter consistently wrong")

## Between Queries (10-15 s)

- [ ] Operator clears all filters and history (`Ctrl + Shift + R` or equivalent)
- [ ] Re-focus the search input
- [ ] Drink water
- [ ] Breathe

## End of Round

- [ ] Save all telemetry: `data/submissions.jsonl` archived + `logs/*.log` zipped
- [ ] Lead writes a one-paragraph retro into `progress.txt`
- [ ] Each member shares one observation in chat (within 1 h)
- [ ] Code stays frozen until the next planning session

## After Each Round - Same Day

- [ ] Backup all data + logs offline (USB drive or cloud)
- [ ] Compare local-eval predictions against the official correct answers (if released)
- [ ] Identify the top 5 failure modes for tomorrow

## After the Final Round

- [ ] Write a public retrospective in `progress.txt`
- [ ] Decide on open-sourcing (see Phase 6 in `docs/03-timeline-milestones.md`)
- [ ] Send a thank-you message to the organising committee
- [ ] Celebrate.

---

## Emergency Procedures

### If the backend crashes
1. Coach pauses the team (no submissions while system is down).
2. Engineer restarts: `make restart-backend` or `uvicorn backend.app.main:app`.
3. Verify `/api/v1/health/ready` returns 200 before resuming.
4. **Never push a code change during a round** unless the coach explicitly approves.

### If the network drops
1. Confirm: try `ping 8.8.8.8`. If fails, switch to mobile hotspot.
2. If both fail, keep working on queries; queue submissions locally.
3. When network is restored, flush queued submissions in order.

### If GPU OOM
1. Restart backend with `SEARCH_DEVICE=cpu` (slower but works).
2. Reduce `efSearch` to 32.
3. Skip the LLM rerank tier.
