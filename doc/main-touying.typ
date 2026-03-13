#import "@preview/touying:0.6.2": *
#import "@preview/colorful-boxes:1.4.3": *
#import "@preview/tdtr:0.5.4": *

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

// #set text(font:"iosevka")
// #show math.equation: set text(font: "iosevka")

#set heading(numbering: none)
#show math.frac: it => $display(it)$

#title-slide()

== Frédéric Cabestre

TODO

== Didier Plaindoux

TODO

== IA Connexionniste vs. IA Symbolique

#pause

#colorbox(
    title:"IA Connexioniste",
    color: "blue",
    radius: 2pt,
    width: auto,
)[
    Le connexionnisme met en avant l’idée que c’est en entrainant la machine à apprendre qu’elle sera en mesure d’agir 
    de manière intelligente.
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
    Technique qui s’appuie sur la logique et la manipulation de symboles. Son application la plus connue est la 
    conception des systèmes experts
]

#pause

*L’intelligence artificielle symbolique est une intelligence «lisible» par l’homme.*

= Fondations

== Le filtrage par motif

#stickybox(
         tape: false,
)[    
```Java
sealed interface Maybe<A> {
    record Just<A>(A value) implements Maybe<A> {}
    record Nothing<A>() implements Maybe<A> {}

    default <B> Maybe<B> map(Function<? super A, ? extends B> mapper) {
        return switch (this) {
            case Just<A>(var value) -> new Just<>(mapper.apply(value));
            case Nothing<A>() -> new Nothing<>();
        };
    }
}    
```
]


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

== Définition générale

La programmation logique est une approche déclarative des applications reposant sur : #pause
- une base de *faits* élémentaires, #pause
- une base de *règles* associant des conséquences à des faits et #pause
- un moteur de *démonstration* dit d'inférence #pause

*Approche reposant sur la description des propriétés du résultat et un démonstrateur*
 
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

== Résolution Prolog

Repose sur du *Don't know* non-determinism

- Sélectionne une tête de prédicat par unification
- Prouve le corps de la règle avec la substitution

À chaque selection il y a un *point rebroussement*

== Exemple Prolog

#stickybox(
  tape: false,
)[
```prolog
femme(anne).
parent(anne, paul).
parent(anne, magali).

mere(X,Y) :- femme(X), parent(X,Y).
```
]

#pause

$forall$ `X`, $forall$ `Y`,  `mere(X,Y)` est vrai si `femme(X)` et `parent(X,Y)` sont vrais.

#pause

#stickybox(
  tape: false,
)[
```Prolog
?- mere(anne,paul).
``` 
]
   
`mere(anne,paul)` est-il vrai ? Question fermée !

#pause

#stickybox(
  tape: false,
)[
```Prolog
?- mere(anne,P).
``` 
]
   
$exists$ `P`, `mere(anne,P)` soit vrai ? Question ouverte 

== Exemple Prolog: `?- mere(anne,P).`

#align(center)[
    #h(13%) #tidy-tree-graph( // Humm 
        draw-node: (stroke: none),
        text-size:20pt,       
        spacing: (150pt, 40pt)
    )[
        - `?- mere(anne,P)`
            - *$and$* 
                - `femme(anne)`
                  - *$square$*
                - `parent(anne,P)`
                    - *$or$*
                        + {P $arrow$ paul}
                        - *$square$*
                        + {P $arrow$ magali}
                        - *$square$*
    ]

    #pause

    #v(2em)

    * Deux solutions i.e. `{P` $arrow$ `paul}` and `{P` $arrow$ `magali}`*
]

= Prolog en action !

== Description de la règle d'emprunt capée à 35%

#colorbox(
    title:"Comment déterminer votre capacité d’emprunt ?",
    color:"blue",
)[
L’établissement bancaire détermine votre *capacité* d'endettement en appliquant à vos *ressources* un taux d'*effort* qui ne doit, en principe, *pas dépasser 35 %*.
]

#pause

#stickybox(
         tape: false,
)[
```prolog
detteMaxPourcent(35).

dette(famille(Ressources),mensualite(Capacite),dettePourcent(Effort)) :-
    detteMaxPourcent(DetteMaxPourcent),
    {Capacite =< DetteMaxPourcent / 100 * Ressources},
    {Effort = 100 * Capacite / Ressources}.
```
]    

== Description de la règle d'emprunt capée à 35% \~ Exemples

*Vérification d'endettement*

#stickybox(
         tape: false,
)[    
```prolog
?- dette(famille(4_000),mensualite(1_000),dettePercentage(25)).
```
]
#pause
```prolog
true
```

#pause

*Calcul de mensualité*

#stickybox(
         tape: false,
)[    
```prolog
?- dette(famille(4_000),mensualite(M),dettePercentage(25)).
```
]
#pause
```prolog
M = 1_000.0
```

#pause

*Proposition de mensualités à partir d'une dette $in$ \]20-25\] *

#stickybox(
         tape: false,
)[    
```prolog
?- dette(famille(4_000),mensualite(M),dettePercentage(D)), {20 < D, D =< 25}.
```
]
#pause
```prolog
{D=0.025*M, M>800.0, M=<1000.0}
```

== Système de type pour un $lambda$-calcul simple

#colorbox(
    title:"Représentation d'une règles de typage",
    color:"blue",
)[
On introduit la notation *$Γ ⊢ M : T$*, où $Γ$ est une liste de paires de la forme 
$ x: B$ où $x$ est une variable et $B$ un type, $M$  est un terme et $T$ un type. 
Elle se lit « dans le contexte $Γ$, le terme $M$ a pour type $T$.

Une règle de la forme *$(Γ_1 ⊢ M_1 : T_1 ... Γ_n ⊢ M_n : T_n) / (Γ ⊢ M : T)$* doit se 
comprendre comme "si $Γ_1 ⊢ M_1 : T_1 ... Γ_n ⊢ M_n : T_n$ alors $Γ ⊢ M : T$".
]

#pause

#colorbox(
    title:"Règle pour le λ-calcul simple",
    color:"green",
)[
$
((x : T) in Γ) / (Γ ⊢ x : T) #h(2em)
(Gamma ⊢ X : T_1 → T_2 #h(1em) Γ ⊢ Y : T_1) / (Γ ⊢ X #h(5pt) Y : T_2) #h(2em)
(Γ,x:T_1 ⊢ Y : T_2) / (Γ ⊢ lambda x.Y : T_1 → T_2) 
$
]
== Système de type pour un $lambda$-calcul simple
  
#pause    
    
#table(
  columns: (50%,50%),
  stroke: none,
    $ ((x : T) in Γ) / (Γ ⊢ x : T) #pause $,
    [
       #stickybox(
         tape: false,
       )[
```prolog
system(Γ ⊢ X : T) :-
    atom(X),!,
    in_gamma(X:T, Γ).        
```
        ]
        #pause    
    ],
    v(1em),v(1em),
    $ (Gamma ⊢ X : T_1 → T_2 #h(1em) Γ ⊢ Y : T_1) / (Γ ⊢ X #h(5pt) Y : T_2) #pause $,
    [
       #stickybox(
         tape: false,
       )[
```prolog
system(Γ ⊢ (X @ Y) : T2) :-
    system(Γ ⊢ X : (T1 → T2)),
    system(Γ ⊢ Y : T1).       
```
       ]
        #pause
    ],
    v(1em),v(1em),
    $ (Γ,x:T_1 ⊢ Y : T_2) / (Γ ⊢ lambda x.Y : T_1 → T_2) #pause $,   
    [
#stickybox(
 tape: false,
)[
```prolog
system(Γ ⊢ (X ⇒ Y) : (T1 → T2)) :-
    atom(X),
    system((Γ,X:T1) ⊢ Y : T2).
```
]
    ],
)

== Système de type pour un $lambda$-calcul simple \~ Exemples
    
*Fonction identité*
    
#stickybox(
         tape: false,
)[    
```prolog
?- system([] ⊢ (x ⇒ x) : T).
```
]
#pause
```prolog
T = (_A→_A)
```

#pause

*Application de fonction sans connaitre les hypothèses*

#stickybox(
         tape: false,
)[    
```prolog
?- system(Γ ⊢ (x @ y) : T).
```
]
#pause
```prolog
Γ = ((_, y:_A), x:(_A→T))
```

#pause

*Fonction d'application* (réification)

#stickybox(
         tape: false,
)[    
```prolog
?- system([] ⊢ (x ⇒ y ⇒ (x @ y)) : (T1 → T2)).
```
]
#pause
```prolog
T1 = T2, T2 = (_A→_B)
```
