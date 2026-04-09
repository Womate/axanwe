#import "@preview/touying:0.6.2": *
#import "@preview/colorful-boxes:1.4.3": *

== Notations

*Prolog* est la fusion de l'unification et des clauses de Horn.

#pause
#v(1em)

Pour l'expression

$ a_1 and a_2 and ... and a_n => b $

#pause
On écrira :

#stickybox(
         tape: false,
)[
```prolog
b :- a1, a2, ..., aN.
```
]

#pause
Qui se lit : « `b` est vrai si `a1` et vrai et `a2` et vrai jusqu'à `aN` ». 
 
== Clauses et but 

#pause 
=== Assertion
#stickybox(
         tape: false,
)[
```prolog
b.
```]

#pause 
=== Règle

#stickybox(
         tape: false,
)[
```prolog
b :- a1, a2, ..., aN.
```
]

#pause
=== But

#stickybox(
         tape: false,
)[
```prolog
?- a1, a2, ..., aN.
```
]

#pause
#v(1em)

#align(center, block[*Comment prouve t-on un but ? Quid de la résolution ?*])
