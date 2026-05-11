# CSV Submission Format (legacy / alternative)

Some past AI Challenge editions accepted CSV alongside JSON. This is a placeholder format until the 2026 spec confirms which is used.

## Columns

| Column | Type | Required | Notes |
|---|---|---|---|
| `query_id` | string | yes | e.g. `Q01` |
| `rank` | int | yes | 1-based |
| `video_id` | string | yes | e.g. `L01_V001` |
| `frame_idx` | int | one of frame_idx or timestamp_ms | absolute frame index |
| `timestamp_ms` | int | one of frame_idx or timestamp_ms | time from start in ms |
| `confidence` | float | no | range [0, 1] |

## Example

```csv
query_id,rank,video_id,frame_idx,timestamp_ms,confidence
Q01,1,L01_V001,12450,415000,0.87
Q01,2,L01_V001,12480,416000,0.71
Q01,3,L01_V003,8410,280333,0.55
```

## Notes

- One row per result, all rows for a query share the same `query_id`.
- File is named `<team_id>_<query_id>.csv` and uploaded via the BTC web form.
- Update this document with the exact 2026 spec when published.
