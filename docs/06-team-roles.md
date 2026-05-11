# Team Roles & Responsibilities

A competitive team needs clear ownership. Below are recommended roles for a 3-5 person team.

## Roles

### 1. Team Lead / Coach
- Owns the roadmap and weekly cadence.
- Final call on tech decisions.
- Single point of contact with organizers.
- Maintains `progress.txt` and `docs/03-timeline-milestones.md`.

### 2. ML / Retrieval Engineer
- Owns the embedding pipeline: keyframe, CLIP / SigLIP, OCR, ASR, objects.
- Builds and tunes FAISS / Qdrant indices.
- Runs evaluation harness; reports Recall@k and latency weekly.
- Owns `ml/` and `scripts/`.

### 3. Backend Engineer
- Owns the FastAPI server and any data services.
- Designs the API contract with the frontend lead.
- Owns Docker, deployment, observability.
- Owns `backend/`.

### 4. Frontend Engineer / Operator-UX
- Owns the Next.js app, keyboard shortcuts, command palette, video player.
- Conducts ergonomic testing with the contest operator.
- Owns `frontend/`.

### 5. Contest Operator (can be doubled with another role)
- The person physically driving the tool during the contest.
- Practises 5+ mock contests before each round.
- Knows every shortcut by heart.
- Collects feedback on the UI after every practice session.

## Cross-cutting Responsibilities
- **All members**: keep their portion of the codebase tested and documented.
- **All members** participate in mock contests as either operator or observer.
- **All members** read every organizer announcement within 24h.

## RACI Matrix (compact)
| Activity | Lead | ML | Backend | Frontend | Operator |
|---|---|---|---|---|---|
| Pipeline design | A | R | C | I | I |
| Index build | I | R | C | I | I |
| API design | A | C | R | C | I |
| UI design | A | I | C | R | C |
| Mock contests | A | C | C | C | R |
| Submission scripts | A | C | R | C | I |
| Final tuning | A | R | R | R | C |

R = Responsible, A = Accountable, C = Consulted, I = Informed.

## Communication
- **Daily**: short async update in chat (what did, blockers).
- **Weekly**: Friday demo + numbers.
- **Issue tracker**: GitHub Projects (or equivalent), one issue per task.

## Contest-Day Roles
On contest day, roles change:
- **Operator (Primary)** - drives the tool.
- **Operator (Secondary)** - reads the query aloud, takes notes, monitors the submission server response.
- **Coach** - watches the clock, decides when to submit on uncertain answers.
- **Engineers** - on standby for hot fixes only; do NOT change code mid-contest unless necessary.
