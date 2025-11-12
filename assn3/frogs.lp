%size(5).
%obstacle(5, 1). 
%obstacle(1, 2). 
%obstacle(3, 2). 
%obstacle(4, 2).
%obstacle(5, 3). 
%start(2, 4). 


location(1..S, 1..S) :- size(S).
validLocation(X, Y) :- location(X, Y), not obstacle(X, Y), not start(X, Y).

% Count how many jumps we need
jumpStep(1..C) :- countValidPosition(C).
countValidPosition(C) :- C = #count{1, X, Y : validLocation(X, Y)}.

% generator
1{ jump(C, X, Y) : validLocation(X, Y) }1 :- jumpStep(C).


% Each valid position should only be visted once
:- jump(C1, X, Y), jump(C2, X, Y), C1 != C2.

% Next jump should have the same X or Y with the previous jump
:- jump(C, X, Y), jump(C+1, Q, W), X != Q, Y!= W.


#show jump/3.