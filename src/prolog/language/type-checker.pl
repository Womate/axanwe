/*
 * Cf. https://ncatlab.org/nlab/show/bidirectional+typechecking
 */

:- op(800, xfy, user:(⊢)).
:- op(800, yfx, user:(→)).
:- op(900, xfy, user:(⇒)).
:- op(800, yfx, user:(@)).

in_gamma(X:T, (_,X:T)).
in_gamma(B, (L,_)) :- in_gamma(B,L).

/*
 *  (X : T) in Γ
 *  ----------------
 *  Γ ⊢ X <= T
 */
type_system(Γ ⊢ X : T, proof(gamma(X,T))) :-
    atom(X),
    !,
    in_gamma(X:T, Γ).

/*
 *  Γ ⊢ X : T1 → T2   Γ ⊢ Y : T1
 *  ----------------------------
 *  Γ ⊢ X Y : T2
 */
type_system(Γ ⊢ (X @ Y) : T2, proof(abs,LOG1,LOG2)) :-
    type_system(Γ ⊢ X : (T1 → T2), LOG1),
    type_system(Γ ⊢ Y : T1, LOG2),
    !.

/*
 *  Γ,X:T1 ⊢ T : T2
 *  -------------------
 *  Γ ⊢ X ⇒ T : T1 → T2
 */
type_system(Γ ⊢ (X ⇒ Y) : (T1 → T2), proof(abs, LOG)) :-
    type_system((Γ,X:T1) ⊢ Y : T2, LOG),
    !.

/* Error corner */

type_system(Γ ⊢ X : T, proof(error, Γ, X, T )).

/* Some examples

    :- type_system([] ⊢ (x ⇒ x) : T,L).
    T = (_A→_A),
     = proof(abs, proof(gamma(x, _A))).

    ?- type_system(([],y:int) ⊢ ((x ⇒ x) @ y) : T, L).
    T = int,
    L = proof(abs, proof(abs, proof(gamma(x, int))), proof(gamma(y, int))).

    ?- type_system([] ⊢ (x ⇒ y ⇒ (x @ y)) : (T1 → T2), L).
    T1 = T2, T2 = (_A→_B),
    L = proof(abs, proof(abs, proof(abs, proof(gamma(x, _A→_B)), proof(gamma(y, _A))))).

*/