% vertex(a).
% vertex(b).
% vertex(c).
% vertex(d).
% vertex(e).
% vertex(x).
% vertex(y).
% vertex(z).
% edge(a, d).
% edge(a, x).
% edge(b, d).
% edge(b, y).
% edge(c, d).
% edge(c, z).
% edge(d, e).
% edge(e, x).
% edge(x, z).
% edge(y, z).

% vertex(a).
% vertex(b).
% vertex(c).
% edge(a, b).
% edge(b, c).

% Define the centre/1 predicate and ensure that in any model, exactly one vertex is selected as the center.
1{center(V) : vertex(V)}1.

% leg(Y, X) :- center(Y), edge(X, Y).
% leg(Y, X) :- center(Y), edge(Y, X).

%%%%%%%
% Since the edge is undirected, we make this step to get the "fullEdge":
fullEdge(X, Y) :- edge(X, Y).
fullEdge(X, Y) :- edge(Y, X).
%%%%%%%

% Line to Line shows that how to check whether all the vertexes are reachable throrugh the center.
% Vertex is reacheable if it has an edge between the center:
reachable(V) :-  center(C), leg(C, V), vertex(V).
% Vertex is reachable if it has a edge between another reachable vertex(not a center vertex):
reachable(R) :- reachable(R2), not center(R), leg(R, R2).
% Calcuate the total vertex number(execpt center) in the input graph:
totalVertexNum(N) :- N = #count {C : not center(C), vertex(C)}.
% Count how many vertex is reachable in the spider:
numOfReachable(V) :- V = #count {R : reachable(R), center(C)}.
% total vertex number must match how many vertex is reachable in the spider:
:- totalVertexNum(T), numOfReachable(V), T != V.

% If we want to get a spanning spider, we can find that the number of leg should be the same as (total vertex number - 1):
T{leg(X, Y) : fullEdge(X, Y)}T :- totalVertexNum(T).

% We should know that which vertex has three or three more degrees:
vertexHasThreeOrThreeDegree(V) :- vertex(V), T1 = #count{A: leg(A, V)}, T2 = #count{C : leg(V, C)}, T1+T2 >= 3.

% Then we can know how many vertex has three or three more degrees:
numOfvertexHasThreeOrThreeDegree(N) :- N = #count {V : vertexHasThreeOrThreeDegree(V)}.

% If there's vertex has 3 or 3 more degrees, we choose it to be the center:
1{center(V) : vertexHasThreeOrThreeDegree(V)}1 :- numOfvertexHasThreeOrThreeDegree(N), N > 0.

% To make sure a spider S is a tree with at most one vertex in S whose degree is 3 or more:
:- numOfvertexHasThreeOrThreeDegree(N), N > 1.


% #show spanningSpiderLegLength/3.
#show center/1.
#show leg/2.
%#show longestLegLength/1.
% #show numOfvertexHasThreeOrThreeDegree/1.
% #show numOfReachable/1.
