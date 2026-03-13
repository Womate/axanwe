:- op(800, xfy, user:(⊢)).
:- op(800, yfx, user:(→)).
:- op(900, xfy, user:(⇒)).
:- op(800, yfx, user:(@)).

in_gamma(X:T, (_,X:T)).
in_gamma(B, (L,_)) :- in_gamma(B,L).

/*
 *  (X : T) in Γ
 *  ------------
 *  Γ ⊢ X : T
 */
system(Γ ⊢ X : T, proof(gamma(X,T))) :-
    atom(X),
    !,
    in_gamma(X:T, Γ).

/*
 *  Γ ⊢ X : T1 → T2   Γ ⊢ Y : T1
 *  ----------------------------
 *  Γ ⊢ X Y : T2
 */
system(Γ ⊢ (X @ Y) : T2, proof(abs,LOG1,LOG2)) :-
    ground(X @ Y),
    system(Γ ⊢ X : (T1 → T2), LOG1),
    system(Γ ⊢ Y : T1, LOG2),
    acyclic_term(T1 → T2),
    !.

/*
 *  Γ,X:T1 ⊢ Y : T2
 *  -------------------
 *  Γ ⊢ X ⇒ Y : T1 → T2
 */
system(Γ ⊢ (X ⇒ Y) : (T1 → T2), proof(abs, LOG)) :-
    atom(X),
    system((Γ,X:T1) ⊢ Y : T2, LOG),
    acyclic_term(T1 → T2),
    !.

/* Error corner */

system(Γ ⊢ X : T, proof(error, Γ ⊢ X : T)).

/* Some examples

    ?- system([] ⊢ (x ⇒ x) : T,L).
    T = (_A→_A),
    L = proof(abs, proof(gamma(x, _A))).

    ?- system(([],y:int) ⊢ ((x ⇒ x) @ y) : T, L).
    T = int,
    L = proof(abs, proof(abs, proof(gamma(x, int))), proof(gamma(y, int))).

    ?- system(Γ ⊢ ((x ⇒ x) @ y) : T, L).
    Γ = (_, y:T),
    L = proof(abs, proof(abs, proof(gamma(x, T))), proof(gamma(y, T))).

    ?- system([] ⊢ (x ⇒ y ⇒ (x @ y)) : (T1 → T2), L).
    T1 = T2, T2 = (_A→_B),
    L = proof(abs, proof(abs, proof(abs, proof(gamma(x, _A→_B)), proof(gamma(y, _A))))).

    ?- system([] ⊢ (x ⇒ x @ x) : T, L).
    T = (_A→_B),
    L = proof(abs, proof(error, ([], x:_A)⊢(x@x):_B)).

*/