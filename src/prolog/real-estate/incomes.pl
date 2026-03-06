:- use_module(library(clpr)).

/*
 * This is a typical database like operation with some constraints
 */

/* Cf. https://www.service-public.gouv.fr/particuliers/vosdroits/F34966/1?idFicheParent=F10871 */

ptzIncomesRow(1, 31_500, 28_500).
ptzIncomesRow(2, 47_250, 42_750).
ptzIncomesRow(3, 56_700, 51_300).
ptzIncomesRow(4, 66_150, 59_850).
ptzIncomesRow(5, 75_600, 68_400).
ptzIncomesRow(6, 85_050, 76_950).
ptzIncomesRow(7, 94_500, 85_500).
ptzIncomesRow(Members, 103_950, 94_050) :- {Members > 7}.

ptzIncomes(family(members(M), incomes(Incomes)), zoneB2) :-
    ptzIncomesRow(M, MaxIncomes, _),
    {Incomes =< MaxIncomes}.

ptzIncomes(family(members(Members), incomes(Incomes)), zoneC) :-
    ptzIncomesRow(Members, _, MaxIncomes),
    {Incomes =< MaxIncomes}.

/* Some examples

    :- ptzIncomes(family(members(4), incomes(90_000-Y)), zoneC).
    {Y>=30150.0}

*/