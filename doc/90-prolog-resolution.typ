#import "@preview/touying:0.6.2": *
#import "@preview/colorful-boxes:1.4.3": *
#import "@preview/tdtr:0.5.4": *

== Résolution

#table(
  columns: (auto, auto),
  inset: 10pt,
  align: (right,left),
  stroke: none,
  image("assets/résolution/John_Alan_Robinson_IMG_0493.jpg", height: 50%),
  [#link("https://fr.wikipedia.org/wiki/John_Alan_Robinson")[John Alan Robinson]
mathématicien et informaticien anglais, propose un principe de réslution.

La résolution on la retrouve au cœur des systèmes de preuve automatiques. *Prolog* s'appuie sur une version raffinée, la
*SLD-résolution* qui permet prouver une formule à partir d'un ensemble de *clauses de Horn*.]
)

== SLD-résolution (principe)

Le processus est cyclique et suit une logique très précise :

*$1$ Sélection* : choisit le premier littéral (le premier élément) de la question posée. #pause

*$2$ Unification* : Cherche une règle ou un fait dont la tête s'unifie correspond à ce littéral. #pause

*$3$ Remplacement* : Le littéral est remplacé par le corps de la règle correspondante. #pause

*$4$ Répétition* : Jusqu'à ce qu'il ne reste plus rien ou qu'aucune règle ne corresponde. #pause

La SLD-résolution utilise deux règles de navigation: l'ordre des littéraux et des clauses.

Si l'algorithme est en échec, il utilise le retour en arrière (backtrack) pour revenir au dernier choix possible et essayer une autre règle.

== SLD-résolution (succès)

#image("assets/résolution/1.svg") #pagebreak()
#image("assets/résolution/2.svg") #pagebreak()
#image("assets/résolution/3.svg") #pagebreak()
#image("assets/résolution/4.svg") #pagebreak()
#image("assets/résolution/5.svg")

== SLD-résolution (échec)

#image("assets/résolution-échec/1.svg") #pagebreak()
#image("assets/résolution-échec/2.svg") #pagebreak()
#image("assets/résolution-échec/3.svg") #pagebreak()
#image("assets/résolution-échec/4.svg") #pagebreak()
#image("assets/résolution-échec/5.svg") #pagebreak()

== SLD-résolution avec bactrack

#image("assets/résolution-synthèse/1.svg") #pagebreak()
#image("assets/résolution-synthèse/2.svg") #pagebreak()
#image("assets/résolution-synthèse/3.svg") #pagebreak()
#image("assets/résolution-synthèse/4.svg") #pagebreak()
#image("assets/résolution-synthèse/5.svg") #pagebreak()
#image("assets/résolution-synthèse/5b.svg") #pagebreak()
#image("assets/résolution-synthèse/6.svg") #pagebreak()
#image("assets/résolution-synthèse/7.svg") #pagebreak()
#image("assets/résolution-synthèse/8.svg") #pagebreak()

== Exemple Prolog

#stickybox(
  tape: false,
)[
```prolog
femme(anne).
parent(anne, paul).
parent(anne, magali).

mere(X,Y) :- femme(X), parent(X,Y).
```
]

#pause

$forall$ `X`, $forall$ `Y`,  `mere(X,Y)` est vrai si `femme(X)` et `parent(X,Y)` sont vrais.

#pause

#stickybox(
  tape: false,
)[
```Prolog
?- mere(anne,paul).
``` 
]
   
`mere(anne,paul)` ? Question fermée et vrai !

#pause

#stickybox(
  tape: false,
)[
```Prolog
?- mere(anne,P).
``` 
]
   
$exists$ `P`, `mere(anne,P)` ? Question ouverte avec *$sigma = {P arrow.r.bar "paul"}$* ou *$sigma = {P arrow.r.bar "magali"}$*
