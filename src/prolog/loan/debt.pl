/*
 * This is a computation with constraints
 */

:- use_module(library(clpr)).

maxDebt(35).

debt(family(NetSalary),monthly(Instalment),debtPercent(Percent)) :-
    maxDebt(MaxDebt),
    {Instalment =< MaxDebt / 100 * NetSalary},
    {Percent = 100 * (Instalment / NetSalary)}.

/* Some examples

    :- debt(family(4_500),monthly(1_500),debtPercent(P)).
    P = 33.333333333333336.

    :- debt(family(4_500),monthly(2_000-X),debtPercent(35)).
    X = 425.0000000000002.

*/