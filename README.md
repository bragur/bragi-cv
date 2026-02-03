# Bragi Bergthorsson — CV

CV written in [Typst](https://typst.app/), automatically compiled and published to GitHub Pages on every push to `main`.

**Live PDF:** [bragur.github.io/bragi-cv](https://bragur.github.io/bragi-cv)

## Local build

Requires [Typst](https://github.com/typst/typst) and the [Inter](https://rsms.me/inter/) font installed locally.

```sh
./compile.sh
```

The script sources `.env` (if present) to inject your phone number into the PDF via `--input phone=...`. Without `.env`, the phone field is simply omitted.

Create a `.env` file for local builds:

```sh
PHONE="***"
```

You can also compile directly without the script:

```sh
typst compile bragi_bergthorsson_cv.typ
```

## Auto-publishing

Pushing to `main` triggers a GitHub Actions workflow that compiles the CV and deploys it to GitHub Pages. The repo owner must enable GitHub Pages with source set to **"GitHub Actions"** in **Settings → Pages** for this to work.
