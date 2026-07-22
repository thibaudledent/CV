// =====================================================================
// ATS-SAFE THEME — single column, no photo, standard headings,
// linear reading order, minimal styling. Same content as onepage.
// =====================================================================

#let body-size = 9.1pt

#let section(title) = {
  block(above: 9pt, below: 12pt)[
    #text(size: 10.5pt, weight: "bold")[#upper(title)]
    #v(-6pt)
    #line(length: 100%, stroke: 0.5pt + black)
  ]
}

#let bullets(items) = {
  set list(marker: [•], indent: 0pt, body-indent: 5pt, spacing: 3.6pt)
  list(..items)
}

#let ats(cv, show-open-source: true) = {
  set page(paper: "a4", margin: (x: 1.5cm, y: 1.1cm))
  set text(font: "Inter", size: body-size, lang: "en")
  set par(leading: 4.9pt, spacing: 5.4pt, justify: false)

  // ---------- Header (linear, no columns) ----------
  text(size: 16pt, weight: "bold")[#cv.name]
  linebreak()
  text(size: 10pt)[#cv.title]
  linebreak()
  text(size: 9pt)[
    #cv.location · #cv.email · #cv.links.map(l => l.label).join(" · ")
  ]

  // ---------- Summary ----------
  section("Summary")
  cv.profile

  // ---------- Experience ----------
  section("Experience")
  for e in cv.experience {
    block(above: 6pt)[
      #text(weight: "bold")[#e.role] \
      #e.project — #e.client, #e.location | #e.dates
    ]
    if e.summary != none { block(above: 3pt)[#emph(e.summary)] }
    block(above: 3.5pt)[#bullets(e.bullets)]
    if e.stack != none [ #block(above: 3pt)[Technologies: #e.stack] ]
  }

  let emp = cv.employment
  block(above: 9pt)[
    #text(weight: "bold")[#emp.role] \
    #emp.employer — #emp.location | #emp.dates
  ]
  block(above: 3pt)[#emp.intro]

  for m in emp.missions {
    block(above: 6pt)[#text(weight: "bold")[#m.name] | #m.dates]
    if m.summary != none { block(above: 3pt)[#emph(m.summary)] }
    block(above: 3.5pt)[#bullets(m.bullets)]
    if m.stack != none [ #block(above: 3pt)[Technologies: #m.stack] ]
  }

  // ---------- Skills ----------
  section("Skills")
  for s in cv.skills [
    #block(above: 3.5pt)[#text(weight: "bold")[#s.group:] #s.items]
  ]

  // ---------- Certifications ----------
  section("Certifications")
  for c in cv.certifications [ #block(above: 3.5pt)[#c] ]

  // ---------- Education ----------
  section("Education")
  for e in cv.education [ #block(above: 3.5pt)[#e] ]

  // ---------- Languages ----------
  section("Languages")
  cv.languages

  // ---------- Open source ----------
  if show-open-source {
    section("Open Source")
    cv.open_source
  }
}
