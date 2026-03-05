#import "@preview/diatypst:0.9.1": *
#import "@preview/colorful-boxes:1.4.3": *

#set page(
  footer: none, header: none, margin: 0cm,
  height: 10.5cm, // height is either 9cm, 10.5cm or 12cm
  width: 4/3*10.5cm, // width is your height * your ratio
)

#show: slides.with(
  title: "Prolog", // Required
  subtitle: "un langage mature mais sous-estimé pour de l’IA symbolique !",
  authors: ("Frédéric Cabestre", "Didier Plaindoux"),

  // Optional (for more see docs at https://mdwm.org/diatypst/)
  ratio: 16/9,
  layout: "medium",
  title-color: blue.darken(60%),
  toc: false,
  count: none,
)

#set heading(numbering: none, supplement: none)

= Unification

= Logique du premier ordre

== Calcul des prédicats

Système formel pour raisonner par *Gottlob Frege*. \

#colorbox(
title: "Définition des termes",
color: "blue",
radius: 2pt,
width: auto,
)[
  $ X in "Variables", C in "Constante", f in "Symbole"_f, t ::= X | C | f(t_1,...,t_n) $
]

#colorbox(
title: "Définition des prédicats",
color: "blue",
radius: 2pt,
width: auto,
)[
  $ P in "Symbole"_P, e ::= not e | e_1 and e_2 | e_1 or e_2 | e_1 arrow.r.double e_2 | P(t_1,...,t_n) | forall X.e | exists X.e $
]

#slanted-colorbox(
title: "Exemple de prédicat",
color: (
  fill: rgb("#f0f8ff"),
  stroke: rgb("#00bfff"),
  title: rgb("#002366")
),
radius: 4pt,
width: auto,
)[
  $ forall X.exists Y."parent"(X,Y) and "femme"(X) arrow.r.double "mere"(X,Y) $
]