#import "@preview/touying:0.6.2": *
#import "@preview/colorful-boxes:1.4.3": *

== Cas des contraintes

#table(
  columns: (auto, auto),
  inset: 10pt,
  align: (right,left),
  stroke: none,
  image("assets/extensions/CLP.png", height:60%),
  [
    La  programmation par contraintes est

    $triangle.filled.small.r$ un extension de la SLD-résolution classique et
      
    $triangle.filled.small.r$ intègre un solveur de contraintes.
    
    On parle de CLP(X) ou X représente le domaine de contraintes (réels, booléens, etc.) 
  ]
)

== Résolution d'equations du second degré 

#stickybox(
         tape: false,
)[
```prolog
:- use_module(library(clpr)).

resolutions(A*x^2 + B*x + C, [S1, S2]) :-
    { Delta = B^2 - 4*A*C, Delta > 0 },
    S1 = (-B - sqrt(Delta))/(2*A),
    S2 = (-B + sqrt(Delta))/(2*A). 
    
resolutions(A*x^2 + B*x + C, [S]) :-
    { Delta = B^2 - 4*A*C, Delta = 0 },
    S = -B/(2*A).     

resolutions(A*x^2 + B*x + C, []) :-
    { Delta = B^2 - 4*A*C, Delta < 0 }.     
```
]

== Résolution d'equations du second degré 

#stickybox(
         tape: false,
)[
```prolog
?- resolutions(A*x^2 + 3*x + 3, S).
```
]

#pause *Solution 1:*
```prolog
S = [(- 3-sqrt(_A))/(2*A), (- 3+sqrt(_A))/(2*A)],
{A<0.75, _A=9.0-12.0*A} 
```

#pause *Solution 2:*
```prolog
A = 0.75,g
S = [- 3/(2*0.75)] 
```

#pause *Solution 3:*
```prolog
S = [],
{A>0.75, _=9.0-12.0*A}.
```




