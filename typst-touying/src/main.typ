#import "@preview/touying:0.6.1": *
#import "templates/academic.typ": *
#import "@preview/unify:0.7.1": *

#import "utils/border.typ": *
#import "utils/arrow.typ": *
#import "utils/slide-columns.typ": *

#show: academic-theme.with(
  aspect-ratio: "4-3",
  footer: self => self.info.institution,
  config-info(
    title: [4月 相談会],
    author: [
      名古屋大学大学院工学研究科 \
      電気工学専攻 吉田研究室 \
      M1 竹市朋央
    ],
    date: [2025/04/17],
  ),
  // config-store(footer: [ほげほげ]),
)

#title-slide()

---

== 研究内容

=== 研究テーマ

#border-fit(text(size: 1.3em)[*低真空における、 \ RHEED 画像の鮮明化・結晶情報の抽出*])

- 低真空下では、RHEED パターンが見えずらくなる \ → *機械学習*や*画像処理*を用いて鮮明化、分析しやすくする
- 電子線レーザーに *GaN フォトカソード* を用いる
  - エネルギー分散が低く ($< #qty(0.1, "eV")$)、高ピーク電流 (#qty(10, "mA"))

==== 研究目的

- 成膜中における、結晶成長過程の分析・評価
  - 表面状態に応じた、成膜条件のフィードバック制御
- 複雑な成膜プロセスへの応用
  - 成膜層の状態を確認し、最適なタイミングでの積層素材の切り替え

---

#arrow(height: 100pt, width: 100pt, direction: "up")

臨界温度 $T_"c"$ 以下で電気抵抗がゼロ

*臨界温度 $T_"c"$ 以下で電気抵抗がゼロ*

---

#section-slide[
  補足
]

---

== A long long long long long long long long long long long long long long long long long long long long long long long long Title

aaaaa

#let a = (1fr,) * 2

#slide-columns()[
  a
][
  #set align(center)
  aa
  #arrow(height: 100pt, width: 100pt, direction: "up")
][
  awwwwww
]

---

#let container = rect.with(stroke: (dash: "dashed"), height: 100%, width: 100%, inset: 0pt)
#let innerbox = rect.with(fill: rgb("#d0d0d0"))
#place(top + right)[↑Margin→]
#container[
  #container[
    #innerbox[Content]
  ]
]
