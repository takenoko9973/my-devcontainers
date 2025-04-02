#let _border(legend: none, align: center, border_color: rgb("#666"), width: auto, body) = {
  set std.align(align)

  rect(
    stroke: 4pt + border_color,
    radius: 10pt,
    inset: 0.5em,
    width: width,
    [
      #if legend != none {
        place(
          top + left,
          dy: -40%,
          rect(
            inset: 5pt,
            fill: white,
            legend,
          ),
        )
      }

      #body
    ],
  )
}

#let border-normal(legend: none, align: center, border_color: rgb("#666"), body) = {
  _border(legend: legend, align: align, border_color: border_color, width: 100%, body)
}

#let border-fit(legend: none, align: center, border_color: rgb("#666"), body) = {
  _border(legend: legend, align: align, border_color: border_color, width: auto, body)
}
