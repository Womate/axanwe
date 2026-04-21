#import "@preview/touying:0.7.2": *
#import "@preview/colorful-boxes:1.4.3": *
#import emoji: lightbulb

== Extension Prolog : Contrôle du retour arrière

#pause Ne pas essayer des règles alternatives pour satisfaire le prédicat courant si la suite échoue.

#pause $triangle.filled.small.r$ *Assertion native `!`* appelée _cut_ (coupure) en anglais

#pause $triangle.filled.small.r$ *Green cut* : sa suppression ne change rien aux réponses

#pause $triangle.filled.small.r$ *Red cut* : sa suppression peut changer les réponses

#pause #stickybox(
  tape: false,
)[
```prolog
femme(anne).
parent(anne, paul) :- !.
parent(anne, magali).
mere(X,Y) :- femme(X), parent(X,Y).
```
]

#pause

#stickybox(
  tape: false,
)[
```Prolog
?- mere(anne,P).
``` 
]
   
$exists$ `P`, `mere(anne,P)` ? Question ouverte avec *$sigma = {P arrow.r.bar "paul"}$* uniquement !

== Extension Prolog : call/1

#pause *`call(X)`* lorsque X est unifié à un atome ou un foncteur, il résoud le but en question.

#pause #emoji.lightbulb Capacité du langage à manipuler ses termes #pause ... comme Lisp.

#pause $triangle.filled.small.r$ Principe d'homoiconicité

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

#pause
#stickybox(
         tape: false,
)[
```prolog
?- and(or(true,false), true).
```
]

== Extension Prolog : la négation

#pause Pas d’hypothèse de *monde clos* c-à-d. non monotone. 

#pause $triangle.filled.small.r$ Combinaison de *call* et de *cut*

#pause #stickybox(
         tape: false,
)[
```prolog
not(B) :- call(B), !, fail.
not(_).
```
]

#pause
Cas d'usage d'un *Red Cut*.

