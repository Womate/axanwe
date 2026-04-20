#import "@preview/touying:0.7.1": *
#import "@preview/colorful-boxes:1.4.3": *
#import emoji: fire

== Convention

#pause

Dans la suite de la présentation on nomme terme: #pause

$triangle.filled.small.r$ un litéral (entier, caractère etc.) e.g. 1, *'a'* #pause

$triangle.filled.small.r$ un atome (commence par une minuscule) e.g. *albert*, *$gamma$* #pause
 
$triangle.filled.small.r$ un foncteur e.g. *personne(robert, smith)*, *f("Hello",1)* #pause

$triangle.filled.small.r$ une variable (commence par une majuscule) e.g. *X*, *$Gamma$* 

== Convention : Visualisation des Termes

Les termes peuvent être vus comme des graphes orientés.

#image("assets/unification/1.svg", width: 90%)

#pause Dénotent les termes *`f(X,a)`* et *`f(g(a,b),a)`*.