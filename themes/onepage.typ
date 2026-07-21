// =====================================================================
// ONE-PAGE THEME — all layout & styling. No content here.
// Design tokens grouped below for easy tuning.
// =====================================================================

// ---- Design tokens -------------------------------------------------
#let accent = rgb("#1a5276")
#let ink = rgb("#212121")
#let muted = rgb("#5d6d7e")
#let rule-color = rgb("#d5dbdb")

// Font
#let body-font = "Inter"            // alt: "Libertinus Serif"
#let head-font = "Inter"            // alt: "Libertinus Serif"
#let body-size = 9.4pt

#let page-margin = (x: 1.5cm, y: 1.35cm)
#let sec-space-above = 19pt
#let sec-space-below = 7pt
#let entry-space = 11pt
#let photo-size = 2.35cm

// ---- Small building blocks -----------------------------------------
#let section(title) = {
  block(above: sec-space-above, below: sec-space-below)[
    #text(font: head-font, size: 9.5pt, weight: "bold", fill: accent, tracking: 0.8pt)[#upper(title)]
    #v(-5pt)
    #line(length: 100%, stroke: 0.6pt + rule-color)
  ]
}

#let entry-head(left-content, dates) = {
  grid(
    columns: (1fr, auto),
    column-gutter: 8pt,
    align(left)[#left-content],
    align(right)[#text(size: 8pt, fill: muted, number-width: "tabular")[#dates]],
  )
}

#let stack-line(s) = if s != none {
  block(above: 3pt)[#text(size: 7.7pt, fill: muted, style: "italic")[Stack: #s]]
}

#let bullets(items) = {
  set list(marker: text(fill: accent, size: 6.5pt)[•], indent: 1pt, body-indent: 5pt, spacing: 5.8pt)
  list(..items)
}

// Placeholder shown until a real photo is provided
#let photo-placeholder = box(
  width: photo-size, height: photo-size,
  fill: rgb("#eaeded"), stroke: 0.6pt + rule-color, radius: 4pt,
)[
  #align(center + horizon)[#text(size: 7pt, fill: muted)[PHOTO\ #text(size: 6pt)[assets/photo.jpg]]]
]

// ---- The theme -----------------------------------------------------
// `photo`: none (no slot) | auto (placeholder) | content (e.g. image("assets/photo.jpg"))
#let onepage(cv, show-open-source: false, photo: none) = {
  set page(paper: "a4", margin: page-margin)
  set text(font: body-font, size: body-size, fill: ink, lang: "en")
  set par(leading: 6.5pt, spacing: 7.6pt, justify: false)

  // ---------- Header ----------
  grid(
    columns: if photo == none { (1fr,) } else { (1fr, auto) },
    column-gutter: 14pt,
    [
      #text(font: head-font, size: 18.5pt, weight: "bold", tracking: -0.2pt)[#cv.name]
      #v(-6pt)
      #text(size: 10pt, fill: accent, weight: "medium")[#cv.title]
      #v(-5.5pt)
      #text(size: 8pt, fill: muted)[
        #cv.location · #link("mailto:" + cv.email)[#cv.email] \
        #cv.links.map(l => link(l.url)[#l.label]).join(" · ")
      ]
    ],
    ..if photo == auto { (align(top + right)[#photo-placeholder],) }
      else if photo != none {
        (align(top + right)[#box(width: photo-size, height: photo-size, radius: 4pt, clip: true)[#photo]],)
      } else { () }
  )

  // ---------- Profile ----------
  block(above: 8pt)[#text(size: 9pt)[#cv.profile]]

  // ---------- Experience: freelance missions ----------
  section("Experience")
  for e in cv.experience {
    entry-head(
      [
        #text(weight: "bold", size: 9.6pt)[#e.project] \
        #v(-3pt)
        #text(size: 8.4pt)[#e.role — #e.client, #e.location]
      ],
      e.dates,
    )
    if e.summary != none {
      block(above: 3.5pt)[#text(size: 8.3pt, style: "italic", fill: muted.darken(15%))[#e.summary]]
    }
    block(above: 4pt)[#bullets(e.bullets)]
    stack-line(e.stack)
  }

  // ---------- Experience: employment umbrella ----------
  let emp = cv.employment
  v(entry-space)
  entry-head(
    [
      #text(weight: "bold", size: 9.6pt)[#emp.employer] \
      #v(-3pt)
      #text(size: 8.4pt)[#emp.role — #emp.location]
    ],
    emp.dates,
  )
  block(above: 3pt)[#text(size: 8.4pt)[#emp.intro]]

  for m in emp.missions {
    block(above: 6.5pt)[
      #entry-head(text(size: 9.1pt, weight: "semibold")[#m.name], m.dates)
    ]
    if m.summary != none {
      block(above: 2.5pt)[#text(size: 8.3pt, style: "italic", fill: muted.darken(15%))[#m.summary]]
    }
    block(above: 3.5pt)[#bullets(m.bullets)]
    stack-line(m.stack)
  }

  // ---------- Skills ----------
  section("Skills")
  grid(
    columns: (auto, 1fr),
    column-gutter: 12pt,
    row-gutter: 4.5pt,
    ..cv.skills.map(s => (
      text(size: 8.4pt, weight: "semibold", fill: accent)[#s.group],
      text(size: 8.6pt)[#s.items],
    )).flatten()
  )

  // ---------- Bottom bands ----------
  grid(
    columns: (1fr, 1fr),
    column-gutter: 20pt,
    [
      #section("Certifications")
      #for c in cv.certifications [
        #block(above: 3.5pt)[#text(size: 8.4pt)[#c]]
      ]
    ],
    [
      #section("Education")
      #for e in cv.education [
        #block(above: 3.5pt)[#text(size: 8.4pt)[#e]]
      ]
      #block(above: 6pt)[
        #text(size: 8.4pt)[#text(weight: "semibold", fill: accent)[Languages] — #cv.languages]
      ]
    ],
  )

  // ---------- Optional open-source band ----------
  if show-open-source {
    section("Open Source")
    text(size: 8.4pt)[#cv.open_source]
  }
}
