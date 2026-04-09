#import "@preview/touying:0.6.2": *

== Principe d'unification

#table(
  columns: (auto, auto),
  inset: 10pt,
  align: (right,left),
  stroke: none,
  image("assets/unification/Herbrand.jpg", height: 50%),
  [#link("https://fr.wikipedia.org/wiki/Jacques_Herbrand")[Jacques Herbrand] (1908-1931), mathématicien et logicien
français, propose une méthode pour déterminer si on peut trouver une substitution telle qu'elle rende deux
termes identiques. 

Une telle substitution est notée *$sigma$*]
)

== Principe d'unification

#image("assets/unification/6.svg")

Peut-on veut unifier le terme *`f(g(Y,b),Y)`* avec le terme *`f(X,a)`* avec *`X`* et *`Y`* des variables ?

== Principe d'unification

#image("assets/unification/7.svg")

Le foncteur de plus haut niveau est le même.

== Principe d'unification

#image("assets/unification/8.svg") #pause

On a une première substitution qui émerge *$sigma = { X arrow.r.bar g(Y, b) }$*.

== Principe d'unification

#image("assets/unification/9.svg") #pause

Ce qui complète la substitution *$sigma = { X arrow.r.bar g(Y, b), Y arrow.r.bar a }$*.

== Principe d'unification


$triangle.filled.small.r$ L'unification est un processus gourmand, qui à donné lieu à pas mal de travaux. #pause

$triangle.filled.small.r$ Traitement des termes récursifs par le *test d'occurrence*. #pause

$triangle.filled.small.r$  Induire une egalité structurelle naturelle en exhibant *$sigma$*
