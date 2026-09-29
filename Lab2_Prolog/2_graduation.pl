% Lab 2, Q2: All people who are graduating are happy. Happy people smile. Ram is
% graduating. Represent the knowledge into Prolog and run query to check is Ram
% smiling and is Ram happy.

% Graduating people are happy, happy people smile
graduating(ram).
happy(X) :- graduating(X).
smiles(X) :- happy(X).

% Queries:
% ?- smiles(ram).
% ?- happy(ram).
