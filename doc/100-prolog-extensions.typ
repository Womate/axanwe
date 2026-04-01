#import "@preview/touying:0.6.2": *
#import "@preview/colorful-boxes:1.4.3": *

== Contrôle du retour arrière

Presentation du CUT

== Cas de l'égalité

#stickybox(
         tape: false,
)[
```prolog
eq(X,Y) :- X = Y.

eq(X,X).
```
]

== Cas du call/1

call(X) lorsque X est instancé à un terme syntaxiquement correct, lance le but en question.

== Cas de la négation

#stickybox(
         tape: false,
)[
```prolog
not(B) :- call(B), !, fail.
not(_).
```
]

