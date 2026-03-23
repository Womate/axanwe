#import "@preview/touying:0.6.2": *
#import "@preview/colorful-boxes:1.4.3": *

== Filtrage:  Principe

Vous avez peut-être déjà entendu parler de *pattern matching* (ou filtrage de motifs), surtout si vous avez fréquenté
des langages comme O'Caml, Haskell, Rust ou Java par exemple. L'idée c'est qu'on puisse capturer des valeurs d'un terme en le
faisant passer au _tamis_ d'un autre terme à trous. Par exemple :

#image("assets/unification/2.svg")

Ici on a un terme $f(g(a,b),a)$ et on veut le faire passer au tamis de $f(X,a)$

#image("assets/unification/3.svg")

Les foncteurs de plus haut niveau correspondent: OK.

#image("assets/unification/4.svg")

Les constantes en seconde position correspondent: OK.

#image("assets/unification/5.svg")

En première position du terme à filtrer on à un sous terme $g(a,b)$ et côté filtre on a une variable. OK. Donc avec la
substitution $sigma = { X arrow.r.bar g(a, b) }$ permet de rendre le filtre identique au terme à filtrer. On capture
$g(a, b)$ dans $$X. Et en avant.

Le filtrage impose quelque limitations (pour des raisons théoriques ? D'implémentation efficace ?) : le filtre ne peut
pas avoir de variables répétées. Autrement dit $f(X,X)$ est interdit. Le terme filtré pour sa part ne doit pas contenir
de variables.

=== Filtrage: Et en Java ?

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

*Le filtrage de* `Just<A>(var value)` *permet de capturer un fragment lié à* `value`
