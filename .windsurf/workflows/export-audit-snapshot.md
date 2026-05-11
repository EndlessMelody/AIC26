---
description: Bundle submissions + logs + config for a jury audit
---

Produce a self-contained snapshot the team can hand to the jury or archive offline.

1. Stop any running ingest job so the index does not change mid-export.
// turbo
```bash
# (Optional) check no python ingest process is running
Get-Process python -ErrorAction SilentlyContinue
```

2. Collect everything into `reports/audit/<timestamp>/`.
```bash
python scripts/export_audit_snapshot.py \
  --out reports/audit/$(Get-Date -Format yyyyMMdd_HHmm)
```

The snapshot includes:
- `submissions.jsonl` - every submission made
- `queries.jsonl` - every search request received
- `manifests/` - all index manifests (model name, hash, dim)
- `config.snapshot.toml` - effective settings at run time
- `git.txt` - current commit + branch + dirty status
- `versions.txt` - `pip list` and `npm ls --depth=0`

3. Zip and write a SHA-256 hash.
// turbo
```bash
python scripts/export_audit_snapshot.py --zip --hash
```

4. Move the zip to offline storage (USB drive) at the end of each round.

5. If the jury requests a specific query replay:
```bash
python scripts/export_audit_snapshot.py --replay QUERY_ID --out reports/audit/replay_QUERY_ID
```
