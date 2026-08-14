# CV — Thibaud Ledent

Code-first CV built with [Typst](https://typst.app)

## Structure
- `content/content.typ` — all CV content as data (edit here for text changes)
- `themes/onepage.typ` — layout & styling (design tokens at the top)
- `main.typ` — entry point wiring theme + content
- `assets/fonts/` — bundled fonts for reproducible builds

## Build
```sh
make build   # -> cv.pdf
make watch   # live rebuild on save
```

## Variants
- `make build` → `cv.pdf` — designed one-pager (photo, Inter, accent color)
- `make ats` → `cv-ats.pdf` — single-column ATS-safe variant (no photo, standard headings)

## CI
Every push builds `cv.pdf`, `cv-ats.pdf`, and a `cv-preview.png` as a GitHub
Actions artifact. Tags (e.g. `v2026.07`) additionally attach all three to a
release, and publish `cv.pdf` + `cv-preview.png` to the
[website repo](https://github.com/thibaudledent/thibaudledent.github.io)
(`assets/`), which triggers a GitHub Pages rebuild. Tag when you send the CV
out, so every distributed version is reproducible.
