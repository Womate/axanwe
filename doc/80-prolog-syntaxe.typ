#import "@preview/touying:0.7.2": *
#import "@preview/colorful-boxes:1.4.3": *

== Prolog : Notations

*Prolog* repose sur la resolution de clauses de Horn avec le support de l'unification

#pause
#v(1em)

L'expression 

$ a_1 and a_2 and ... and a_n => b $

#pause
#v(1em)

S'écrit avec la syntaxe dite d'Edimbourg:

#stickybox(
         tape: false,
)[
```prolog
b :- a1, a2, ..., aN.
```
]

#pause
Qui se lit : « `b` est vrai si `a1` et vrai et `a2` et vrai etc. jusqu'à `aN` ». 
 
== Prolog : Clauses et but 

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

#align(center, block[*Comment prouve-t-on un but ? Quid de la résolution ?*])
