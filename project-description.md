# Test Project Outline - Module D - LMS Frontend (Learning Site)

## Competition time

Competitors will have **3 hours** to complete this module.

## Introduction

Module D focuses on implementing a **frontend for the SkillShare Academy content service** - a separate **LMS (learning) site** where enrolled learners open a course, work through chapters in order, read rich lesson content, and complete end-of-chapter quizzes.

## General Description of Project and Tasks

SkillShare Academy (SSA) uses a **main backend** for accounts, enrollment, credits, and chapter completion, and a **content service** that stores and serves course metadata, chapter content blocks, media, and quizzes. **Module D** is only the **browser application** that talks to the **content service**.

Content service and the main backend are provided. The LMS must use the **same Bearer token** the learner received when signing in on the main SkillShare Academy platform (dashboard). Typically the dashboard opens the LMS with a **token in the query string**; the LMS frontend stores it and uses it on subsequent API calls. **Token lifetime:** The main backend issues tokens that expire **60 seconds** after login; expect `401 Unauthorized` after that until the user signs in again on the dashboard.

### Setup

This task is intended to be run locally rather than against the live competition infrastructure used during the actual competition. A Docker Compose file is provided at [`/assets/docker-compose.yml`](/assets/docker-compose.yml) to set up the required environment.

Running `docker compose up -d` from the `assets/` directory starts six services:

- **`content-service`**: the provided SkillShare Academy content service (the Module C solution), exposed at `http://localhost:5000`, making the API base URL `http://localhost:5000/api`. This is the only backend the LMS may call.
- **`main-backend`**: the provided main backend (accounts, enrollment, credits, chapter completion), exposed at `http://localhost:5001`. It is used by the dashboard and by the content service; the LMS must **not** call it.
- **`platform-frontend`**: the fully working **SSA dashboard**, exposed at `http://localhost:5174`. Sign in there to obtain a token and to open courses in the LMS.
- **`bucket`**: the SSA media bucket (course hero images and lesson videos), exposed at `http://localhost:8081`. Media referenced by the content service resolves against this URL.
- **`db`**: a MySQL server. On first startup it automatically imports both database dumps from `assets/db/` - `ssa_main_backend.sql` into the main backend's database and `ssa_content_service.sql` into the content service's database.
- **`pma`**: phpMyAdmin, a web-based MySQL administration tool. It is exposed at `http://localhost:8080` and can be used to inspect the databases.

The database is reachable at `localhost:3306` (user `root`, password `toor`). It is provided for inspection only: the API is the contract for this module, and you must not modify the provided services or their data.

The LMS frontend you build is **not** part of this Compose file; you develop and run it yourself. The dashboard links to `http://localhost:5173` by default, so run your dev server on that port (Vite's default) and the dashboard's "open course / continue learning" links will point at your application.

### Dashboard and LMS URLs

**Testing:** All seeded users use the password `password123` (for example **alice@example.com** / **password123**) when signing in on the dashboard at `http://localhost:5174`.

**Token lifetime during development:** Dashboard login tokens expire after **60 seconds**, which is deliberate - the LMS must handle expiry (see [Error handling](#error-handling)). If the short expiry gets in the way while you build, raise `CONTENT_TOKEN_TTL_SECONDS` on the `main-backend` service in [`/assets/docker-compose.yml`](/assets/docker-compose.yml) and restart it. The `401` behaviour must still work as specified.

**Hint:** For development and UI testing, we recommend opening the **Tailwind CSS & ShadCN UI Tutorial** course at **`/courses/tailwind-css-shadcn-ui-tutorial`**. It has the richest lesson content in the seed data (headings, paragraphs, lists, images, video, links, quizzes), so it is the best course to exercise every content block and layout rule. Enroll **alice@example.com** on that course in the dashboard if she is not already enrolled.

**Serving the LMS elsewhere:** If you cannot use `http://localhost:5173`, set the **`lmsSiteUrl`** entry in the browser's **localStorage** (on the dashboard origin, `http://localhost:5174`) to your LMS base URL (no trailing slash). The dashboard uses this value so links to "open course / continue learning" go to your site. Remove or reset `lmsSiteUrl` to return to the default behaviour.

**Relationship to Module C:** Module C defines and implements the **content service** API and data model. Module D consumes **only that API** for all required LMS behaviour (course details, chapter content, quiz validation). The main backend still handles accounts and completion bookkeeping, but the **LMS frontend must not call the main backend's HTTP API** - the content service coordinates with the main backend where needed (e.g. when a quiz is passed).

**Base URL of the content service:** `http://localhost:5000`, making the API base URL `http://localhost:5000/api`.

**API documentation:** OpenAPI specification for the content service is available in the `assets` directory: [`/assets/api/ssa-content-service-openapi.yaml`](/assets/api/ssa-content-service-openapi.yaml). It is the reference for all endpoints the LMS must call.

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

The `assets` directory includes a **SkillShare Academy (SSA) design guide** ([`/assets/style-guide/ssa-style-guide.md`](/assets/style-guide/ssa-style-guide.md)), **logos** ([`/assets/logos/`](/assets/logos/)), **fonts** ([`/assets/fonts/`](/assets/fonts/)) and **graphic design assets** (reference images in [`/assets/design/`](/assets/design/)) for **both** the course page and the chapter page, in light and dark theme. Competitors must follow the design guide and match the provided visuals **as closely as practicable** (layout, hierarchy, spacing, color and typography where specified, and component treatment).

Where the design guide does not cover a detail (e.g. a specific content block or error state), extend the same patterns so the UI stays consistent. The implementation must remain **responsive** across screen sizes, including the video layout described for the chapter page below.

### Error handling

The content service can return various errors. The frontend must handle them and show **understandable** messages (not raw stack traces). At minimum, handle:

- `400 Bad Request` - Malformed request; inform the user briefly.
- `401 Unauthorized` - Missing, invalid, or expired token. **Redirect the user to the main SSA dashboard application** (the dashboard base URL from [Setup](#setup), `http://localhost:5174`, typically the app root). **Full-page navigation** (`window.location` or equivalent) is required so the user leaves the LMS and can re-authenticate. Also, clear the stored LMS token before or as part of handling. Do not leave the user on the LMS with only an inline error.
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
- **Hero / image:** fetch the hero image from the SSA bucket: `http://localhost:8081/<slug>.webp` (replace `<slug>` with the course slug from the API). Not every course has a hero image in the bucket, and individual content blocks may reference media that cannot be loaded; the page must **degrade gracefully** - a broken or unreachable media URL must not break the layout or leave the page in a loading state.
- **Chapter list:** all chapters in order, each with title, short description, credits, and **completed** state.
- **Sequential access:** only the first chapter, or a chapter whose **previous** chapter is completed, is **unlocked** (link to chapter). Locked chapters must be clearly indicated and **must not** navigate to the chapter view.
- **Completed chapters** must be visually distinct (e.g. badge or styling).

#### Chapter page (`/courses/:slug/chapters/:chapterId`)

Loads chapter content via `GET /api/courses/:slug/chapters/:chapterId` (Bearer required).

**The `content` array (lesson body):** The JSON body is a single **chapter payload** (not wrapped in an outer `chapter` object): see schema `ChapterContentResponse` in [`/assets/api/ssa-content-service-openapi.yaml`](/assets/api/ssa-content-service-openapi.yaml). Besides metadata (`courseId`, `chapterId`, `title`, optional `description`, `credits`) and `quiz`, the field **`content`** is an **ordered list of learning blocks**.

- Each item is an object **discriminated by `type`**, with an **`orderIndex`** that defines display order within the chapter (sort ascending).
- Allowed **`type`** values correspond to stored content blocks: **`h1`**, **`h2`**, **`h3`**, **`h4`**, **`paragraph`**, **`list_item`**, **`image`**, **`video`**, **`link`**.
- **Headings** (`h1`-`h4`) expose the heading text in **`text`**.
- **`paragraph`** and **`list_item`**: the service assembles rich text on the server; the client receives **`html`** ready to embed. **`rawText`** may be present as the source representation; rendering should use **`html`** for display. For **`list_item`**, each array element is usually one list row; **`html`** is typically a fragment such as `<li>…</li>` - see the rendering rules below.
- **`image`**: **`url`** and **`alt`**.
- **`video`**: **`url`** and **`title`** (title may be empty).
- **`link`**: **`url`** and **`title`** (label for the anchor).

The **`quiz`** object in the same response holds multiple-choice questions for the end of the chapter; it is separate from **`content`**.

The page must include:

- **Sticky chapter bar:** Implement a **sticky** sub-header that stays visible while the learner scrolls the lesson. On **one row**, include (1) a **Back to course** link to the parent course page (`/courses/:slug`) and (2) a **button** that opens the table-of-contents drawer. **Do not** place the TOC control only in the global site header; it belongs beside **Back to course** in this sticky bar. Visual reference: [`chapter-page-light-with-toc.png`](/assets/design/chapter-page-light-with-toc.png), [`chapter-page-dark-with-toc.png`](/assets/design/chapter-page-dark-with-toc.png).
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

- **Header:** logo or title linking to the **dashboard** home URL; link to the **dashboard courses** page (use the same dashboard base URL as in [Setup](#setup), `http://localhost:5174`); dark/light theme toggle persisted in `localStorage`.
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
