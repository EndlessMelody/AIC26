---
trigger: glob
globs:
  [
    "frontend/**/*.ts",
    "frontend/**/*.tsx",
    "frontend/**/*.js",
    "frontend/**/*.jsx",
    "frontend/**/*.json",
    "frontend/**/*.scss",
    "frontend/**/*.css",
  ]
description: Frontend rules - Next.js + Once UI design system
---

# Frontend UI Rules - Once UI

## Stack

- **Next.js 14+** with the **App Router**.
- **TypeScript strict mode** (no `any`, no implicit returns).
- **Once UI** (<https://once-ui.com>) as the **only** design system. No Tailwind, no shadcn/ui, no MUI.
- **Lucide** for icons (or Once UI's `<Icon>` when an equivalent exists).
- **TanStack Query** for server state, **Zustand** for client state.
- **Vitest** + **React Testing Library** + **Playwright** for tests.

## Core Philosophy

You are a **Design Engineer**. We use Once UI for its semantic layout engine and design tokens.

- **Priority 1 - Semantic clarity.** Use high-level atoms to build layouts and styles: `<Column>`, `<Row>`, `<Grid>`, `<Heading>`, `<Text>`.
- **Priority 2 - Token consistency.** Never use hex codes. Prefer Once UI props. If extra customisation is needed, use inline styles - sparingly.
- **Priority 3 - Always scan for existing components.** Once UI ships many generic, flexible, customisable components. The ones you create are mostly product-specific. Put them in a single folder with a barrel `index.ts`. Build them from Once UI primitives. Use inline styles sparingly when Flex props don't cover a case. If excessive overrides or state-selectors are needed, use a standalone SCSS module. Components should almost always be fluid by default - either fitting content or spanning 100%. Spread `<Row>` / `<Column>` / `<Grid>` props on the wrapper so size and style can be overridden from the outside.
- **Priority 4 - No "utility noise".** Avoid Tailwind classes and tools that are not part of the project.

## Component & Layout Rules

### Structure

- **Never use `<div>`.** Use `<Column>` for vertical stacking, `<Row>` for horizontal, `<Grid>` for equally sized and distributed elements.
- The `horizontal` and `vertical` props on `<Row>` / `<Column>` simplify flex layouts. They apply utility classes behind the scenes and keep the main axis consistent. `horizontal` always sets the content to `"start" | "center" | "end" | "between" | "around"` regardless of direction. Same for `vertical`.
- Use the `center` shorthand to centre children on both axes.
- `position="relative"` is the default for `<Row>`, `<Column>`, `<Grid>`. Only add `position` to override it.
- Use `maxWidth` with `"xs" | "s" | "m" | "l" | "xl"` for page content (header, main container, ...) or a number (REM) for fixed widths. `maxWidth` / `maxHeight` automatically add `fillWidth` / `fillHeight` for fluidity.

### Spacing

- Use `gap`, `padding`, `margin`, or shorthands (`paddingX`, `marginTop`, ...). Values: `SpacingToken` (`"16"`, `"24"`, `"32"`, ...) or a number = REM.
- Use `gap="-1"` to collapse stacked borders.
- Use responsive paddings sparingly - only when distances should collapse on smaller screens. For page paddings, `paddingX="l"` makes sense. For smaller spacings, static values (`"4"`, `"8"`, `"16"`, ...) are usually fine.

### Sizing

- Use `fillWidth` / `fillHeight` instead of `w-full` / `h-full`.
- `fill` is shorthand for both. They automatically add `minWidth="0"` / `minHeight="0"` if not specified.

### Text

- Use `<Heading>` and `<Text>` with the `variant` prop (`"display-strong-s"`, `"body-default-m"`, ...).
- A nested `<Text>` inherits the parent variant.
- Override weight or size with `weight` (`"default" | "strong"`) and `size` (`"xs" | "s" | "m" | "l" | "xl"`).
- Align text with the `align` prop on `<Text>`, `<Heading>`, `<Row>` or `<Column>` (this sets `text-align`, NOT flex alignment).

### Colors

- Use the `background` + `onBackground` and `solid` + `onSolid` prop pairs for background + text (e.g. `background="neutral-medium" onBackground="neutral-weak"`) to ensure dark-mode compatibility.
- `background` = general-purpose, low-contrast surfaces. `solid` = high-contrast, usually interactive (e.g. button background).
- `background` has extra values: `"page"`, `"surface"`, `"overlay"`. They behave differently by theme. The main site background is usually `"page"`; large layout elements (headers, sidebars) are `"surface"` (or `"page"` depending on aesthetics).

### Components & Defaults

- Most Once UI components are wrapped in a `<Column>` or `<Row>` and spread Flex props on the outer element, so paddings / margins / borders can be overridden externally.
- Several shorthands exist on `<Row>` / `<Column>` / `<Grid>`. Example: `border="neutral-alpha-medium"` applies a `1px solid` border if `borderWidth` / `borderStyle` are not set. `position="sticky"` applies `top="0"` if not set. Inspect `Flex` and `Grid` props to learn which are necessary and which aren't.

### Responsive Design

- Use the `s`, `m`, `l` breakpoint objects on `<Row>` / `<Column>` / `<Grid>` to override layouts and styles per breakpoint. Not all props are supported; inline styles inside the breakpoint object are: `<Row s={{ style: { ... } }} />`.
- Hide / show by breakpoint with the `hide` and `m={{ hide: false }}` props.
- Show / hide by theme with `dark` and `light` props. Important for `<Logo>` since SVGs don't change theme automatically.

## Anti-patterns - Never Do This

- `<div className="flex flex-col gap-4">` - **wrong**. Use `<Column gap="16">`.
- `style={{ color: "#FF0000" }}` - **wrong**. Use Once UI color tokens.
- Tailwind classes anywhere - **wrong**. Remove on sight.
- Mixing shadcn/ui or MUI - **wrong**. Only Once UI primitives.
- `align="center"` on a top-level layout element - it cascades `text-align: center` to ALL nested text. To centre the inner element, use `horizontal="center"` (which sets `justify-content` correctly).

## Global Preferences

- Prefer **Functional Components** + **TypeScript**.
- Accessibility is non-negotiable: ARIA labels, semantic tags. Use `tooltip` on `<IconButton>` when the action is not labelled, or when several buttons appear in a group.

## Design & Style

- Once UI has a unique, minimal aesthetic - vary by project but always emphasise scale, contrast, clarity, proportions.
- Build hierarchy by grouping elements and choosing spacings relative to element size.
- Once UI is **dark-mode-first** and aims for very high quality - think Vercel, Linear, Raycast.
- Style is grounded, simple, performant. Motion comes from atomic component interactions, not disruptive layout-shifting animations.

## Recommendations

- Recommended size for `<Button>` and `<IconButton>` is `m`. Only diverge for spacious or very compact UI.
- Use responsive spacings only when distances must collapse on small screens. Most card / group spacings are static. Responsive spacings are for large layout elements (e.g. page content) where 40 px desktop looks good but feels enormous on mobile.

## Competition-Critical UX

The operator is racing the clock. Everything must be optimised for raw speed.

- **Keyboard-first**: every primary action has a shortcut. Show shortcuts inside `tooltip` on `<IconButton>` and as a `<Tag>` on `<Button>`.
- **Command palette** (`Cmd/Ctrl + K`) to jump between actions, queries, submit. Build it from Once UI primitives + a custom focus trap.
- **Result grid**: virtualised (e.g. `@tanstack/react-virtual`) so 10k thumbnails do not freeze the browser. Wrap items in `<Grid>` with a custom virtual scroller.
- **Hover preview**: hovering a keyframe plays a 2-3s clip from the source video.
- **One-keystroke submit**: pressing `Enter` on a selected frame submits to the organiser's server.
- **Undo / history**: keep the last N queries and selections so the operator can backtrack instantly.
- **Latency badge**: show query duration in milliseconds inside a `<Tag>`; the operator uses it to tune queries.
- **Multi-pane layout**: result grid (left) + selected keyframe inspector (right). Use `<Row fillWidth>` + two `<Column>` children with explicit `maxWidth`.

## Project Layout

```
frontend/
├── app/                       # App Router pages
│   ├── (search)/              # main search workspace
│   ├── submit/                # submission view
│   ├── layout.tsx             # OnceUIProvider + theme + shortcuts provider
│   └── page.tsx
├── components/                # product-specific components (Once UI based)
│   ├── search/                # SearchBar, ResultGrid, KeyframeCard, FilterPanel
│   │   ├── SearchBar.tsx
│   │   ├── ResultGrid.tsx
│   │   ├── KeyframeCard.tsx
│   │   ├── FilterPanel.tsx
│   │   └── index.ts           # barrel export
│   ├── video/                 # VideoPlayer, Timeline, FrameStrip
│   ├── submission/            # SubmissionPanel, ResultRow
│   └── shortcuts/             # KeyboardShortcuts provider + cheat sheet
├── lib/                       # api client, types, hooks, stores
│   ├── api.ts
│   ├── shortcuts.ts
│   ├── stores/                # Zustand stores
│   └── queries/               # TanStack Query hooks
├── styles/                    # global SCSS (variables, breakpoints, resets)
└── public/
```

## Conventions

- **Server Components by default.** Mark client components with `"use client"` only when needed (interactivity, hooks, browser APIs).
- Co-locate test files: `Component.test.tsx` next to `Component.tsx`.
- Absolute imports from `@/` (configure `paths` in `tsconfig.json`).
- Component file names: `PascalCase.tsx`. Hooks: `useCamelCase.ts`. Utilities: `camelCase.ts`.
- Every product component **must spread `<Row>` / `<Column>` / `<Grid>` props** on its outer wrapper so layout can be overridden from the outside.
- Standalone `.module.scss` files are allowed **only** when inline styles + Once UI props can't express the needed state selectors (e.g. `:focus-visible`, `:has(...)`).

## State & Data

- **Server state**: `@tanstack/react-query` (`useQuery`, `useMutation`). Never `fetch()` directly inside components.
- **Client state**: `zustand`. One store per feature. Store names: `useSearchStore`, `useShortcutsStore`, ...
- **URL state**: encode the active query + filters in `searchParams` so refresh and share-link work.

## API Communication

- Centralise API calls in `lib/api.ts` with a typed `apiClient` (Pydantic-equivalent runtime checks via `zod`).
- Every API request carries `X-Request-ID` (UUID v4) and `X-Client-Time` (ISO timestamp) headers for telemetry.
- Errors: surface a Once UI `<Banner>` with the server's `error_code` and a "Retry" action.

## Performance

- Thumbnails: `next/image` with `loading="lazy"` and a low-quality blur placeholder.
- Debounce search input at 150 ms; cancel in-flight requests on new keystrokes (`AbortController`).
- Memoise heavy `KeyframeCard`s with stable `keyframe_id` keys.
- Avoid React re-renders on hover: keep hover state in CSS via `:hover` instead of React state when possible.
- Profile with **React DevTools Profiler** + **Next.js bundle analyzer** before optimising.

## Testing

- **Unit / component**: Vitest + RTL. Mock TanStack Query with `QueryClientProvider`.
- **E2E**: Playwright. Required happy paths: search → select → submit, command palette flow, keyboard-only navigation.
- A11y check: `@axe-core/playwright` in at least one E2E test.

## Bootstrap (Phase 1)

```powershell
# 1. Scaffold Next.js (no Tailwind!)
npx create-next-app@latest . --typescript --app --eslint --src-dir=false --import-alias "@/*" --no-tailwind

# 2. Install Once UI
npm install @once-ui-system/core
# (consult https://once-ui.com for the latest install + provider setup)

# 3. Wrap root layout with OnceUIProvider in app/layout.tsx
```

## References

- Once UI documentation: <https://once-ui.com>
- Once UI GitHub: <https://github.com/once-ui-system/nextjs-starter>
- Next.js App Router: <https://nextjs.org/docs/app>
