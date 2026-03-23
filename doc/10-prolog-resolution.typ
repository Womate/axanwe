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
