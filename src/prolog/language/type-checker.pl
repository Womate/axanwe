/*
 * Cf. https://ncatlab.org/nlab/show/bidirectional+typechecking
 */

:- op(800, xfx, user:(->)).
:- op(900, xfx, user:(=>)).
:- op(800, xfx, user:(@)).

/*
 *  (X : T) in Gamma
 *  ----------------
 *  Gamma |- X <= T
 */
tc(Gamma, X, T, proof(gamma(X,T))) :-
    nonvar(X),
    member(X:T, Gamma),
    !.

/*
 *  Gamma |- X @ T1 -> T2   Gamma |- Y <= T1
 *  ------------------------------------
 *  Gamma |- X Y => T2
 */
tc(Gamma, X @ Y, T2, proof(abs,LOG1,LOG2)) :-
    tc(Gamma, X, T1 -> T2, LOG1),
    tc(Gamma, Y, T1, LOG2),
    !.

/*
 *  Gamma,X:T1 |- T <= T2
 *  ----------------------
 *  Gamma |- \X.T <= T1 -> T2
 */
tc(Gamma, X => T, T1 -> T2, proof(abs, LOG)) :-
    append([X:T1], Gamma, NGamma),
    tc(NGamma, T, T2, LOG),
    !.

/* Error corner */

tc(Gamma, X, T, proof(error, Gamma, X, T )).

/* Some examples

    :- tc([], x => x,T,L).
    T = (_A->_A),
    L = proof(abs, proof(gamma(x, _A))).

    ?- tc([y:int],(x => x) @ y,T,L).
    T = int,
    L = proof(abs, proof(abs, proof(gamma(x, int))), proof(gamma(y, int))).

*/