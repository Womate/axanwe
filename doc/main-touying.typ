#import "@preview/touying:0.6.2": *
#import "@preview/colorful-boxes:1.4.3": *

#import themes.metropolis: *

#show: metropolis-theme.with(aspect-ratio: "16-9")

#show: metropolis-theme.with(
    aspect-ratio: "16-9",
    config-info(
        title: [Prolog],
        subtitle: [Un langage mature mais sous-estimé pour de l’IA symbolique !],
        author: [Frédéric Cabestre & Didier Plaindoux],
        date: datetime.today(),
    ),
)

#set heading(numbering: none)

#title-slide()

== Frédéric Cabestre

TODO

== Didier Plaindoux

TODO

= Fondations

== Unification

Jacques Herbrand ~ 1930

#box[
    Trouver une substitution $sigma$ qui appliquée à deux termes les rend identiques
]

#colorbox(
    color: "green",
    radius: 2pt,
    width: auto,
)[
    $ 2+X ≟ Y+1, σ = {X→1,Y→2}$
    
    Problème de la Solution principale
]

== Calcul des prédicats

Système formel pour raisonner par *Gottlob Frege*. \

#pause

#colorbox(
    title: "Termes",
    color: "green",
    radius: 2pt,
    width: auto,
)[
  $ X in "Variables", C in "Constante", f in "Symbole"_f, t ::= X | C | f(t_1,...,t_n) $
]

#pause

#colorbox(
    title: "Prédicats",
    color: "green",
    radius: 2pt,
    width: auto,
)[
  $ P in "Symbole"_P, e ::= not e | e_1 and e_2 | e_1 or e_2 | e_1 arrow.r.double e_2 | P(t_1,...,t_n) | forall X.e | exists X.e $
]

#pause

#slanted-colorbox(
    title: "Exemple",
    color: "blue",
    radius: 4pt,
    width: auto,
)[
  $ forall X.exists Y."parent"(X,Y) and "femme"(X) arrow.r.double "mere"(X,Y) $
]

== Programmation Logique

#table(
  columns: (auto, auto),
  inset: 10pt,
  align: center,
  stroke: none,
  image("assets/A-Colmerauer_web-800x423.jpg", width: 40%),
  image("assets/Philippe_Roussel_informaticien.jpg", width: 40%),
  "Alain Colmerauer",
  "Philippe Roussel", 
)

== Prolog

- Forme restreinte du calcul des prédicats #pause
- Principe d'unification de termes

== Termes Prolog

- Variables: X
- Entier: 1
- Atome: chien
- Foncteur: montant(1_000,euro)

== Prédicats Prolog

- A: atome | foncteur
- A. pour les faits ou assertions
- A0 :- A1, ..., An. pour les règles
- Un programme est une suite de clauses

Calcul des Prédicats restreint aux Clauses de Horn

== Résolution Prolog

Repose sur du Don't know non-determinism

- Sélectionne une tête de prédicat par unification
- Prouve le corps de la règle avec la substitution

À chaque selection il y a un point rebroussement

== Exemple Prolog

```prolog
femme(anne).
parent(anne, paul).
parent(anne, magali).

mere(X,Y) :- femme(X), parent(X,Y).
```

---