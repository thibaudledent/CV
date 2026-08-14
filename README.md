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

### One-time setup: website deploy key
Publishing to the website repo needs an SSH deploy key.

Generate it once:

```sh
ssh-keygen -t ed25519 -N "" -f /tmp/cv-deploy-key -C "CV repo -> website"

# public half: write-enabled deploy key on the WEBSITE repo
gh repo deploy-key add /tmp/cv-deploy-key.pub \
  --repo thibaudledent/thibaudledent.github.io \
  --title "CV publisher" --allow-write

# private half: secret on the CV repo
gh secret set SITE_DEPLOY_KEY --repo thibaudledent/CV < /tmp/cv-deploy-key

rm /tmp/cv-deploy-key /tmp/cv-deploy-key.pub
```
