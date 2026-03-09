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

== IA Connexioniste vs. IA Symbolique

#pause

#colorbox(
    title:"IA Connexioniste",
    color: "blue",
    radius: 2pt,
    width: auto,
)[
Le connexionnisme met de l’avant l’idée que c’est en entrainant la machine à apprendre qu’elle sera en mesure d’agir de manière intelligente.
]

#pause

*L'approche connexionniste a souvent été critiquée pour son opacité.*

#pause

#colorbox(
    title:"IA Symbolique",
    color: "blue",
    radius: 2pt,
    width: auto,
)[
Technique qui s’appuie sur la logique et la manipulation de symboles. Son application la plus connue est la conception des systèmes experts
]

#pause

*L’intelligence artificielle symbolique est une intelligence «lisible» par l’homme.*

= Fondations

== Le filtrage par motif

```Java
sealed interface Maybe<A> {
    record Just<A>(A value) implements Maybe<A> {}
    record Nothing<A>() implements Maybe<A> {}
```
#pause
```Java

    default <B> Maybe<B> map(Function<? super A, ? extends B> mapper) {
        return switch (this) {
            case Just<A>(var value) -> new Just<>(mapper.apply(value));
            case Nothing<A>()  -> new Nothing<>();
        };
    }
```
#meanwhile
```Java
}
```
#pause
*Le filtrage de* `Just<A>(var value)` *permet de capturer un fragment lié à* `value`


== Unification

Jacques Herbrand \~ 1930

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

== Clauses de Horn

TODO

= Programmation Logique

== Prolog
#set page(background: image("assets/extrait-article.png", width: 130%, height: 130%))

#table(
  columns: (auto, auto),
  inset: 10pt,
  align: (right,left),
  stroke: none,
  image("assets/A-Colmerauer_web-800x423.jpg", width: 67%),
  image("assets/Philippe_Roussel_informaticien.jpg", width: 60%),
)

#align(center)[
    *#link(
        "http://alain.colmerauer.free.fr/alcol/ArchivesPublications/HommeMachineFr/HoMa.pdf", 
        "Un système de communication homme-machine en Français"
    )* 
    
    Alain Colmerauer, Henri Kanoui, Philippe Roussel & Robert Pasero \~ 1972
]

== Prolog
#set page(background: none)

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

= Prolog en action !


== Système de type pour un $lambda$-calcul simple
  
#pause    
    
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

== Système de type pour un $lambda$-calcul simple \~ Exemples
    
*Typage de la fonction identité*
    
```prolog
?- system([] ⊢ (x ⇒ x) : T).
```
#pause
```prolog
T = (_A→_A)
```

#pause #v(1em)

*Application de fonction sans connaitre les hypothèses*

```prolog
?- system(Γ ⊢ (x @ y) : T,L).
```
#pause
```prolog
Γ = ((_, y:_A), x:(_A→T))
```

#pause #v(1em)

*Fonction d'application* (réification)

```prolog
?- system([] ⊢ (x ⇒ y ⇒ (x @ y)) : (T1 → T2)).
```
#pause
```prolog
T1 = T2, T2 = (_A→_B)
```

== Description de la règle d'emprunt capée à 35%

#align[
```prolog
maxDebt(35).

debt(family(NetSalary),monthly(Instalment),debtPercent(Percent)) :-
    maxDebt(MaxDebt),
    {Instalment =< MaxDebt / 100 * NetSalary},
    {Percent = 100 * (Instalment / NetSalary)}.
```
]    

== Description de la règle d'emprunt capée à 35% \~ Exemples

*Vérification l'endettement*

```prolog
?- debt(family(4_000),monthly(1_000),debtPercent(25)).
```
#pause
```prolog
true
```

#pause #v(1em)

*Simple calcul de l'endettement*

```prolog
?- debt(family(4_000),monthly(M),debtPercent(25)).
```
#pause
```prolog
M = 1_000.0
```

#pause #v(1em)

*Proposition de mensualité à partir d'un internal de pourcentages*

```prolog
?- debt(family(4_000),monthly(M),debtPercent(P)), {20 < P, P =< 25}.
```
#pause
```prolog
{P=0.025*M, M>800.0, M=<1000.0}.
```
