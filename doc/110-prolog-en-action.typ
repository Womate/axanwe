#import "@preview/touying:0.6.2": *
#import "@preview/colorful-boxes:1.4.3": *

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
detteMaximumPourcent(35).

dette(famille(Ressources),mensualite(Capacite),dettePourcent(Effort)) :-
    detteMaximumPourcent(DetteMaxPourcent),
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

#pause

La notation *$Γ ⊢ M : T$*, où $Γ$ est une liste de paires de la forme 
$ x: B$ où $x$ est une variable et $B$ un type, $M$  est un terme et $T$ un type,
se lit « dans le contexte $Γ$, le terme $M$ a pour type $T$.

#pause

#colorbox(
    title:"Représentation d'une règles de typage",
    color:"blue",
)[
#v(5pt)
Une règle de typage est de la forme: *$(Γ_1 ⊢ M_1 : T_1 #h(5pt) dots #h(5pt) Γ_n ⊢ M_n : T_n) / (Γ ⊢ M : T)$*
et doit se comprendre ainsi:  "si $Γ_1 ⊢ M_1 : T_1 #h(5pt) dots #h(5pt) Γ_n ⊢ M_n : T_n$ alors $Γ ⊢ M : T$".
]

#pause

#colorbox(
    title:"Règles pour le λ-calcul simplement i.e. typé λ-→",
    color:"green",
)[
$
() / (Γ_1; x:T;Gamma_2 ⊢ x : T) #h(2em)
(Gamma ⊢ X : T_1 → T_2 #h(1em) Γ ⊢ Y : T_1) / (Γ ⊢ X #h(5pt) Y : T_2) #h(2em)
(Γ,x:T_1 ⊢ Y : T_2) / (Γ ⊢ lambda x.Y : T_1 → T_2) 
$
]
== Système de type pour un $lambda$-calcul simple
  
#pause    
    
#table(
  columns: (50%,50%),
  stroke: none,
    $ () / (Γ_1; x:T;Gamma_2 ⊢ x : T) #pause $,
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
