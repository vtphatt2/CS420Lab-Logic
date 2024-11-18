% Facts
parent(john, mary).
parent(mary, susan).
parent(john, mike).
parent(mike, linda).

% Rules
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% % Queries
% ?- grandparent(john, susan).
% % Expected Output: true.

% ?- sibling(mary, mike).
% % Expected Output: true.