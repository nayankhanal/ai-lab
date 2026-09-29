% Lab 2, Q3: Create a knowledge base for the following family tree. Bikash, Roman,
% Mani and James are male. Ramila, Shila, Anu and Shweta are female. Bikash and
% Ramila are parents of Anu and Shweta. Roman and Shila are parents of James. Mani
% and Anu are the parents of Simon. James and Shweta are the parents of Shekhar.
% And run the queries to find the mother of Shweta, the grandmother of Shekhar and
% parents of James, Anu and Simon.

% Family tree knowledge base
male(bikash). male(roman). male(mani). male(james).
female(ramila). female(shila). female(anu). female(shweta).

parent(bikash, anu).   parent(ramila, anu).
parent(bikash, shweta). parent(ramila, shweta).
parent(roman, james).  parent(shila, james).
parent(mani, simon).   parent(anu, simon).
parent(james, shekhar). parent(shweta, shekhar).

mother(M, C)      :- parent(M, C), female(M).
grandmother(G, C) :- parent(G, P), parent(P, C), female(G).

% Queries:
% ?- findall(M, mother(M, shweta), L).
% ?- findall(G, grandmother(G, shekhar), L).
% ?- findall(P, parent(P, james), L).
% ?- findall(P, parent(P, anu), L).
% ?- findall(P, parent(P, simon), L).
