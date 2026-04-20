#import "@preview/touying:0.7.1": *
#import "@preview/colorful-boxes:1.4.3": *

== Pour aller plus loin

#table(
  columns: (50%, 50%),
  stroke: none,
  [
    #align(center)[
      *Implémentations*
    ]
    #pause
    - #link("https://www.swi-prolog.org/")[SWI-Prolog] (le plus utilisé, open source)
    - #link("https://sicstus.sics.se/")[Sicstus Prolog] (commercial)
    - #link("https://www.gprolog.org/")[GNU Prolog]
    - #link("https://github.com/mthom/gprolog-wasm")[gprolog-wasm] (WebAssembly)
  ],
  [
    #align(center)[
      *Ressources*
    ]
    #pause
    - #link("https://www.swiprolog.org/")[The Art of Prolog] - Sterling & Shapiro
    - #link("https://www.clps.at/")[Constraint Logic Programming] - Jaffar & Maher
    - #link("https://www.metalevel.at/prolog")[Learn Prolog Now!]
  ]
)

#pause

#table(
  columns: (50%, 50%),
  stroke: none,
  [
    #align(center)[
      *Domaines d'application*
    ]
    #pause
    - Traitement du langage naturel (NLP)
    - Systèmes experts et règles métier
    - Planification et Scheduling
    - Bio-informatique
    - Vérification de programmes
  ],
  [
    #align(center)[
      *Écosystème*
    ]
    #pause
    - #link("https://pyke.sourceforge.net/")[Pyke] - Prolog en Python
    - #link("https://github.com/mthom/clpfd")[clpfd] - Contraintes finies
    - #link("https://github.com/LogtalkDotOrg/logtalk3")[Logtalk] - Programmation orientée objet
  ]
)



== Conclusion

#table(
  columns: (50%, 50%),
  stroke: none,
  [
    #align(center)[
      *Points forts*
    ]
    #pause
    - Expressivité déclarative
    - Résolution logique
    - Programmation par contraintes
    - Métaprogrammation
  ],
  [
    #align(center)[
      *Limitations*
    ]
    #pause
    - Performance variable
    - Courbe d'apprentissage
    - Debugging complexe
  ]
)

#pause

#colorbox(
  title:"Pour résumer",
  color:"green",
)[
Prolog reste un outil remarquable pour la programmation logique et la résolution de problèmes basés sur des règles. Son intégration avec les solveurs de contraintes en fait un langage polyvalent pour la modélisation de problèmes complexes.
]
