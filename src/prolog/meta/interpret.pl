solve(true) :- !.
solve((A, B)) :- !, solve(A), solve(B).
solve(Goal) :- rule(Goal, Body), solve(Body).

/*
    femme(anne).
    parent(anne, paul).
    parent(anne, magali).

    mere(X,Y) :- femme(X), parent(X,Y).
*/

rule(femme(anne), true).
rule(parent(anne,paul), true).
rule(parent(anne,magali), true).
rule(mere(X,Y),(femme(X), parent(X,Y))).