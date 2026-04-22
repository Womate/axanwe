#import "@preview/touying:0.7.2": *
#import "@preview/colorful-boxes:1.4.3": *
#import emoji: fire

== Filtrage

*Filtrage de Motifs* (ou Pattern Matching)

#pause $triangle.filled.small.r$  Présent dans OCaml, Haskell, Rust ou Java par exemple. 

#pause $triangle.filled.small.r$  Capturer des valeurs d'un terme en utilisant un *motif*.

== Filtrage : Principe

#image("assets/unification/2.svg")

#pause Ici on a un terme *`f(g(a,b),a)`* et on veut le filtrer avec *`f(X,a)`* ou *`X`* est une variable. 

== Filtrage : Principe

#image("assets/unification/3.svg")

Les foncteurs de plus haut niveau correspondent.

== Filtrage : Principe

#image("assets/unification/4.svg")

Les constantes en seconde position correspondent.

== Filtrage : Principe
 
#image("assets/unification/5.svg")

#pause Associe la variable *X*  au terme *g(a,b)* afin de rendre le filtre identique au terme.

== Filtrage : Et en Java ?

#pause #stickybox(
         tape: false,
)[    
```Java
sealed interface Nat {
    record Zero() implements Nat {}
    record Succ(Nat value) implements Nat {}
    
    default Nat add(Nat n) {
        return switch (this) {                       
            case Zero() -> n;  
            case Succ(var p) -> new Succ(p.add(n));
        };
    }
}    
```
]

#pause

Le motif *`Succ(var p)`* permet de capturer le prédécesseur en le liant à la variable *`p`*

== Filtrage : Limitations

#pause $triangle.filled.small.r$ Le motif peut contenir des variables non répétées, p.ex. *`f(X,X)`* est interdit. 

#pause $triangle.filled.small.r$ Le terme filtré ne doit pas contenir de variables: il est dit fermé. 

