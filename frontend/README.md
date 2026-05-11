# Frontend (Placeholder)

This folder will host the **Next.js 14 + Once UI** operator UI.

Once UI (<https://once-ui.com>) is the **only** design system we use - no Tailwind, no shadcn/ui.
The folder is intentionally a placeholder for now - implementation starts in Phase 1
(see `docs/03-timeline-milestones.md`).

## Planned Layout

```
frontend/
├── app/                       # App Router pages
│   ├── (search)/              # main search workspace
│   ├── submit/                # submission view
│   ├── layout.tsx             # OnceUIProvider + theme + shortcuts provider
│   └── page.tsx
├── components/                # product-specific components (Once UI based)
│   ├── search/                # SearchBar, ResultGrid, KeyframeCard, FilterPanel
│   ├── video/                 # VideoPlayer, Timeline, FrameStrip
│   ├── submission/            # SubmissionPanel, ResultRow
│   └── shortcuts/             # KeyboardShortcuts provider + cheat sheet
├── lib/                       # api client, types, hooks, stores
├── styles/                    # global SCSS (variables, breakpoints, resets)
└── public/
```

## Bootstrap (Phase 1)

```powershell
# 1. Scaffold Next.js (NO Tailwind - Once UI replaces it)
npx create-next-app@latest . --typescript --app --eslint --src-dir=false --import-alias "@/*" --no-tailwind

# 2. Install Once UI
npm install @once-ui-system/core

# 3. In app/layout.tsx, wrap children with OnceUIProvider (see Once UI docs)

# 4. Add dev tooling
npm install -D @types/node sass vitest @testing-library/react @playwright/test @axe-core/playwright
npm install @tanstack/react-query zustand @tanstack/react-virtual react-hook-form zod lucide-react
```

## Conventions

See `.windsurf/rules/frontend-ui.md` for the full Once UI ruleset:

- Never use `<div>` - use `<Column>`, `<Row>`, `<Grid>`.
- Never use hex colors or Tailwind classes - use Once UI tokens / props.
- Spread `<Row>` / `<Column>` props on every product component wrapper.
- Keyboard-first UX with a command palette is mandatory.
