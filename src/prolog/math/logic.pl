:- op(800, xfx, user:(/\)).
:- op(800, xfx, user:(\/)).
:- op(800, xfx, user:(=>)).
:- op(700, fx, user:(-)).

solve(X /\ Y) :- solve(X), solve(Y).
solve(X \/ Y) :- solve(X).
solve(X \/ Y) :- solve(Y).
solve(X => Y) :- solve(- X \/ Y).
solve(- X) :- solve(X), !, fail.
solve(- _).
