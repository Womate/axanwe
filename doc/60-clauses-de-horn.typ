#import "@preview/touying:0.7.2": *

== Clauses de Horn

#pause Expressions constituées de *ou* et de *négation* ayant au plus un litéral positif.

#v(1em)

#pause Elles ont la forme : $ not a_1 or not a_2 or ... or not a_n or b $

#pause Qui se transforme (loi de De Morgan) en:
$ not (a_1 and a_2 and ... and a_n) or b $

#pause Qui se transforme en:
$ a_1 and a_2 and ... and a_n => b $
