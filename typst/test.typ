#set text(lang:"ja", font: "Harano Aji Mincho")

#import "@preview/physica:0.9.2": *
#import "@preview/metro:0.1.0": *

#import "templates/template.typ": *

#show: project.with(
  title: "",
  author: "",
  advisor: "",
  major: "",
  year: "",
)

#outline(indent: 2em)


= ここはテスト場所
== テスト
=== このテスト

$
integral_0^1 sin(theta) cos(theta) thin d theta\
integral_0^1 sin(x)\
dv(f,v) \
#qty(10, "eV")
$

test
