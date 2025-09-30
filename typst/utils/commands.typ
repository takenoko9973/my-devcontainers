#import "@preview/metro:0.1.0": *

#let textL = 1.9em
#let textM = 1.6em
#let fontSerif = "Harano Aji Mincho"
#let fontSan = "Harano Aji Gothic"

#set text(11pt, font: fontSerif, lang: "ja")
#set par(first-line-indent: 1em)

#let project(title: "", author: "", major: "", advisor: none, body) = {
  set document(author: author, title: title)

  // Heading
  set heading(
    numbering: (..nums) => {
      if nums.pos().len() > 1 {
        nums.pos().map(str).join(".")
      } else {
        text(cjk-latin-spacing: none)[第#str(nums.pos().first())章]
      }
      h(1em)
    },
  )
  show heading.where(level: 1): it => {
    pagebreak()
    set text(size: 1.3em)
    pad(top: 1em, bottom: 0.6em, it)
  }
  show heading.where(level: 2): it => pad(top: 1em, bottom: 0.6em, it)
  show heading.where(level: 2): it => pad(top: 1em, bottom: 0.6em, it)

  // Outline
  show outline.entry: it => {
    it
  }
  show outline.entry.where(level: 1): it => {
    v(0.8em, weak: true)
    strong(it)
  }
  show outline.entry.where(level: 2): it => {
    it
  }

  pagebreak(weak: true)

  set par(justify: true)
  body
}

#let abstract(body) = {
  v(180pt)

  align(center)[
    #text(font: fontSan, size: textM, tracking: 2em, weight: "medium")[要旨]
  ]

  v(2em)

  set par(first-line-indent: 1em)
  body
  pagebreak(weak: true)
}
