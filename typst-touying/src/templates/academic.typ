#import "@preview/touying:0.6.1": *

#let slide(
  align: auto,
  config: (:),
  repeat: auto,
  setting: body => body,
  composer: auto,
  ..bodies,
) = touying-slide-wrapper(self => {
  if align != auto {
    self.store.align = align
  }

  let header(self) = {
    set text(size: 1.6em, weight: "bold")

    place(
      left + top,
      rect(
        width: 100%,
        height: 1.5em,
        inset: 1em,
        stroke: (bottom: 1pt),
        std.align(
          left + horizon,
          utils.display-current-heading(level: 2, setting: utils.fit-to-width.with(grow: false, 100%)),
        ),
      ),
    )
  }

  let footer(self) = {
    set text(fill: self.colors.neutral-lightest, size: 15pt)
    show: components.cell.with(fill: self.colors.primary, height: 1.25em)
    show: pad.with(x: 0.5em, y: 0.25em)

    components.left-and-right(
      utils.call-or-display(self, self.store.footer),
      utils.call-or-display(self, self.store.footer-right),
    )
  }

  let self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
    ),
  )

  // 中央寄せ設定
  let new-setting = body => {
    show: std.align.with(self.store.align)
    show: setting
    body
  }

  touying-slide(
    self: self,
    config: config,
    repeat: repeat,
    setting: new-setting,
    composer: composer,
    ..bodies,
  )
})

#let title-slide(config: (:), ..args) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config,
  )

  let info = self.info + args.named()

  let body = {
    show: std.align.with(center + horizon)

    block(
      width: 120%, // 余分に幅を取る
      inset: (y: 0.5em),
      stroke: (bottom: 1pt),
      text(size: 2em, weight: "bold", info.title),
    )

    show: std.align.with(right)
    set text(size: 0.8em)

    if info.author != none {
      block(info.author)
    }
    if info.date != none {
      block(utils.display-info-date(self))
    }
  }

  touying-slide(self: self, body)
})

#let section-slide(config: (:), ..args) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(margin: 0em),
  )

  touying-slide(
    self: self,
    align(
      horizon + center,
      block(
        width: 120%, // 余分に幅を取る
        inset: (y: 0.5em),
        stroke: (bottom: 1pt),
        text(size: 1.6em, weight: "bold", ..args),
      ),
    ),
  )
})

#let matrix-slide(config: (:), columns: none, rows: none, ..bodies) = touying-slide-wrapper(self => {
  touying-slide(
    self: self,
    config: config,
    composer: components.checkerboard.with(columns: columns, rows: rows),
    ..bodies,
  )
})

#let academic-theme(
  aspect-ratio: "4-3",
  align: horizon,
  footer: none,
  footer-right: context utils.slide-counter.display(),
  ..args,
  body,
) = {
  let text-color = rgb("#222222")

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      margin: (top: 3em, bottom: 1.3em, x: 1em),
    ),
    config-common(slide-fn: slide),
    config-methods(
      init: (self: none, body) => {
        set text(size: 21pt, font: "Harano Aji Gothic", fill: text-color)
        set text(cjk-latin-spacing: none) // 和英の空白削除
        set par(
          leading: 0.7em,
          spacing: 1em,
          justify: true,
        )
        set list(
          indent: 1em,
          spacing: 1em,
          marker: ([•], [◦]),
        )

        // 見出しの大きさ (level 1,2 はtouying側で設定)
        show heading.where(level: 3): set text(size: 1.2em)
        show heading.where(level: 3): set block(above: 1.5em, below: 1em)
        show heading.where(level: 4): set text(size: 1.1em)
        show heading.where(level: 4): set block(above: 1em, below: 1em)

        set grid(columns: 1fr, column-gutter: 2em)

        body
      },
    ),
    config-colors(
      neutral: text-color,
      primary: rgb("#1f38c5"),
      neutral-lightest: rgb("#ffffff"),
    ),
    config-store(
      align: align,
      footer: footer,
      footer-right: footer-right,
    ),
    ..args,
  )

  body
}
