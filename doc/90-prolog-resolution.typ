#import "@preview/touying:0.7.2": *
#import "@preview/colorful-boxes:1.4.3": *
#import "@preview/tdtr:0.5.4": *

== Prolog : Résolution

#table(
  columns: (auto, auto),
  inset: 10pt,
  align: (right,left),
  stroke: none,
  image("assets/résolution/John_Alan_Robinson_IMG_0493.jpg", height: 50%),
  [#link("https://fr.wikipedia.org/wiki/John_Alan_Robinson")[John Alan Robinson]
mathématicien et informaticien anglais, propose un principe de résolution.

*Prolog* s'appuie sur la *résolution SLD* qui permet la preuve
d'une une formule à partir d'un ensemble de *clauses de Horn*.]
)

== Prolog : SLD-résolution

Le processus est cyclique et suit une logique très précise :

*Sélection* : Choisir le premier but de la question posée. #pause

*Unification* : Chercher une règle ou un fait dont la tête s'unifie avec ce but. #pause

*Remplacement* : Le but est remplacé par le corps de la règle correspondante. #pause

*Répétition* : Jusqu'à ce qu'il ne reste plus rien ou qu'aucune règle ne corresponde. #pause

La SLD-résolution utilise deux règles de navigation : l'ordre des littéraux et des clauses.

Lors d'échec, il rebrousse chemin (_backtrack_) jusqu'au dernier choix possible et essaye une autre règle.

== Prolog : SLD-résolution par l'exemple

#image("assets/résolution/1.svg") #pagebreak()
#image("assets/résolution/2.svg") #pagebreak()
#image("assets/résolution/3.svg") #pagebreak()
#image("assets/résolution/4.svg") #pagebreak()
#image("assets/résolution/5.svg")

/*
== Prolog : SLD-résolution par l'exemple

#image("assets/résolution-échec/1.svg") #pagebreak()
#image("assets/résolution-échec/2.svg") #pagebreak()
#image("assets/résolution-échec/3.svg") #pagebreak()
#image("assets/résolution-échec/4.svg") #pagebreak()
#image("assets/résolution-échec/5.svg") #pagebreak()
*/

== Prolog : SLD-résolution avec backtrack par l'exemple

#image("assets/résolution-synthèse/1.svg") #pagebreak()
#image("assets/résolution-synthèse/2.svg") #pagebreak()
#image("assets/résolution-synthèse/3.svg") #pagebreak()
#image("assets/résolution-synthèse/4.svg") #pagebreak()
#image("assets/résolution-synthèse/5.svg") #pagebreak()
#image("assets/résolution-synthèse/5b.svg") #pagebreak()
#image("assets/résolution-synthèse/6.svg") #pagebreak()
#image("assets/résolution-synthèse/7.svg") #pagebreak()

== SLD-résolution avec backtrack

#image("assets/résolution-synthèse/8.svg") 
// Parler de synthèse de terme par opposition à l'héritage de terme

/*
== Prolog : Exemple

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

#pause $forall$ `X`, $forall$ `Y`,  `mere(X,Y)` est vrai si `femme(X)` et `parent(X,Y)` sont vrais.

#pause #stickybox(
  tape: false,
)[
```Prolog
?- mere(anne,paul).
``` 
]
   
#pause `mere(anne,paul)` ? Question fermée et vrai !

#pause #stickybox(
  tape: false,
)[
```Prolog
?- mere(anne,P).
``` 
]
   
#pause $exists$ `P`, `mere(anne,P)` ? Question ouverte avec *$sigma = {P arrow.r.bar "paul"}$* ou *$sigma = {P arrow.r.bar "magali"}$*
*/