#import "@preview/touying:0.7.2": *

== Unification : Principe

#table(
  columns: (auto, auto),
  inset: 10pt,
  align: (right,left),
  stroke: none,
  image("assets/unification/Herbrand.jpg", height: 50%),
  [#link("https://fr.wikipedia.org/wiki/Jacques_Herbrand")[Jacques Herbrand] (1908-1931), mathématicien et logicien
français
 
#pause Il propose une méthode pour déterminer si on peut trouver une substitution telle qu'elle rende deux
termes identiques. 

#pause Une telle substitution est notée *$sigma$*]
)

== Unification vs. Filtrage

#pause#alternatives[
$triangle.filled.small.r$ _le motif peut contenir des variables non répétées, p.ex. *`f(X,X)`* est interdit._ 

$triangle.filled.small.r$ _Le terme filtré ne doit pas contenir de variables: il est dit fermé._ 
][
$triangle.filled.small.r$ Tout terme peut contenir des variables répétées, p.ex. *`f(X,X)`*. 

$triangle.filled.small.r$ _Le terme filtré ne doit pas contenir de variables: il est dit fermé._
][
$triangle.filled.small.r$ Tout terme peut contenir des variables répétées, p.ex. *`f(X,X)`*. 

$triangle.filled.small.r$ L'unification est faite entre deux termes. Les variables sont des termes ! 
]

== Unification : Principe

#image("assets/unification/6.svg")

#pause Peut-on unifier le terme *`f(g(Y,b),Y)`* avec le terme *`f(X,a)`* avec *`X`* et *`Y`* des variables ?

== Unification : Principe

#image("assets/unification/7.svg")

Le foncteur de plus haut niveau est le même.

== Unification : Principe

#image("assets/unification/8.svg") #pause

On a une première substitution qui émerge *$sigma = { X arrow.r.bar g(Y, b) }$*.

== Unification : Principe

#image("assets/unification/9.svg") #pause

Ce qui complète la substitution *$sigma = { X arrow.r.bar g(Y, b), Y arrow.r.bar a }$*.

== Unification : Principe


#pause $triangle.filled.small.r$ L'unification est un procédé incrémental (sans rebroussement)

#pause $triangle.filled.small.r$ Traitement des termes récursifs par le *test d'occurrence*.

#pause $triangle.filled.small.r$  Induit une égalité structurelle naturelle en exhibant *$sigma$*
