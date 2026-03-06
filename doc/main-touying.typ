#import "@preview/touying:0.6.2": *
#import "@preview/colorful-boxes:1.4.3": *

#import themes.metropolis: *

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

#colorbox(
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

Repose sur du *Don't know* non-determinism

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

== Système de type pour un $lambda$-calcul simple
    
#table(
  columns: (20em,20em),
  stroke: none,
    $ ((X : T) in Γ) / (Γ ⊢ X : T) #pause $,
    [
        ```prolog
        system(Γ ⊢ X : T) :-
            atom(X),
            in_gamma(X:T, Γ).
        ```
        #pause    
    ],
    v(1em),v(1em),
    $ (Γ ⊢ X : T_1 → T_2 #h(1em) Γ ⊢ Y : T_1) / (Γ ⊢ X #h(5pt) Y : T_2) #pause $,
    [
        ```prolog
        system(Γ ⊢ (X @ Y) : T2) :-
            system(Γ ⊢ X : (T1 → T2)),
            system(Γ ⊢ Y : T1).
        ```
        #pause
    ],
    v(1em),v(1em),
    $ (Γ,X:T_1 ⊢ Y : T_2) / (Γ ⊢ X ⇒ Y : T_1 → T_2) #pause $,   
    [
        ```prolog
        system(Γ ⊢ (X ⇒ Y) : (T1 → T2)) :-
            system((Γ,X:T1) ⊢ Y : T2).
        ```
    ],
)

== Système de type pour un $lambda$-calcul simple
    
*Typage de la fonction identité*
    
```prolog
?- system([] ⊢ (x ⇒ x) : T).
T = (_A→_A),
```

#pause #v(1em)

*Application à la fonction identité sans connaitre les hypothèses*

```prolog
?- system(Γ ⊢ ((x ⇒ x) @ y) : T).
Γ = (_, y:T)
```

#pause #v(1em)

*Fonction d'application* (réification)

```prolog
?- system([] ⊢ (x ⇒ y ⇒ (x @ y)) : (T1 → T2)).
T1 = T2, T2 = (_A→_B),
```

== Description de la règle d'emprunt capée à 35%

#align(center)[
```prolog
maxDebt(35).

debt(family(NetSalary),monthly(Instalment),debtPercent(Percent)) :-
    maxDebt(MaxDebt),
    {Instalment =< MaxDebt / 100 * NetSalary},
    {Percent = 100 * (Instalment / NetSalary)}.
```
]    

== Description de la règle d'emprunt capée à 35%


*Simple calcul de l'endettement*

```prolog
?- debt(family(4_500),monthly(1_500),debtPercent(P)).
P = 33.333333333333336.
```

#pause #v(1em)

*Proposition de mensualité à partir d'une base*

```prolog
?- debt(family(4_500),monthly(X),debtPercent(35)).
X = 1575.0.
```
