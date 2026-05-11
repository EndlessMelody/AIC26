---
description: Format and submit a result to the organizer's grading server
---

Submit a single query result to the AI Challenge grading server.
Final endpoint and format will be announced by organizers; this is a placeholder pipeline.

1. Validate the submission payload against the schema.
// turbo
```bash
python scripts/submit.py --validate --file artifacts/submission-format/example.json
```

2. Dry run (prints what would be sent, no network call).
// turbo
```bash
python scripts/submit.py \
  --query-id Q01 \
  --video-id L01_V001 \
  --frame-idx 12450 \
  --dry-run
```

3. Real submission.
```bash
python scripts/submit.py \
  --query-id Q01 \
  --video-id L01_V001 \
  --frame-idx 12450 \
  --server $env:AICHALLENGE_SUBMIT_URL \
  --token $env:AICHALLENGE_TEAM_TOKEN
```

4. Check the response and log it.
// turbo
```bash
python scripts/submit.py --tail-log
```
