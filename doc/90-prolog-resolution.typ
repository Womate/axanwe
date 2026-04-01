#import "@preview/touying:0.6.2": *
#import "@preview/colorful-boxes:1.4.3": *
#import "@preview/tdtr:0.5.4": *

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
   
`mere(anne,paul)` est-il vrai ? Question fermée !

#pause

#stickybox(
  tape: false,
)[
```Prolog
?- mere(anne,P).
``` 
]
   
$exists$ `P`, `mere(anne,P)` soit vrai ? Question ouverte 

== Exemple Prolog: `?- mere(anne,P).`

#align(center)[
    #h(13%) #tidy-tree-graph( // Humm 
        draw-node: (stroke: none),
        text-size:20pt,       
        spacing: (150pt, 40pt)
    )[
        - `?- mere(anne,P)`
            - *$and$* 
                - `femme(anne)`
                  - *$square$*
                - `parent(anne,P)`
                    - *$or$*
                        + {P $arrow$ paul}
                        - *$square$*
                        + {P $arrow$ magali}
                        - *$square$*
    ]

    #pause

    #v(2em)

    * Deux solutions i.e. `{P` $arrow$ `paul}` and `{P` $arrow$ `magali}`*
]

== Résolution

Jusque là nous avons parlé de la syntaxe de la logique du premier ordre, mais comme pour tout langage il faut aussi
en donner la *sémantique*, c'est-à-dire le *sens* de chaque construction du langage. De façon générale il y a plusieurs
façons de procéder.

Approche dénotationnelle: Définir un modèle pour étudier les propriétés d'un langaged'un point de vue théorique.
Approche opérationnelle: Construire un environnement d'exécution pour un *langage de programmation*. 

== Résolution

#image("assets/résolution/John_Alan_Robinson_IMG_0493.jpg", width: 27%)

Le principe de résolution on le doit à #link("https://fr.wikipedia.org/wiki/John_Alan_Robinson")[John Alan Robinson]
mathématicien et informaticien anglais. 

La résolution on la retrouve au cœur des systèmes de preuve automatiques. *Prolog* s'appuie sur une version raffinée, la
*SLD-résolution* qui permet prouver une formule à partir d'un ensemble de *clauses de Horn*.

== SLD-résolution (principe)

Le processus est cyclique et suit une logique très précise :
- Sélection : choisit le premier littéral (le premier élément) de la question posée. #pause
- Unification : Cherche une règle ou un fait dont la "tête" s'unifie correspond à ce littéral. #pause
- Remplacement : Le littéral sélectionné est remplacé par le corps de la règle correspondante. #pause
- Répétition jusqu'à ce qu'il ne reste plus rien (succès) ou qu'aucune règle ne corresponde (échec). #pause

La SLD-résolution utilise deux règles de navigation: l'ordre des littéraux et des clauses.

Si l'algorithme s'engage dans une voie qui mène à un échec, il utilise le Backtracking (retour en arrière) pour revenir au 
dernier choix possible et essayer une autre règle.

== SLD-résolution (succès)

#image("assets/résolution/1.svg")
#image("assets/résolution/2.svg")
#image("assets/résolution/3.svg")
#image("assets/résolution/4.svg")
#image("assets/résolution/5.svg")

== SLD-résolution (échec)

#image("assets/résolution-échec/1.svg")
#image("assets/résolution-échec/2.svg")
#image("assets/résolution-échec/3.svg")
#image("assets/résolution-échec/4.svg")
#image("assets/résolution-échec/5.svg")

== SLD-résolution (échec)

#image("assets/résolution-synthèse/1.svg")
#image("assets/résolution-synthèse/2.svg")
#image("assets/résolution-synthèse/3.svg")
#image("assets/résolution-synthèse/4.svg")
#image("assets/résolution-synthèse/5.svg")
#image("assets/résolution-synthèse/6.svg")
#image("assets/résolution-synthèse/7.svg")
