#import "../const.typ": fontsize

#let layout(
  title: [],
  author: [],
  affiliations: [],
  supervisor_name: "",
  paper-size: "a4",
  fonts: (
    sans-ja: "Harano Aji Gothic",
    serif-ja: "Harano Aji Mincho",
  ),
  body,
) = {
  set page(
    // 全ページ共通の設定
    paper: "a4",
    margin: (
      top: 37mm,
      bottom: 30mm,
      left: 30mm,
      right: 30mm,
    ),
  )

  set text(font: fonts.serif-ja, 10.5pt)
  show strong: set text(font: fonts.sans-ja)

  // 段落の空白を調整
  set par(
    // 文章コンテンツの設定
    first-line-indent: 1em,
    spacing: 0.65em,
    leading: 1em,
    justify: true,
  )

  // 見出しのナンバリングとフォントの設定
  show heading: set text(font: fonts.serif-ja)

  // 章の見出し
  set heading(
    numbering: (..nums) => {
      // 章のフォーマット
      let numbers = nums.pos()
      if numbers.len() == 1 {
        numbering("第1章 ", ..numbers)
      } else {
        numbering("1.1 ", ..numbers)
      }
    },
  )

  // 章の見出し
  show heading.where(level: 1): it => {
    // 図表番号をリセット
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    // 脚注番号をリセット
    counter(footnote).update(0)

    // 中央寄せにする
    set align(center)
    set text(size: fontsize.Large)

    v(3%)

    // 章番号を表示
    if counter(heading).at(it.location()).at(0) != 0 {
      text(numbering(heading.numbering, ..counter(heading).at(it.location())).trim())
    } else {
      // ナンバリングがない場合はダミーを入れる
      text("")
    }
    linebreak()

    it.body

    v(5%)
  }

  // 節の見出し
  show heading.where(level: 2): it => {
    set text(size: fontsize.large)
    set block(above: 2.2em, below: 1em)
    it
  }

  // 項の見出し
  show heading.where(level: 3): it => {
    set text(size: fontsize.normalsize)
    set block(above: 1.8em, below: 0.8em)
    it
  }

  // 図表のスタイル設定
  set figure(
    numbering: (..num) => context {
      let current-chapter-num = counter(heading).get().at(0)
      numbering("1-1", current-chapter-num, ..num)
    },
  )
  set figure.caption(separator: h(1em))
  show figure.caption: it => {
    set text(font: fonts.sans-serif, size: 8pt)
    set align(left)
    it
  }

  // 表のスタイル設定
  // 表のキャプションは上
  show figure.where(kind: table): set figure.caption(position: top)
  show table: it => {
    // 表内の文字は少し小さくする
    set text(size: 8pt)
    // justifyだとあまりきれいじゃないので無効化
    set par(justify: false)
    it
  }
  set table(
    stroke: (x, y) => (
      // こうすることで一番下のみ線が引かれる
      top: 0pt,
      bottom: 0.3pt,
      // 一番上は白の線、それ以外は普通の線
      left: if x > 0 {
        if y == 0 {
          (thickness: 0.3pt, paint: luma(255))
        } else {
          0.3pt
        }
      },
    ),
    fill: (x, y) => {
      if y == 0 {
        // 一番上のヘッダーは濃いグレー
        luma(120)
      } else if calc.even(y) {
        // 偶数行は薄いグレー
        luma(210)
      }
    },
    inset: (
      x: 5pt,
      y: 3pt,
    ),
  )
  // 一番上のヘッダーは白文字
  show table.cell.where(y: 0): it => {
    set text(font: fonts.sans-serif, fill: luma(255))
    it
  }

  // 参照のカスタマイズ
  show ref: it => {
    if it.element == none {
      it
      return
    }

    if it.element.func() == figure {
      // 図表は強調表示する
      set text(font: fonts.sans-serif, weight: "bold")
      it
    } else if it.element.func() == heading and it.element.level == 1 {
      // 見出しは見出しのナンバリングをそのまま使用
      link(
        it.element.location(),
        numbering(heading.numbering, ..counter(heading).at(it.element.location())).trim(),
      )
    } else {
      it
    }
  }

  // 目次のスタイル設定
  show outline.entry.where(level: 1): it => {
    v(1.5em, weak: true)

    // ナンバリングがない場合は節と同じスタイル
    if it.element.numbering == none {
      it
      return
    }

    set text(font: fonts.serif-ja, weight: "bold", size: fontsize.normalsize)
    it
  }
  show outline.entry.where(level: 2): it => {
    h(0.7em)
    it
  }
  show outline.entry.where(level: 3): it => {
    h(2em)
    it
  }
  set outline(depth: 3)

  // 脚注のスタイルを設定
  set footnote(numbering: sym.dagger + "1")
  set footnote.entry(separator: line(length: 100%, stroke: 0.5pt))
  show footnote: it => {
    set text(size: 11pt)
    it
  }
  show footnote.entry: it => {
    set text(size: 6pt)

    grid(
      columns: (auto, 1fr),
      gutter: 1em,
      numbering(sym.dagger + "1", ..counter(footnote).at(it.note.location())), it.note.body,
    )
  }

  {
    set page(header: { })

    block(
      width: 100%,
      height: 100%,
    )[
      #set align(center)

      #v(10mm)

      #block(text(fontsize.LARGE)[#affiliations])
      #v(5mm)
      #block(text(fontsize.LARGE)[卒業論文])

      #v(1fr)
      #block(text(fontsize.huge)[#title])
      #v(1fr)

      #set align(left)

      #block(text(fontsize.LARGE)[氏名 : #author])
      #v(10mm)
      #block(text(fontsize.LARGE)[指導教員 : #supervisor_name #h(10mm) 印])

      #v(30mm)
    ]
  }

  pagebreak()

  body
}


#let document(outlined: true, body) = {
  // 目次
  if outlined {
    // 見出しのページ番号表記変更
    counter(page).update(1)
    set page(numbering: "i")

    outline(
      title: box([
        #h(1fr)#text(size: fontsize.normalsize)[目次]#h(1fr)
        #v(-1em)
      ]),
    )
  }

  // ページ番号をリセット
  counter(page).update(1)
  set page(numbering: "1")

  body
}
