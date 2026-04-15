#import "@preview/touying:0.6.2": *
#import "@preview/colorful-boxes:1.4.3": *
#import emoji: fire

== Filtrage:  Principe

*Pattern Matching* (ou filtrage de motifs)

$triangle.filled.small.r$  présent dans OCaml, Haskell, Rust ou Java par exemple. #pause

$triangle.filled.small.r$  Capturer des valeurs d'un terme en le faisant passer au _tamis_.

== Filtrage:  Principe

#image("assets/unification/2.svg")

Ici on a un terme *`f(g(a,b),a)`* et on veut le filtrer avec *`f(X,a)`* avec *`X`* une variable. 

== Filtrage:  Principe

#image("assets/unification/3.svg")

Les foncteurs de plus haut niveau correspondent.

== Filtrage:  Principe

#image("assets/unification/4.svg")

Les constantes en seconde position correspondent.

== Filtrage : Principe
 
#image("assets/unification/5.svg")

La substitution *$sigma = { X arrow.r.bar `g(a,b)` }$* permet de rendre le filtre identique au terme.

== Filtrage : Limitations

 
$triangle.filled.small.r$ le filtre ne peut pas avoir de variables répétées e.g. *`f(X,X)`* est interdit. #pause 
 
$triangle.filled.small.r$ Le terme filtré pour sa part ne doit pas contenir de variables il est fermé. #pause

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

Le motif *`Succ(var p)`* permet de capturer le predecesseur en le liant à la variable *`p`*
