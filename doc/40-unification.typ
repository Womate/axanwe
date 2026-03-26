#import "@preview/touying:0.6.2": *

== Unification: Données du langage

Les données manipulées par *Prolog* sont nommés *termes du langage*. Ils ont le même rôle que les entiers, chaînes de
caractère, listes et autres structures dans à peut près tous les langages que vous connaissez. La grammaire pour les
définir à cette tête:

$ X in "Variables", c in "Constante", f_n in "Foncteurs", t ::= X | c | f_n (t_1,...,t_n) $

Ce qui revient à dire qu'un terme Prolog, une donnée, est soit une variable (dénotée par une lettre majuscule par
convention), soit une constante (dénoté par une minuscule), soit une structure (record) d'arité $n$, regroupant $n$
sous termes.

Une particularité ici, qui pourrait sembler anodine mais qui ne le sera pas, les variables font partie des termes, ce
ne sont pas des concepts de première classe, donc manipulables.

== Unification: Vue comme arbre / graphe 

Un terme peut se voir comme un graphe orienté acyclique.

#image("assets/unification/1.svg")

== Principe d'unification

#image("assets/unification/Herbrand.jpg", height: 50%)

#link("https://fr.wikipedia.org/wiki/Jacques_Herbrand")[Jacques Herbrand] (1908-1931), mathématicien et logicien
français propose une méthode pour déterminer si on peut trouver une substitution $sigma$ telle qu'elle rende deux
termes identiques. Ici, il n'y a plus d'asymétrie entre terme à filter et filtre. Les deux termes ont le même
statut. Et plus de limitation sur les variables : on peut trés bien les répéter dans un terme.

#image("assets/unification/6.svg")

#image("assets/unification/6.svg")

On prend les mêmes et on recommence.

#image("assets/unification/7.svg")

Le foncteur de plus haut niveau est le même. OK.

#image("assets/unification/8.svg")

Le premier sous terme est un foncteur $g$ (à droite) et le second une variable $X$ (à gauche). On a donc une première
substitution qui émerge $sigma = { X arrow.r.bar g(Y, b) }$.

#image("assets/unification/9.svg")

Le second sous terme est une variable $Y$ (à droite) et une constante $a$ (à gauche). Ce qui complète la substitution
$sigma = { X arrow.r.bar g(Y, b), Y arrow.r.bar a }$.

Sans rentrer dans plus de détails, l'unification est un processus gourmand, qui à donné lieu à pas mal de travaux de
recherche d'optimisation. En particulier par #link("https://fr.wikipedia.org/wiki/John_Alan_Robinson")[Alan Robinson]
philosophe, mathématicien et informaticien anglais qui l'a redécouvert en 1965.

L'une des subtilités coûteuses de l'unification est le *test d'occurrence* communément appelé *occur check* : on doit
s'assurer quand on associe une variable à un terme que celle-ci n'apparaît pas libre dans le terme, sous peine de créer
des termes infinis. Selon les versions de *Prolog* il est possible de désactiver l'*occur check* pour des raisons de
performance ou au contraire d'embrasser la notion de terme rationnels qui sont des termes récursifs et donc infinis.

L'unification, avec la possibilité de répéter des variables, implique le test d'égalité : $f(X,X)$ n'est pas unifiable
avec $f(a,b)$ car $a != b$, mais l'est avec $f(g(a,b), g(a,b))$ par exemple.

Au dela de *Prolog*, l'unification est un processus qui rentre dans de nombreuses branches de la logique pour résoudre
des équations entre termes. Mais de façon très pragmatique elle est aussi au cœur d'algorithmes de typage, quand il
s'agit d' « inférer » des types, comme peuvent le faire des langages comme O'Caml, mais aussi Rust.
