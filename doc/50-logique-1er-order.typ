#import "@preview/touying:0.6.2": *

== Logique du premier ordre

#table(
  columns: (auto, auto),
  inset: 10pt,
  align: (right,left),
  stroke: none,
  image("assets/prédicats/Frege.jpg"),
  [
    La logique du premier ordre à été proposée par #link("https://fr.wikipedia.org/wiki/Gottlob_Frege")[Gottlob Frege],
    un logicien de la fin du XIX#super[e] siècle. 
    
    C'est un système formel dont l'objectif est de décrire des énoncés et de pouvoir raisonner dessus.
  ]
)

== Logique du premier ordre: définition

Langage des termes:
#block[#h(1em) $X in "Variables", f in "Symbole"_f$ ]
#block[#h(1em) $t ::= X | f | f(t_1,...,t_n)$ ]

#pause
Langage des expressions:
#block[#h(1em) $p in "Symbole"_P$ ]
#block[#h(1em) $e ::= not e | e_1 and e_2 | e_1 or e_2 | e_1 arrow.r.double e_2 | p | p(t_1,...,t_n) | forall X.e | exists X.e$ ]

#pause
Toute personne à une mère et un père biologique:
#block[#h(1em) $forall X.(exists Y."mere"(Y , X)) and (exists Z."pere"(Z, X))$ ]

== Logique du premier ordre: raisonnement

#pause
Système formel avancée pour la manipulation d'assertions logiques: 

#pause
$triangle.filled.small.r$ Mise en forme prénexe par regroupement en tête des quantificateurs *$forall$* et *$exists$* 

#pause
$triangle.filled.small.r$ Principe de skolémisation par l'élimination des quantificateurs *$exists$*


#pause
#v(1em)
#align(center,[*Transformations mécanisables mais Quid de la résolution ?*])
#v(1em)

#pause
#align(center,[*Limitation aux clauses de Horn !*])
