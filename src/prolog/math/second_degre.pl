:- use_module(library(clpr)).

resolution(A*x^2 + B*x + C, [S1, S2]) :-
    { Delta = B^2 - 4*A*C, Delta > 0 },
    S1 = (-B - sqrt(Delta))/(2*A),
    S2 = (-B + sqrt(Delta))/(2*A).

resolution(A*x^2 + B*x + C, [S]) :-
    { Delta = B^2 - 4*A*C, Delta = 0 },
    S = -B/(2*A).

resolution(A*x^2 + B*x + C, []) :-
    { Delta = B^2 - 4*A*C, Delta < 0 }.