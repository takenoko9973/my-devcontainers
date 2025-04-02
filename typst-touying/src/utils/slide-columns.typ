#let slide-columns(
  align: top + left,
  columns: auto,
  gutter: 4em,
  row-gutter: (),
  column-gutter: (),
  stroke: (:),
  ..bodies,
) = {
  if columns == auto {
    columns = (1fr,) * bodies.pos().len()
  }

  grid(
    align: align,
    columns: columns,
    gutter: gutter,
    row-gutter: row-gutter,
    column-gutter: column-gutter,
    stroke: stroke,
    ..bodies,
  )
}
