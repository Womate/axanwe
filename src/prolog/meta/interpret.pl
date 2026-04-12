solve(true) :- !.
solve((A, B)) :- !, solve(A), solve(B).
solve(Goal) :- clause(Goal, Body), solve(Body).

/*
    femme(anne).
    parent(anne, paul).
    parent(anne, magali).

    mere(X,Y) :- femme(X), parent(X,Y).
*/

clause(femme(anne), true).
clause(parent(anne,paul), true).
clause(parent(anne,magali), true).
clause(mere(X,Y),(femme(X), parent(X,Y))).