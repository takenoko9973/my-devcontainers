#let arrow_deg(width: 100pt, height: 100pt, rot_deg: 0deg) = {
  let width_half = width / 2
  let height_half = width / 2

  rotate(
    rot_deg,
    curve(
      fill: orange.lighten(70%),
      stroke: orange,
      curve.move((width, height_half)),
      curve.line((-width_half, height_half), relative: true),
      curve.line((0pt, -height * 30%), relative: true),
      curve.line((-width_half, 0pt), relative: true),
      curve.line((0pt, -height * 40%), relative: true),
      curve.line((width_half, 0pt), relative: true),
      curve.line((0pt, -height * 30%), relative: true),
      curve.close(),
    ),
  )
}

#let arrow(width: 100pt, height: 100pt, direction: "right") = {
  if direction == "right" {
    arrow_deg(width: width, height: height, rot_deg: 0deg)
  } else if direction == "down" {
    arrow_deg(width: width, height: height, rot_deg: 90deg)
  } else if direction == "left" {
    arrow_deg(width: width, height: height, rot_deg: 180deg)
  } else if direction == "up" {
    arrow_deg(width: width, height: height, rot_deg: 270deg)
  } else {
    arrow_deg(width: width, height: height, rot_deg: 0deg)
  }
}
