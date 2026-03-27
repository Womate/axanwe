#set page(paper: "a4")
#show link: underline

= Réflexion sur un déroulé

== Unification

=== Données du langage

Les données manipulées par *Prolog* sont nommés *termes du langage*. Ils ont le même rôle que les entiers, chaînes de
caractère, listes et autres structures dans à peut près tous les langages que vous connaissez. La grammaire pour les
définir à cette tête:

$ X in "Variables", c in "Constante", f_n in "Foncteurs", t ::= X | c | f_n (t_1,...,t_n) $

Ce qui revient à dire qu'un terme Prolog, une donnée, est soit une variable (dénotée par une lettre majuscule par
convention), soit une constante (dénoté par une minuscule), soit une structure (record) d'arité $n$, regroupant $n$
sous termes.

Une particularité ici, qui pourrait sembler anodine mais qui ne le sera pas, les variables font partie des termes, ce
ne sont pas des concepts de première classe, donc manipulables.

=== Vue comme arbre / graphe 

Un terme peut se voir comme un graphe orienté acyclique.

#image("assets/unification/1.svg")

=== Filtrage

Vous avez peut-être déjà entendu parler de *pattern matching* (ou filtrage de motifs), surtout si vous avez fréquenté
des langages comme O'Caml, Haskell ou Rust par exemple. L'idée c'est qu'on puisse capturer des valeurs d'un terme en le
faisant passer au _tamis_ d'un autre terme à trous. Par exemple :

#image("assets/unification/2.svg")

Ici on a un terme $f(g(a,b),a)$ et on veut le faire passer au tamis de $f(X,a)$

#image("assets/unification/3.svg")

Les foncteurs de plus haut niveau correspondent: OK.

#image("assets/unification/4.svg")

Les constantes en seconde position correspondent: OK.

#image("assets/unification/5.svg")

En première position du terme à filtrer on à un sous terme $g(a,b)$ et côté filtre on a une variable. OK. Donc avec la
substitution $sigma = { X arrow.r.bar g(a, b) }$ permet de rendre le filtre identique au terme à filtrer. On capture
$g(a, b)$ dans $$X. Et en avant.

Le filtrage impose quelque limitations (pour des raisons théoriques ? D'implémentation efficace ?) : le filtre ne peut
pas avoir de variables répétées. Autrement dit $f(X,X)$ est interdit. Le terme filtré pour sa part ne doit pas contenir
de variables.

=== Unification

#image("assets/unification/Herbrand.jpg", height: 50%)

#link("https://fr.wikipedia.org/wiki/Jacques_Herbrand")[Jacques Herbrand] (1908-1931), mathématicien et logicien
français propose une méthode pour déterminer si on peut trouver une substitution $sigma$ telle qu'elle rende deux
termes identiques (égaux ?). Ici, il n'y a plus d'asymétrie entre terme à filter et filtre. Les deux termes ont le même
statut. Et plus plus de limitation sur les variables : on peut trés bien les répéter dans un terme.

#image("assets/unification/6.svg")

#image("assets/unification/6.svg")

On prend les mêmes et on recommence.

#image("assets/unification/7.svg")

Le foncteur de plus haut niveau est le même. OK.

#image("assets/unification/8.svg")

Le premier sous terme est un foncteur $g$ (à droite) et le second une variable $X$ (à gauche). On a donc une première
substitution qui émerge $sigma = { X arrow.r.bar g(Y, b) }$.

#image("assets/unification/9.svg")

Le second sous terme est une variable $Y$ (à droite) et une constante $a$ (à gauche). Ce qui complète la substitution
$sigma = { X arrow.r.bar g(Y, b), Y arrow.r.bar a }$.

Sans rentrer dans plus de détails, l'unification est un processus gourmand, qui à donné lieu à pas mal de travaux de
recherche d'optimisation. En particulier par #link("https://fr.wikipedia.org/wiki/John_Alan_Robinson")[Alan Robinson]
philosophe, mathématicien et informaticien anglais qui l'a redécouvert en 1965.

L'une des subtilités coûteuses de l'unification est le *test d'occurrence* communément appelé *occur check* : on doit
s'assurer quand on associe une variable à un terme que celle-ci n'apparaît pas libre dans le terme, sous peine de créer
des termes infinis. Selon les versions de *Prolog* il est possible de désactiver l'*occur check* pour des raisons de
performance ou au contraire d'embrasser la notion de terme rationnels qui sont des termes récursifs et donc infinis.

L'unification, avec la possibilité de répéter des variables, implique le test d'égalité : $f(X,X)$ n'est pas unifiable
avec $f(a,b)$ car $a != b$, mais l'est avec $f(g(a,b), g(a,b))$ par exemple.

Au dela de *Prolog*, l'unification est un processus qui rentre dans de nombreuses branches de la logique pour résoudre
des équations entre termes. Mais de façon très pragmatique elle est aussi au cœur d'algorithmes de typage, quand il
s'agit d' « inférer » des types, comme peuvent le faire des langages comme O'Caml, mais aussi Rust.

== Clauses de Horn

Ensuite le principe opérationnel de *Prolog* c'est la logique du premier ordre mais avec quelques restrictions pour des
raisons pratiques.

=== Logique du premier ordre

#image("assets/prédicats/Frege.jpg")

La logique du premier ordre à été proposée par #link("https://fr.wikipedia.org/wiki/Gottlob_Frege")[Gottlob Frege],
un logicien de la fin du XIX#super[e] siècle. C'est un système formel, c'est à dire un langage dont la syntaxe et la
sémantique sont définis rigoureusement. Son objectif est de décrire des énoncé de mathématique (mais aussi de
philosophie, de linguistique) et de pouvoir raisonner dessus.

Ce langage introduit toute une famille de symboles:
- des connecteurs logiques ($not$, $and$, $or$, $=>$, ...)
- des quantificateurs ($forall$, $exists$)
- des variables, prenant leurs valeur sur un domaine d'interprétation, qui sont quantifiables ($X$, $Y$, ...).
- des prédicats, qui décrivent des relations de vérité entre éléments du domaine, qui ne sont pas quantifiables
  ($"pere"$, $"plusGrand"$, ...). C'est parce qu'on ne peut pas quantifier sur les prédicats qu'on qualifie cette
  logique de « premier ordre ». Il existe des logiques d'ordre supérieur bien sur, mais ce n'est pas notre sujet ici.

On suivra ici la convention de notation de *Prolog* : les variables commencent par une majuscule et les prédicats par
des minuscules.

Ce qui permet d'écrire des expressions de la forme :

$ forall X (exists Y "mere"(Y , X) and exists Z "pere"(Z, X)) $

exprimant le fait que toute personne à une mère et un père biologique.

=== Clauses de Horn

Sauf que si ce genre de système formel est une avancée pour la manipulation d'assertions logiques, ça n'est pas
encore très pratique à mécaniser. Or c'est tout de même un de nos objectifs à nous informaticiens.

Sans renter dans des détails qui dépassent le cadre de cette présentation, il existe des transformations et autres
restrictions qui rendent la chose plus simple. Tout d'abord il y a deux transformations qui permettent de se débarrasser
des quantificateurs la mise en « #link("https://fr.wikipedia.org/wiki/Forme_pr%C3%A9nexe")[forme prénexe] » pour les
$forall$ et la « #link("https://fr.wikipedia.org/wiki/Skol%C3%A9misation")[skolémisation] » pour les $exists$.

Et puis on se limite à type de formules appelées « clauses de Horn ». Il s'agit de formules disjonctives (constituées
uniquement de « ou » ($or$) et de négations ($not$) ayant au plus un litéral positif.

#set text(blue)
Peut-être faudrait-il parler de d'algèbre de Boole et du fait qu'on peut se ramener à du NAND ?
#set text(black)

Elles ont la forme :
$ not a_1 or not a_2 or ... or not a_n or b $
Ce qui ce transforme en :
$ not (a_1 and a_2 and ... and a_n) or b $
Et donc :
$ a_1 and a_2 and ... and a_n => b $

== Prolog

Le langage *Prolog* à été imaginé en 1972 à l'université de Luminy de Marseille par deux informaticiens français:
#link("https://fr.wikipedia.org/wiki/Alain_Colmerauer")[Alain Colmerauer]
#image("assets/A-Colmerauer_web-800x423.jpg")
et
#link("https://fr.wikipedia.org/wiki/Philippe_Roussel")[Philippe Roussel]
#image("assets/Philippe_Roussel_informaticien.jpg")

Sa cible était l'intelligence artificielle (telle qu'on la concevait dans les années 70 et 80) et tout particulièrement
au traitement du langage naturel.

*Prolog* est la fusion de l'unification et de la logique du premier ordre réduite aux clauses de Horn. Et
bien sûr on ne s'embête pas avec la skolémisation ou la forme prénexe, ou quoi que ce soit de ce niveau d'abstraction.
Ce sont des notions qui ont pour but de prouver une bonne foi pour toute l'équivalence avec la logique du premier ordre
et donc la puissance des expressions du langage *Prolog*.

Dans la vraie vie, on exprime directement les problèmes à traiter sous forme de clauses de Horn

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

=== Résolution

Jusque là nous avons parlé de la syntaxe de la logique du premier ordre, mais comme pour tout langage il faut aussi
en donner la *sémantique*, c'est-à-dire le *sens* de chaque construction du langage. De façon générale il y a plusieurs
façons de procéder.

Il y a une approche plus mathématique où l'on va définir un domaine d'interprétation (un modèle) qui va permettre de
donner des valeurs de vérité aux formules du langage. C'est bien quand on veut étudier les propriétés d'un langage
d'un point de vue théorique.

Et il y a une approche plus *opérationnelle* où l'on va chercher à déduire les formules par calcul. Cette approche est
plus adaptée pour construire un environnement d'exécution pour un *langage de programmation*. Plusieurs approches ont
été proposées comme le déduction naturelle, le calcul des séquents ou la *résolution*.

Le principe de résolution on le doit à #link("https://fr.wikipedia.org/wiki/John_Alan_Robinson")[John Alan Robinson]
mathématicien et informaticien anglais, ayant travaillé sur la démonstration automatique de théorèmes, et a qui on doit
aussi les prémices d'un algorithme d'unification efficace.
#image("assets/résolution/John_Alan_Robinson_IMG_0493.jpg")

La résolution on la retrouve au cœur des systèmes de preuve automatiques. *Prolog* s'appuie sur une version raffinée, la
*SLD-résolution* qui permet prouver une formule à partir d'un ensemble de *clauses de Horn*.

=== SLD-résolution (succès)

#image("assets/résolution/1.svg")
#image("assets/résolution/2.svg")
#image("assets/résolution/3.svg")
#image("assets/résolution/4.svg")
#image("assets/résolution/5.svg")

=== SLD-résolution (échec)

#image("assets/résolution-échec/1.svg")
#image("assets/résolution-échec/2.svg")
#image("assets/résolution-échec/3.svg")
#image("assets/résolution-échec/4.svg")
#image("assets/résolution-échec/5.svg")


=== SLD-résolution (échec)

#image("assets/résolution-synthèse/1.svg")
#image("assets/résolution-synthèse/2.svg")
#image("assets/résolution-synthèse/3.svg")
#image("assets/résolution-synthèse/4.svg")
#image("assets/résolution-synthèse/5.svg")
#image("assets/résolution-synthèse/6.svg")
#image("assets/résolution-synthèse/7.svg")

=== Négation

== Prolog en Action





