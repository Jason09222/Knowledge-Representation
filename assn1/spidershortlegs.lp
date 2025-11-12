%%%%
% After 3.1, we get all spanning spider models, to get the spanning spider with the shortest longest leg, first we use centerLengthOnePath(X, Y) to represent 
%the vertex which connects directly with the center, and spanningSpiderLegLength(X, Y, 1) means start from the centetr, the current leg is length 1:
centerLengthOnePath(X, Y) :- center(X), leg(X, Y).
centerLengthOnePath(X, Y) :- center(X), leg(Y, X).
% After we get all path with length 1, we plan to expand it, which we used previous spanningSpiderLegLength, and once the vertetx has an edge with previous
% the new spanningSpiderLegLength which record current leg length will be formed:
spanningSpiderLegLength(X, Y, 1) :- centerLengthOnePath(X, Y).
spanningSpiderLegLength(Y, E, Z+1) :- spanningSpiderLegLength(X, Y, Z), E!= X, leg(Y, E), totalVertexNum(N), N > Z.
spanningSpiderLegLength(Y, E, Z+1) :- spanningSpiderLegLength(X, Y, Z), E!= X, leg(E, Y), totalVertexNum(N), N > Z.

% After we get all spanningSpiderLegLength, we choose the maximum one:
longestLegLength(L) :- L = #max{Z : spanningSpiderLegLength(X, Y, Z)}.
% After we get the longestLegLength for each model, we can use #minimize to get the shortest longest leg of the spanning spider.
#minimize{X : longestLegLength(X)}.
%%%%