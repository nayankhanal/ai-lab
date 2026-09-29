% Lab 2, Q1: Tiger eats meat. Lion eats meat. Deer eats grass. Bear eats grass.
% Bear eats meat. Represent the knowledge in Prolog. Write logic to represent
% carnivorous and omnivorous animal. Also run queries to check either animals are
% carnivorous or omnivorous and find list of carnivorous and omnivorous animals.

% Carnivorous and omnivorous animals
eats(tiger, meat).
eats(lion, meat).
eats(deer, grass).
eats(bear, grass).
eats(bear, meat).

carnivorous(X) :- eats(X, meat), \+ eats(X, grass).
omnivorous(X)  :- eats(X, meat), eats(X, grass).

% Queries:
% ?- carnivorous(tiger).
% ?- carnivorous(lion).
% ?- carnivorous(deer).
% ?- omnivorous(bear).
% ?- carnivorous(bear).
% ?- findall(X, carnivorous(X), L).
% ?- findall(X, omnivorous(X), L).
