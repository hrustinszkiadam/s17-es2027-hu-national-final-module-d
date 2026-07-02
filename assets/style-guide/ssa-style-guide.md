# SkillShare Academy - Design Guide

Design system reference for connected sites. All values are taken directly from the live codebase.

---

## 1. Aesthetic Direction

**Theme:** "Nova Academy" - dark premium by default, with an optional **light** theme (cool grey page, white cards, same emerald/amber accents).
**Mood:** Modern SaaS / developer-tool. Think Vercel or Linear, not a traditional school portal.
**Key traits:** Deep navy backgrounds (dark) or soft blue-grey canvas (light), glowing emerald accents, amber highlights, crisp geometric typography, subtle atmospheric depth.

---

## 2. Logo

**File:** `src/assets/ssa-logo.svg`
**Dimensions:** 782 × 280 (aspect ratio ~2.8:1 - always use `width: auto` with a fixed height)
**Colors in the SVG:** white wordmark, `#09C273` emerald icon mark, `#FEDF48` yellow accent dot - all align with the design system palette.

### Usage

| Context                           | Height | Width  |
| --------------------------------- | ------ | ------ |
| Header (navbar)                   | `32px` | `auto` |
| Auth page (login / register form) | `56px` | `auto` |
| Email / external                  | `48px` | `auto` |

### Header (React)

```jsx
import ssaLogo from "../../assets/ssa-logo.svg";

<NavLink to="/" className={styles.logo}>
  <img src={ssaLogo} alt="SkillShare Academy" />
</NavLink>;
```

```css
.logo {
  display: flex;
  align-items: center;
  flex-shrink: 0;
  transition: opacity 0.2s ease;
}
.logo img {
  height: 32px;
  width: auto;
}
.logo:hover {
  opacity: 0.85;
}
```

### Auth form (React)

```jsx
import ssaLogo from "../../assets/ssa-logo.svg";

<img src={ssaLogo} alt="SkillShare Academy" className={styles.logo} />;
```

```css
.logo {
  height: 56px;
  width: auto;
  margin: 0 auto;
}
```

### Rules

- ✅ On **dark** theme, use the default logo - white wordmark on dark surfaces
- ✅ On **light** theme (`[data-theme="light"]`), use the **dark-wordmark** variant (e.g. `ssa-logo-light.svg`) so the logo stays visible on `#ffffff` / `#eef2fb`
- ❌ Do not use the white wordmark SVG on light backgrounds - it will be invisible (see [Light theme](#light-theme))
- ✅ Keep `width: auto` - never set both dimensions simultaneously
- ✅ Always include `alt="SkillShare Academy"`
- ❌ Do not apply `filter`, `color`, or CSS tint - the SVG has its own brand colors
- ❌ Do not crop, recolor, or separate the icon mark from the wordmark
- ❌ Do not place the **dark-theme** (white) wordmark on backgrounds lighter than `--color-bg-surface` (`#0d1526`) without switching to the light-background logo asset

---

## 3. Color System

All colors are defined as CSS custom properties in `index.css`. Use the variables - never hardcode hex values.

### Backgrounds (darkest → lightest)

| Variable              | Value     | Use                                              |
| --------------------- | --------- | ------------------------------------------------ |
| `--color-bg-dark`     | `#040810` | Deepest layer (header underlay, modals backdrop) |
| `--color-bg`          | `#070d1b` | Page / body background                           |
| `--color-bg-surface`  | `#0d1526` | Cards, panels                                    |
| `--color-bg-elevated` | `#131e35` | Inputs, stat cells, nested elements              |

### Brand

| Variable                 | Value                   | Use                                                  |
| ------------------------ | ----------------------- | ---------------------------------------------------- |
| `--color-primary`        | `#10b981`               | Emerald - primary actions, active states, highlights |
| `--color-primary-dark`   | `#059669`               | Gradient end, hover darkening                        |
| `--color-primary-glow`   | `rgba(16,185,129,0.22)` | Box-shadow glow, focus rings                         |
| `--color-secondary`      | `#f59e0b`               | Amber - credits, badges, secondary actions           |
| `--color-secondary-dark` | `#d97706`               | Gradient end for amber buttons                       |
| `--color-secondary-glow` | `rgba(245,158,11,0.2)`  | Amber glow                                           |
| `--color-accent`         | `#818cf8`               | Indigo - tertiary decorative use only                |

### Semantic

| Variable             | Value                 | Use                         |
| -------------------- | --------------------- | --------------------------- |
| `--color-success`    | `#10b981`             | Same as primary             |
| `--color-warning`    | `#f59e0b`             | Same as secondary           |
| `--color-error`      | `#f43f5e`             | Errors, destructive actions |
| `--color-error-glow` | `rgba(244,63,94,0.2)` | Error glow                  |

### Text

| Variable                 | Value     | Use                           |
| ------------------------ | --------- | ----------------------------- |
| `--color-text`           | `#e8edf5` | Primary body text             |
| `--color-text-secondary` | `#8899b4` | Labels, descriptions, meta    |
| `--color-text-muted`     | `#4a5a72` | Placeholders, disabled states |

### Borders

| Variable                | Value                    | Use                           |
| ----------------------- | ------------------------ | ----------------------------- |
| `--color-border`        | `rgba(255,255,255,0.07)` | Default card/input borders    |
| `--color-border-subtle` | `rgba(255,255,255,0.04)` | Table row dividers            |
| `--color-border-hover`  | `rgba(16,185,129,0.45)`  | Emerald border on hover/focus |

### Light theme

Set **`data-theme="light"`** on the root element (`<html>`) to activate the light palette (default is dark). The Module D LMS reference (`04-module-d-frontend-solution`) persists the user's choice in **`localStorage`** (key **`ssa-theme`**: `dark` | `light`) so reloads keep the same theme.

**Brand tokens** (`--color-primary`, `--color-secondary`, semantic colors, `--color-border-hover`) stay the same as dark mode so buttons, links, and accents stay on-brand. **Surfaces, text, borders, and shadows** are overridden for a cool, paper-like UI on a soft blue-grey page.

#### Backgrounds (light)

| Variable              | Value     | Use                                     |
| --------------------- | --------- | --------------------------------------- |
| `--color-bg-dark`     | `#dce4f0` | Deepest layer / chrome tints            |
| `--color-bg`          | `#eef2fb` | Page / body background                  |
| `--color-bg-surface`  | `#ffffff` | Cards, panels, chapter rows             |
| `--color-bg-elevated` | `#e4ecf7` | Inputs, theme toggle, elevated controls |

#### Text (light)

| Variable                 | Value     | Use                                                  |
| ------------------------ | --------- | ---------------------------------------------------- |
| `--color-text`           | `#0f1829` | Primary body and headings                            |
| `--color-text-secondary` | `#3d5070` | Descriptions, secondary UI                           |
| `--color-text-muted`     | `#8899b4` | Muted meta (same hue family as dark, works on white) |

#### Borders & shadows (light)

| Variable                | Value                                                              | Notes                                                                                  |
| ----------------------- | ------------------------------------------------------------------ | -------------------------------------------------------------------------------------- |
| `--color-border`        | `rgba(0,0,0,0.08)`                                                 | Default borders (dark ink, not white glow)                                             |
| `--color-border-subtle` | `rgba(0,0,0,0.04)`                                                 | Subtle dividers                                                                        |
| `--shadow-card`         | `0 4px 24px rgba(0,0,0,0.08), 0 1px 0 rgba(255,255,255,0.8) inset` | Softer elevation + light top highlight                                                 |
| `--shadow-glow`         | _unchanged formula_                                                | Uses `--color-primary-glow`; drop shadow uses `rgba(0,0,0,0.1)` instead of heavy black |

#### Body atmosphere (light)

The same three radial gradients as dark mode are applied on **`[data-theme="light"] body`**, with **slightly higher opacity** so the emerald / indigo / amber tints remain visible on the pale background:

```css
[data-theme="light"] body {
  background-image: radial-gradient(
      ellipse at 15% 40%,
      rgba(16, 185, 129, 0.08) 0%,
      transparent 55%
    ), radial-gradient(
      ellipse at 85% 10%,
      rgba(129, 140, 248, 0.07) 0%,
      transparent 50%
    ), radial-gradient(ellipse at 60% 90%, rgba(245, 158, 11, 0.05) 0%, transparent
        45%);
}
```

#### Sticky header (light)

The header bar uses the **page tint** instead of dark glass:

```css
[data-theme="light"] .site-header {
  background: rgba(238, 242, 251, 0.85);
}
```

Keep **`backdrop-filter: blur(20px)`** and the bottom border (`var(--color-border)`) as in dark mode.

#### Component-specific overrides (light)

- **Muted chapter credits pill** (`.chapter-credits--muted`): switch from white translucent fills to **black** translucent: `background: rgba(0,0,0,0.04)`, `border-color: rgba(0,0,0,0.08)` so it reads on white cards.

#### Logo in light theme

The default **`ssa-logo.svg`** uses a **white** wordmark and is intended for **dark** surfaces. On light theme, swap to a **dark-wordmark** asset (e.g. **`ssa-logo-light.svg`** in the reference app - filename means "for light backgrounds", not "light mode asset color"). Rules: same dimensions and `alt` text; no CSS filters.

---

## 3. Typography

Import in `<head>` before any stylesheets:

```html
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
  href="https://fonts.googleapis.com/css2?family=Syne:wght@400;500;600;700;800&family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500;0,9..40,600;1,9..40,300&display=swap"
  rel="stylesheet"
/>
```

| Variable         | Font        | Use                                               |
| ---------------- | ----------- | ------------------------------------------------- |
| `--font-display` | **Syne**    | Headings (h1-h3), logo text, labels, stat numbers |
| `--font-body`    | **DM Sans** | All body copy, buttons, inputs, paragraphs        |

### Type Scale

| Element       | Size           | Weight  | Notes                               |
| ------------- | -------------- | ------- | ----------------------------------- |
| `h1`          | `2.4rem`       | 700     | `letter-spacing: -0.02em`           |
| `h2`          | `1.8rem`       | 700     | `letter-spacing: -0.02em`           |
| `h3`          | `1.3rem`       | 600     | `letter-spacing: -0.02em`           |
| Page title    | `2rem`         | 700     |                                     |
| Section label | `0.8rem`       | 600     | uppercase, `letter-spacing: 0.08em` |
| Body          | `1rem`         | 400     | `line-height: 1.6`                  |
| Small / meta  | `0.875-0.9rem` | 400-500 |                                     |
| Micro label   | `0.72rem`      | 500     | uppercase, `letter-spacing: 0.06em` |

**Never use:** Inter, Roboto, Arial, system-ui, or any generic system font stack.

---

## 4. Spacing & Shape

### Border Radius

| Variable        | Value     | Use                                      |
| --------------- | --------- | ---------------------------------------- |
| `--radius-sm`   | `0.4rem`  | Buttons, inputs, small badges            |
| `--radius`      | `0.75rem` | Cards, panels, toasts                    |
| `--radius-lg`   | `1.25rem` | Auth form card                           |
| `--radius-xl`   | `1.75rem` | Large modals (reserved)                  |
| `2rem` / `99px` | -         | Pills (credits badge, progress bar ends) |

### Page Layout

```css
main {
  padding: 2.5rem max(calc((100vw - 1200px) / 2), 1.75rem);
  display: flex;
  flex-direction: column;
  gap: 2rem;
}
```

Max content width: **1200px**, centered, with `1.75rem` minimum side padding on narrow viewports.

---

## 5. Shadows & Glow

| Variable         | Value                                                              | Use                     |
| ---------------- | ------------------------------------------------------------------ | ----------------------- |
| `--shadow-card`  | `0 4px 32px rgba(0,0,0,0.5), 0 1px 0 rgba(255,255,255,0.04) inset` | Every `.card` element   |
| `--shadow-glow`  | `0 0 30px var(--color-primary-glow), 0 4px 16px rgba(0,0,0,0.4)`   | Card hover state        |
| `--shadow-amber` | `0 0 30px var(--color-secondary-glow)`                             | Amber-accented elements |

**Glow on hover** is the signature interaction - border transitions to `--color-border-hover` and `--shadow-glow` is applied.

---

## 6. Background Atmosphere

The body uses a fixed gradient mesh to create depth. Apply to the root `body`:

```css
body {
  background-color: var(--color-bg);
  background-image: radial-gradient(
      ellipse at 15% 40%,
      rgba(16, 185, 129, 0.06) 0%,
      transparent 55%
    ), radial-gradient(
      ellipse at 85% 10%,
      rgba(129, 140, 248, 0.06) 0%,
      transparent 50%
    ), radial-gradient(ellipse at 60% 90%, rgba(245, 158, 11, 0.04) 0%, transparent
        45%);
  background-attachment: fixed;
  -webkit-font-smoothing: antialiased;
}
```

---

## 7. Components

### Card

The base building block. Use the global `.card` class.

```css
.card {
  background: var(--color-bg-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius);
  padding: 1.75rem;
  box-shadow: var(--shadow-card);
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
}
.card:hover {
  border-color: var(--color-border-hover);
  box-shadow: var(--shadow-glow);
}
```

### Buttons

All buttons use the global `.btn` class plus a modifier.

| Class                             | Appearance                     | Use                 |
| --------------------------------- | ------------------------------ | ------------------- |
| `.btn.btn-primary`                | Emerald gradient + glow shadow | Primary CTA         |
| `.btn.btn-secondary`              | Amber gradient + glow shadow   | Secondary CTA       |
| `.btn.btn-outline`                | Transparent + emerald border   | Tertiary / ghost    |
| `.btn.btn-danger`                 | Rose/red gradient              | Destructive actions |
| `.btn.btn-disabled` / `:disabled` | Muted grey, no pointer         | Unavailable         |

All buttons: `border-radius: var(--radius-sm)`, `font-family: var(--font-body)`, `font-weight: 500`.
Hover effect: `transform: translateY(-2px)` + intensified box-shadow.

### Inputs & Selects

```css
input,
select,
textarea {
  background: var(--color-bg-elevated);
  border: 1.5px solid var(--color-border);
  border-radius: var(--radius-sm);
  color: var(--color-text);
  padding: 0.65rem 1rem;
}
/* Focus */
:focus {
  border-color: var(--color-primary);
  box-shadow: 0 0 0 3px var(--color-primary-glow);
  outline: none;
}
```

Labels: `font-size: 0.9rem`, `font-weight: 500`, `color: var(--color-text-secondary)`, `letter-spacing: 0.02em`.

### Navigation Header

- Height: `64px`, `position: sticky; top: 0; z-index: 100`
- Background: `rgba(7, 13, 27, 0.85)` + `backdrop-filter: blur(20px)`
- Border bottom: `1px solid var(--color-border)`
- Active nav link: `color: var(--color-primary)`, background `rgba(16,185,129,0.1)`
- Mobile breakpoint: **900px** - collapse to hamburger menu

### Status / Severity Badges

Use translucent colored chips, never solid fills:

```css
/* Success */
background: rgba(16, 185, 129, 0.1);
color: #34d399;
border: 1px solid rgba(16, 185, 129, 0.25);

/* Warning / Pending */
background: rgba(245, 158, 11, 0.1);
color: #fbbf24;
border: 1px solid rgba(245, 158, 11, 0.25);

/* Error / Rejected */
background: rgba(244, 63, 94, 0.1);
color: var(--color-error);
border: 1px solid rgba(244, 63, 94, 0.25);
```

Border-radius: `var(--radius-sm)`. Font: `0.82rem`, `font-weight: 600`, `letter-spacing: 0.03em`.

### Section Labels

Uppercase small-caps style used above content sections:

```css
font-family: var(--font-display);
font-size: 0.8rem;
font-weight: 600;
text-transform: uppercase;
letter-spacing: 0.08em;
color: var(--color-text-secondary);
border-bottom: 1px solid var(--color-border);
padding-bottom: 0.5rem;
```

### Progress Bar

```css
/* Track */
background: var(--color-bg-elevated);
border: 1px solid var(--color-border);
border-radius: 99px;
height: 6px;

/* Fill */
background: linear-gradient(
  90deg,
  var(--color-primary-dark),
  var(--color-primary),
  #34d399
);
box-shadow: 0 0 10px var(--color-primary-glow);
border-radius: 99px;
```

### Metric / Stat Numbers

Large numbers use Syne + gradient text fill:

```css
font-family: var(--font-display);
font-size: 2.5rem;
font-weight: 800;
letter-spacing: -0.04em;
background: linear-gradient(135deg, var(--color-primary), #34d399);
-webkit-background-clip: text;
-webkit-text-fill-color: transparent;
background-clip: text;
```

Labels below: `0.82rem`, uppercase, `letter-spacing: 0.08em`, `color: var(--color-text-secondary)`.

### Error / Service Unavailable Banner

```css
background: rgba(244, 63, 94, 0.06);
border: 1px solid rgba(244, 63, 94, 0.25);
border-radius: var(--radius);
padding: 1.5rem 2rem;
```

Title: `color: var(--color-error)`, `font-family: var(--font-display)`, `font-weight: 600`.

### Loading Spinner

```css
.ring {
  width: 40px;
  height: 40px;
  border: 3px solid var(--color-border);
  border-top-color: var(--color-primary);
  border-radius: 50%;
  animation: spin 0.8s linear infinite;
}
@keyframes spin {
  to {
    transform: rotate(360deg);
  }
}
```

### Toast Notification

```css
position: fixed;
left: 1.25rem;
bottom: 1.25rem;
z-index: 9999;
padding: 1rem 1.5rem;
background: linear-gradient(135deg, #f43f5e, #be123c);
border-radius: var(--radius);
box-shadow: 0 8px 32px var(--color-error-glow);
animation: toast-in 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
```

### Auth Page

Full-viewport centered layout. Form card:

```css
background: var(--color-bg-surface);
border: 1px solid var(--color-border);
border-radius: var(--radius-lg);
padding: 2.75rem 2.5rem;
max-width: 460px;
```

Decorative top-line accent on the card:

```css
form::before {
  content: "";
  position: absolute;
  top: 0;
  left: 10%;
  right: 10%;
  height: 2px;
  background: linear-gradient(
    90deg,
    transparent,
    var(--color-primary),
    transparent
  );
}
```

Page background spotlight:

```css
background: radial-gradient(
    ellipse at 50% -10%,
    rgba(16, 185, 129, 0.18) 0%,
    transparent 60%
  ), radial-gradient(
    ellipse at 80% 110%,
    rgba(129, 140, 248, 0.1) 0%,
    transparent 50%
  ), var(--color-bg);
```

---

## 8. Tables

```css
table {
  background: var(--color-bg-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius);
  overflow: hidden;
}
thead {
  background: var(--color-bg-elevated);
}
thead th {
  font-family: var(--font-display);
  font-size: 0.8rem;
  font-weight: 600;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--color-text-secondary);
}
tr {
  border-bottom: 1px solid var(--color-border-subtle);
}
tr:hover {
  background: var(--color-bg-elevated);
}
th,
td {
  padding: 0.85rem 1.25rem;
}
```

---

## 9. Motion

**Principle:** one well-orchestrated interaction beats many scattered ones. Reserve animation for high-impact moments.

| Interaction        | Technique                                                     |
| ------------------ | ------------------------------------------------------------- |
| Button hover       | `transform: translateY(-2px)` + shadow intensify, `0.2s ease` |
| Card hover         | `border-color` + `box-shadow` transition, `0.3s ease`         |
| Input focus        | `box-shadow` ring expansion, `0.25s ease`                     |
| Page load elements | `animation-delay` staggered fade-in                           |
| Toast entry        | `cubic-bezier(0.34, 1.56, 0.64, 1)` - spring overshoot        |
| Progress bar fill  | `0.6s cubic-bezier(0.4, 0, 0.2, 1)`                           |
| Spinner            | `0.8s linear infinite` rotate                                 |

Use **Framer Motion** (`framer-motion`) for complex sequenced animations if the site uses React.

---

## 10. Responsive Breakpoints

| Breakpoint  | Width      | Notes                                     |
| ----------- | ---------- | ----------------------------------------- |
| Mobile      | `< 768px`  | Single column, stacked layout             |
| Tablet      | `≥ 768px`  | 2-column grids unlock                     |
| Desktop nav | `≥ 900px`  | Full header nav, hide hamburger           |
| Max content | `≥ 1200px` | 3-column grids unlock, centered at 1200px |

---

## 11. Accessibility

- Maintain **4.5:1** contrast ratio minimum for body text against card backgrounds (dark: `#e8edf5` on `#0d1526`; light: `#0f1829` on `#ffffff`)
- `--color-primary` (`#10b981`) on `--color-bg-surface` (`#0d1526` dark / `#ffffff` light) - verify large/small text per WCAG when using green on white
- All interactive elements must have `:focus-visible` styles (use the emerald ring: `box-shadow: 0 0 0 3px var(--color-primary-glow)`)
- Use `aria-current="page"` on active nav links (React Router NavLink does this automatically)
- Mobile popover/sidebar must trap focus when open

---

- ❌ No purple - the primary has moved to emerald. Do not reintroduce `#7c3aed`
- ❌ Do not mix dark-theme hex backgrounds with light-theme text (or vice versa) - use **`[data-theme="light"]`** CSS variables for the full light surface stack (`#eef2fb` / `#ffffff`)
- ❌ No solid-fill status badges - always use translucent chip style
- ❌ No Inter, Roboto, Arial, or system fonts
- ❌ No box shadows without blur (flat shadows break the depth language)
- ❌ No full-opacity borders - dark theme: use **`rgba(255,255,255,0.07)`** (or lower); light theme: use **`rgba(0,0,0,0.08)`** per tokens
- ❌ No purple-on-white gradients - avoid the generic "AI aesthetic"
