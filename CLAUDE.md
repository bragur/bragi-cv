# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal CV/resume generator built with **Typst** (a markup-based typesetting system). The CV compiles to PDF and is automatically published to GitHub Pages at https://bragur.github.io/bragi-cv.

## Build Commands

```bash
# Compile CV to PDF (uses .env for phone/references injection)
./compile.sh

# Direct compilation without .env variables
typst compile bragi_bergthorsson_cv.typ
```

There are no test or lint commands — this is a single-file Typst project.

## Environment Variables

A `.env` file (git-ignored) provides sensitive contact details injected at compile time:
- `PHONE` — phone number displayed in contact info
- `REFERENCE_1`, `REFERENCE_2`, `REFERENCE_3` — reference contact details

The `compile.sh` script sources `.env` and passes these as `--input` flags to `typst compile`. The CV renders gracefully without them.

## Architecture

The entire CV lives in `bragi_bergthorsson_cv.typ`. Key structure:

- **Design tokens** — Color palette (primary, heading, accent, warm-orange, block-bg) and typography (Inter font) defined at the top
- **Reusable components** — `styled-link()`, `timeline-dot`, `section()`, `experience-entry()` functions used throughout
- **Three-page layout** — Page 1: cover letter/about; Page 2: recent experience + skills; Page 3: earlier experience + education

## Workflow

The `main` branch is protected — all changes must go through pull requests.

## CI/CD

Two GitHub Actions workflows in `.github/workflows/`:

- **`publish-cv.yml`** — On push to `main`: compiles PDF, deploys to GitHub Pages
- **`preview-cv.yml`** — On pull requests: compiles PDF + PNG previews, pushes to `preview` branch, comments on PR with inline page previews

Both workflows install Typst via `typst-community/setup-typst@v4` and the Inter font via apt.
