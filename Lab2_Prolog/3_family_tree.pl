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

main :-
    findall(M, mother(M, shweta), L1),       format("Mother of Shweta:      ~w~n", [L1]),
    findall(G, grandmother(G, shekhar), L2), format("Grandmother of Shekhar: ~w~n", [L2]),
    findall(P, parent(P, james), L3),        format("Parents of James:      ~w~n", [L3]),
    findall(P, parent(P, anu), L4),          format("Parents of Anu:        ~w~n", [L4]),
    findall(P, parent(P, simon), L5),        format("Parents of Simon:      ~w~n", [L5]).

:- initialization(main, main).
