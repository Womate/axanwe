#import "@preview/touying:0.6.2": *
#import "@preview/colorful-boxes:1.4.3": *

== Prolog

- Forme restreinte du calcul des prédicats #pause
- Principe d'unification de termes

== Survol du Langage Prolog

=== Termes
- Variables: X
- Entier: 1
- Atome: chien
- Foncteur: `montant(1_000,euro)`, montant(X,euro) 

#pause

=== Prédicats
- A: atome | foncteur
- A. pour les faits ou assertions
- A0 :- A1, ..., An. pour les règles
- Un programme est une suite de clauses

Calcul des Prédicats restreint aux Clauses de Horn

=== Notations

Les clauses de Horn en *Prolog* se notent comme suit. Pour l'expression:

$ a_1 and a_2 and ... and a_n => b $

On écrira :

```prolog
b :- a1, a2, ..., aN.
```

Ce qui se lit : « `b` est vrai si `a1` et vrai et `a2` et vrai jusqu'à `aN` ». En quelque sorte le $and$ devient une
virgule et le $=>$ un deux-points-tiret. En fait la définition des clauses de Horn, on la vu précédemment, c'est « une
formule disjonctive ayant au plus un litéral positif ». En gros ça implique quoi ? Trois cas de figure selon qu'on à des
`aN` ou un `b` dans notre clause:

```prolog
b.
```
Est un prédicat affirmant une vérité, par sa seule existence. En quelque sorte c'est un axiome, on dira que `b` est
vrai. Ici on n'a pas de `aN`.
```prolog
b :- a1, a2, ..., aN.
```
Est une règle. C'est le type de clause le plus général qui indique que « `b` est vrai si `a1` et vrai et `a2` et vrai
jusqu'à `aN` ».
```prolog
?- a1, a2, ..., aN.
```
Est un but à vérifier qui sera vrai si les `aN` sont vrai. Ici on n'a pas de `b`. Et on notera une subtilité, pour le
différentier d'un axiome, on ne note pas `:-` comme on aurait pu s'y attendre, mais `?-`. En fait c'est le prompt de la
CLI de *Prolog* qui se présente ainsi, car c'est le seul endroit où on peut exprimer un but.

=== Primitives

*Prolog* est un langage de programmation et en tant que tel on l'a équipé de primitives qui vont au delà des principes
théoriques qui le fondent. Pour ce qui est des types de données de base, qui forment les termes unifiables on trouve en
plus des atomes et des foncteurs :

- Les paires `[a | b]` et un atome particulier `ǹil`.
- Les listes `[a, b, c]` qui ne sont que des paires imbriquées `[a | [b | [c, nil]]]`. (On est sur le même principe
  qu'en *Lisp*).
- Les nombres sans distinction entre réels et entiers.
- Les chaînes de caractère notées "abcd".
- Des prédicats particuliers pour manipuler certains de ces types : opérateurs arithmétiques (`+`, `-`, ...),
  entrée/sorties (`write`), ...

Mais il nous manque un ingrédient : le moteur, ce qui donne des valeurs de vérité à nos expressions.

