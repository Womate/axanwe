#import "@preview/touying:0.6.2": *
#import "@preview/colorful-boxes:1.4.3": *

== Clauses de Horn

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
