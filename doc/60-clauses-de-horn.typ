#import "@preview/touying:0.6.2": *

== Clauses de Horn

Disjonctions constituées de *ou* et de *négation* ayant au plus un litéral positif.

#v(1em)

Elles ont la forme : $ not a_1 or not a_2 or ... or not a_n or b $

Qui ce transforme en :
$ not (a_1 and a_2 and ... and a_n) or b $

Et donc :
$ a_1 and a_2 and ... and a_n => b $
