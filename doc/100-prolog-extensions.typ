#import "@preview/touying:0.6.2": *
#import "@preview/colorful-boxes:1.4.3": *
#import emoji: lightbulb

== Cas de l'égalité

Egalité structurelle induite par la clause:

#pause
#stickybox(
         tape: false,
)[
```prolog
equals(X,Y) :- X = Y.
```
]

#v(1em)

#pause
Qui peut être en fait remplacée par l'assertion:

#stickybox(
         tape: false,
)[
```prolog
equals(X,X).
```
]

== Contrôle du retour arrière


Ne pas essayer des règles alternatives pour satisfaire le prédicat courant si la suite échoue.

#pause
Assertion native appelée CUT notée: *!*  

#v(2em)

#pause
On distingue les green et red cut.

$triangle.filled.small.r$ *Green cut* : sa suppression ne change rien aux réponses

$triangle.filled.small.r$ *Red cut* : sa suppression peut changer les réponses

== Cas du call/1 ou l'homoiconicité

*`call(X)`* lorsque X est instancé à un terme syntaxiquement correct, lance le but en question.

#emoji.lightbulb Capacité au langage à manipuler ses termes #pause ... comme Lisp.

#v(1em)

#pause
#stickybox(
         tape: false,
)[
```prolog
and(X,Y) :- call(X), call(Y).
or(X,Y)  :- call(X), !.
or(X,Y)  :- call(Y).
```
]

#pause
Cas d'usage d'un *Green Cut*.

== Cas de la négation

Pas d’hypothèse de *monde clos* i.e. non monotone.

#stickybox(
         tape: false,
)[
```prolog
not(B) :- call(B), !, fail.
not(_).
```
]

#pause
Cas d'usage d'un *Red Cut*.

