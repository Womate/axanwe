:- use_module(library(clpr)).

/*
 * This is a computation with constraints
 */

/*
 * Les travaux de rénovation doivent représenter au moins 25 % du coût total de l'opération à financer.
 * (Renovation + Esthetical) / (TotalCost + Esthetical) >= 0.25                      /\ TotalCost > 0
 * <=> Renovation + Esthetical >= 0.25 * (TotalCost + Esthetical)                    /\ TotalCost > 0 /\ Esthetical >= 0
 * <=> Renovation + Esthetical >= 0.25 * TotalCost + 0.25 * Esthetical               /\ TotalCost > 0 /\ Esthetical >= 0
 * <=> Renovation + Esthetical - 0.25 * Esthetical >= 0.25 * TotalCost               /\ TotalCost > 0 /\ Esthetical >= 0
 * <=> Esthetical - 0.25 * Esthetical >= 0.25 * TotalCost - Renovation               /\ TotalCost > 0 /\ Esthetical >= 0
 * <=> 0.75 * Esthetical >= 0.25 * TotalCost - Renovation                            /\ TotalCost > 0 /\ Esthetical >= 0
 * <=> Esthetical >= (0.25 * TotalCost - Renovation) / 0.75                          /\ TotalCost > 0 /\ Esthetical >= 0

ptzEligibility(esthetical(Esthetical),totalCost(TotalCost),renovation(Renovation)) :-
    {TotalCost > 0.0},
    {Esthetical >= 0.0},
    {Esthetical >= (0.25 * TotalCost - Renovation) / 0.75}.

/* Some examples

    :- ptzEligibility(esthetical(25_000),totalCost(Cost),renovation(40_000)).
    {Cost>0.0, Cost=<235000.0}.

    :- ptzEligibility(esthetical(25_000),totalCost(200_000 + X),renovation(40_000)).
    {Cost>0.0, Cost=<235000.0}.

*/