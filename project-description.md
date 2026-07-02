# Test Project Outline - Module D - LMS Frontend (Learning Site)

## Competition time

Competitors will have **3 hours** to complete this module.

## Introduction

Module D focuses on implementing a **frontend for the SkillShare Academy content service** - a separate **LMS (learning) site** where enrolled learners open a course, work through chapters in order, read rich lesson content, and complete end-of-chapter quizzes.

## General Description of Project and Tasks

SkillShare Academy (SSA) uses a **main backend** for accounts, enrollment, credits, and chapter completion, and a **content service** that stores and serves course metadata, chapter content blocks, media, and quizzes. **Module D** is only the **browser application** that talks to the **content service**.

Content service and the main backend are provided. The LMS must use the **same Bearer token** the learner received when signing in on the main SkillShare Academy platform (dashboard). Typically the dashboard opens the LMS with a **token in the query string**; the LMS frontend stores it and uses it on subsequent API calls. **Token lifetime:** The main backend issues tokens that expire **60 seconds** after login; expect `401 Unauthorized` after that until the user signs in again on the dashboard.

### Dashboard and LMS URLs

A fully working **SSA dashboard** application is supplied for assessment and development. It is deployed at:

`https://cXX-YYYY-dashboard.ssa.skillsit.hu`

(Use your competition `cXX` username and `YYYY` PIN.)

**Testing:** All seeded users use the password `password123` (for example **alice@example.com** / **password123**) when signing in on the dashboard for development and testing.

**Long-lived test token (~7 days):** To avoid the **60-second** expiry on dashboard login tokens while you develop, you can use this Bearer token for **alice@example.com** (same as in Module C). Append `?token=` plus the token to your LMS URL, or store it the way your app expects (e.g. `localStorage`).

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IlNTQSJ9.eyJzdWIiOiIxIiwiZXhwIjoxNzc1MTYyNzA0fQ.xGCNwuEthwy6iGWkS8FkCk5Wm9VYV7cLF41T6CLl_b0
```

**Hint:** For development and UI testing, we recommend opening the **Tailwind CSS & ShadCN UI Tutorial** course at **`/courses/tailwind-css-shadcn-ui-tutorial`**. It has the richest lesson content in the seed data (headings, paragraphs, lists, images, video, links, quizzes), so it is the best course to exercise every content block and layout rule. Enroll **alice@example.com** on that course in the dashboard if she is not already enrolled.

By default, **all navigation** from the dashboard to the LMS targets the competitor's **deployed** LMS frontend at:

`https://cXX-YYYY-module-c.ssa.skillsit.hu`

**Local development:** To use the **same dashboard** against a **locally running** LMS (e.g. Vite on `http://localhost:5173`), set the **`lmsSiteUrl`** entry in the browser's **localStorage** (on the dashboard origin) to your dev LMS base URL (no trailing slash). The dashboard uses this value so links to "open course / continue learning" go to your development site instead of the default deployed LMS. Remove or reset `lmsSiteUrl` to return to the default behaviour.

**Relationship to Module C:** Module C defines and implements the **content service** API and data model. Module D consumes **only that API** for all required LMS behaviour (course details, chapter content, quiz validation). The main backend still handles accounts and completion bookkeeping, but the **LMS frontend must not call the main backend's HTTP API** - the content service coordinates with the main backend where needed (e.g. when a quiz is passed).

**Base URL of the content service:** `https://cXX-YYYY-module-c.ssa.skillsit.hu` where `cXX` is your username and `YYYY` is your PIN code (see Module C handout for the exact pattern).

**API documentation:** OpenAPI specification for the content service is available in the `assets` directory: [`/assets/module-c/api/ssa-content-service-openapi.yaml`](/assets/module-c/api/ssa-content-service-openapi.yaml). It is the reference for all endpoints the LMS must call.

**Database:** Competitors do **not** have direct access to the content service database. Schema and behaviour are defined by the API documentation.

You must implement the frontend using a javascript **framework**. The application must be a **Single Page Application (SPA)**. **Routing must be handled by the framework.** Reloading a deep-linked URL must show the same view the user would see when navigating there inside the app (after authentication state is restored from storage), except for unsaved user-driven inputs.

## Requirements

The goal of this frontend is to give learners a clear interface to study course material and complete quizzes through the content service API.

The frontend must implement the following functional requirements:

- Error handling for relevant HTTP status codes (see [Error Handling](#error-handling))
- If the content service returns **`401 Unauthorized`** (any request: loaders, quiz submit, etc.), **redirect the browser to the main SSA dashboard** so the user can sign in again; see the `401` rule under [Error handling](#error-handling)
- Local storage for token persistence across reloads
- Course page with sequential chapter access and completion state
- Chapter page rendering all required content block types and the chapter quiz

### Design guidelines

The handout includes a **SkillShare Academy (SSA) design guide** and **graphic design assets** (reference images) for **both** the course page and the chapter page. Competitors must follow the design guide and match the provided visuals **as closely as practicable** (layout, hierarchy, spacing, color and typography where specified, and component treatment).

Where the design guide does not cover a detail (e.g. a specific content block or error state), extend the same patterns so the UI stays consistent. The implementation must remain **responsive** across screen sizes, including the video layout described for the chapter page below.

### Error handling

The content service can return various errors. The frontend must handle them and show **understandable** messages (not raw stack traces). At minimum, handle:

- `400 Bad Request` - Malformed request; inform the user briefly.
- `401 Unauthorized` - Missing, invalid, or expired token. **Redirect the user to the main SSA dashboard application** (use the dashboard base URL from [Dashboard and LMS URLs](#dashboard-and-lms-urls), e.g. `https://cXX-YYYY-dashboard.ssa.skillsit.hu`, typically the app root or the entry point given in the handout). **Full-page navigation** (`window.location` or equivalent) is required so the user leaves the LMS and can re-authenticate. Also, clear the stored LMS token before or as part of handling. Do not leave the user on the LMS with only an inline error.
- `403 Forbidden` - User not allowed to access the resource (e.g. chapter locked); explain that the chapter is not available yet.
- `404 Not Found` - Course or chapter not found; inform the user the content is unavailable.
- `500 Internal Server Error` - Server error; inform the user of a temporary problem.

Quiz validation may return application-specific payloads (e.g. quiz passed but chapter completion could not be recorded on the main platform). The UI must surface these cases as described in the OpenAPI / Module C docs.

### Pages

The following views must be implemented (exact path names may follow the reference):

#### Course page (`/courses/:slug`)

Loads course details via `GET /api/courses/:slug` with `Authorization: Bearer <token>`.

The page must include:

- **Course header:** title, description, difficulty, total chapters, total credits (as returned by the API).
- **Hero / image:** fetch the hero image from the SSA bucket: `https://bucket.ssa.skillsit.hu/<slug>.webp` (replace `<slug>` with the course slug from the API).
- **Chapter list:** all chapters in order, each with title, short description, credits, and **completed** state.
- **Sequential access:** only the first chapter, or a chapter whose **previous** chapter is completed, is **unlocked** (link to chapter). Locked chapters must be clearly indicated and **must not** navigate to the chapter view.
- **Completed chapters** must be visually distinct (e.g. badge or styling).

#### Chapter page (`/courses/:slug/chapters/:chapterId`)

Loads chapter content via `GET /api/courses/:slug/chapters/:chapterId` (Bearer required).

**The `content` array (lesson body):** The JSON body is a single **chapter payload** (not wrapped in an outer `chapter` object): see schema `ChapterContentResponse` in [`/assets/module-c/api/ssa-content-service-openapi.yaml`](/assets/module-c/api/ssa-content-service-openapi.yaml). Besides metadata (`courseId`, `chapterId`, `title`, optional `description`, `credits`) and `quiz`, the field **`content`** is an **ordered list of learning blocks**.

- Each item is an object **discriminated by `type`**, with an **`orderIndex`** that defines display order within the chapter (sort ascending).
- Allowed **`type`** values correspond to stored content blocks: **`h1`**, **`h2`**, **`h3`**, **`h4`**, **`paragraph`**, **`list_item`**, **`image`**, **`video`**, **`link`**.
- **Headings** (`h1`-`h4`) expose the heading text in **`text`**.
- **`paragraph`** and **`list_item`**: the service assembles rich text on the server; the client receives **`html`** ready to embed. **`rawText`** may be present as the source representation; rendering should use **`html`** for display. For **`list_item`**, each array element is usually one list row; **`html`** is typically a fragment such as `<li>…</li>` - see the rendering rules below.
- **`image`**: **`url`** and **`alt`**.
- **`video`**: **`url`** and **`title`** (title may be empty).
- **`link`**: **`url`** and **`title`** (label for the anchor).

The **`quiz`** object in the same response holds multiple-choice questions for the end of the chapter; it is separate from **`content`**.

The page must include:

- **Sticky chapter bar:** Implement a **sticky** sub-header that stays visible while the learner scrolls the lesson. On **one row**, include (1) a **Back to course** link to the parent course page (`/courses/:slug`) and (2) a **button** that opens the table-of-contents drawer. **Do not** place the TOC control only in the global site header; it belongs beside **Back to course** in this sticky bar. Visual reference: [`chapter-page-light-with-toc.png`](/assets/module-d/design/chapter-page-light-with-toc.png), [`chapter-page-dark-with-toc.png`](/assets/module-d/design/chapter-page-dark-with-toc.png).
- **Table of contents (drawer):** The button opens a **drawer** (slide-out panel from the side) titled **Contents**. Populate it from the chapter **`content`** array: include every block with **`type`** **`h1`**, **`h2`**, or **`h3`**, in ascending **`orderIndex`** order, using each block’s **`text`**. Show **heading hierarchy** (e.g. indent **`h2`** under **`h1`**, **`h3`** under **`h2`**). Each entry must be a **navigation control** that scrolls or moves focus to that heading in the lesson. **`h4`** headings are rendered in the body but are **not** listed in the TOC.
- **Header:** chapter title, optional description, credits and course/chapter identifiers as appropriate from the API response (below the sticky bar, as in the reference layout).
- **Lesson content:** render the `content` array in **`orderIndex`** order. Supported block types:
  - **Headings** `h1`-`h4`: plain text from the API.
  - **Paragraph:** render server-provided HTML; styling for readable body text.
  - **List items:** consecutive `list_item` rows must be merged into a **single** `<ul>`; each item's `html` is typically one `<li>…</li>`.
  - **Image:** `<img>` with `url` and `alt`; caption using `alt` if present.
  - **Video:** `<video controls playsInline>` with `src` from `url`. If a **title** is present, on **desktop** widths (e.g. from ~900px) lay out the player in approximately **2/3** of the row and the title (and optional label) in **1/3**; on smaller screens, **stack** video above text.
  - **Link:** external link with `rel="nofollow noopener noreferrer"` and `target="_blank"`.

- **Quiz:** if the chapter defines questions:
  - Show every question with **radio** options (one choice per question).
  - **Submit** only when **all** questions are answered.
  - `POST` answers to `.../quiz/validate` as specified in the OpenAPI.
  - Show clear feedback for pass, fail, errors, and special cases (e.g. quiz passed but completion sync failed).
  - After a successful completion, **refresh** course/chapter state so the course page reflects updated completion (e.g. re-fetch or router revalidation).

#### Layout & Theme

- **Header:** logo or title linking to the **dashboard** home URL; link to **dashboard courses** (use the same dashboard base URL as in [Dashboard and LMS URLs](#dashboard-and-lms-urls), e.g. `https://cXX-YYYY-dashboard.ssa.skillsit.hu`); dark/light theme toggle persisted in `localStorage`.
- **Theme switching:** The application must support both a **dark theme** (default) and a **light theme**. Both themes are defined in the SSA style guide (`assets/style-guide/ssa-style-guide.md`). The active theme must be persisted in `localStorage` so the user's preference is restored on page reload. When opening the page, there should be no theme color flickering.
- When a token is present, show that the user is **signed in** (e.g. "Signed in"); loading the user's **name** from the main backend is **optional**.
- **Loading:** visible loading state during navigation or slow requests.

## Assessment

Module D will be assessed using the provided version of **Google Chrome**. Assessment includes **functional** behaviour and **user experience** (clarity, responsiveness, error handling).

**Important:** Competitors must use only the **documented content service** endpoints as specified in the OpenAPI. Modifications to the provided backends or databases are outside the scope of the frontend assessment.

## Mark distribution

| WSOS SECTION | Description                            | Points |
| ------------ | -------------------------------------- | ------ |
| 1            | Work organization and self-management  | 1      |
| 2            | Communication and interpersonal skills | 2      |
| 3            | Design Implementation                  | 0      |
| 4            | Front-End Development                  | 28     |
| 5            | Back-End Development                   | 0      |
| **Total**    |                                        | 31     |
