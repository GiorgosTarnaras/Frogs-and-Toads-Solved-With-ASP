#include <incmode>.

#program base.


frog(1..6).
holds(F, 0) :- init(F).
#program step(t).

{move(frog(X), Y, Z, t): holds(on(frog(X), Y), t-1), holds(on(none, Z), t-1)} = 1.

:- move(frog(X), Y, Z, t), Z-Y>2.
:- move(frog(X), Y, Z, t), Y-Z>2.
:- move(frog(X), Y, Z, t), X<=3, Z<Y.
:- move(frog(X), Y, Z, t), X>3, Z>Y.
    
moved(X, t) :- move(X, Y, Z, t).
holds(on(X,Z), t):- move(X,Y,Z, t).
holds(on(none, Y), t) :- move(X, Y, Z, t).
holds(on(X,Z), t) :- holds(on(X,Z), t-1), not moved(X, t), X != none.
    

#program check(t).
:- query(t), goal(F), not holds(F,t).

#show moved/2.

#program base.


init(on(frog(1), 1)).
init(on(frog(2), 2)).
init(on(frog(3), 3)).
init(on(none, 4)).
init(on(frog(4), 5)).
init(on(frog(5), 6)).
init(on(frog(6), 7)).

goal(on(frog(4), 1)).
goal(on(frog(5), 2)).
goal(on(frog(6), 3)).
goal(on(none, 4)).
goal(on(frog(1), 5)).
goal(on(frog(2), 6)).
goal(on(frog(3), 7)).