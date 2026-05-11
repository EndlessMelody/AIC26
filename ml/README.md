# ML Pipeline (Placeholder)

This folder will host the multimodal extraction and indexing pipeline.

It is intentionally left as a placeholder for now - implementation will start in Phase 1
(see `docs/03-timeline-milestones.md`).

## Planned Layout

```
ml/
├── extractors/      # CLIP / SigLIP / BLIP-2 / OCR / ASR / object detection
├── indexing/        # FAISS / Qdrant builders, BM25 builder
├── rerank/          # LLM rerank, cross-encoder rerank, RRF fusion
└── utils/           # I/O helpers, checkpoint handling, manifest writers
```

See `.windsurf/rules/python-ml.md` for the conventions to follow when this gets implemented.
