:- use_module(library(clpr)).

/*
 * This is a computation with constraints
 */

maxDebt(35).

debt(family(NetSalary),monthly(Instalment),debtPercent(Percent)) :-
    maxDebt(MaxDebt),
    {Instalment =< MaxDebt / 100 * NetSalary},
    {Percent = 100 * (Instalment / NetSalary)}.

