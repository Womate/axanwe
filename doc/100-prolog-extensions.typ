#import "@preview/touying:0.6.2": *
#import "@preview/colorful-boxes:1.4.3": *

== Cas de l'égalité

#stickybox(
         tape: false,
)[
```prolog
eq(X,Y) :- X = Y.

eq(X,X).
```
]

== Contrôle du retour arrière

Presentation du CUT

== Cas du call/1

Homoiconicité -> call(X) lorsque X est instancé à un terme syntaxiquement correct, lance le but en question.

== Cas de la négation

#stickybox(
         tape: false,
)[
```prolog
not(B) :- call(B), !, fail.
not(_).
```
]

