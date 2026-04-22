#import "@preview/touying:0.7.2": *

== Logique du premier ordre

#table(
  columns: (auto, auto),
  inset: 10pt,
  align: (right,left),
  stroke: none,
  image("assets/prédicats/Frege.jpg", height: 70%),
  [
    La logique du premier ordre à été proposée par #link("https://fr.wikipedia.org/wiki/Gottlob_Frege")[Gottlob Frege],
    un logicien de la fin du XIX#super[e] siècle. 
    
    #pause C'est un système formel dont l'objectif est de décrire des énoncés et de pouvoir raisonner mécaniquement dessus.

    #pause On parle aussi de *calcul des prédicats du premier ordre*.
  ]
)

== Logique du premier ordre : définition

#pause $triangle.filled.small.r$ Langage des termes
#block[#h(2em) $X in "Variables", f in "Symbole"_f$ ]
#block[#h(2em) $t ::= X | f | f(t_1,...,t_n)$ ]

#pause $triangle.filled.small.r$ Langage des prédicats
#block[#h(2em) $p in "Symbole"_P$ ]
#block[#h(2em) $e ::= not e | e_1 and e_2 | e_1 or e_2 | e_1 arrow.r.double e_2 | p | p(t_1,...,t_n) | forall X.e | exists X.e$ ]

#v(1em)
#pause
*Toute personne a une mère et un père biologique*:
#align(center)[$forall X.(exists Y."mère"(Y , X)) and (exists Z."père"(Z, X))$ ]

== Logique du premier ordre : raisonnement

#pause
Système formel avancé pour la manipulation d'expressions logiques: 

#pause $triangle.filled.small.r$ Mise en *Forme Prénexe* par regroupement en tête des quantificateurs *$forall$* et *$exists$*

#h(1em) Formalisé par David Hilbert et Wilhelm Ackermann en 1928

#pause $triangle.filled.small.r$ Principe de *Herbrandisation* par l'élimination des quantificateurs *$forall$* #pause ou

$triangle.filled.small.r$ Principe de *Skolémisation* par l'élimination des quantificateurs *$exists$*

#pause
#v(1em)
*Transformations mécanisables #pause mais quid de la Résolution ?*
#v(1em)

#pause
$triangle.filled.small.r$ Moteur de satisfiabilité modulo théories appelé aussi Solveur SMT ou

#pause
$triangle.filled.small.r$ Moteur limité à un sous ensemble : les clauses de Horn !
