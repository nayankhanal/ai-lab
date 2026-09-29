% Lab 2, Q4: Pat, Liz, Pam, Ann are female. Jim, Bob, Tom, Peter are male. Pam is
% parent of Bob. Tom is parent of Bob. Tom is parent of Liz. Bob is parent of Ann.
% Bob is parent of Pat. Pat is parent of Jim. Bob is parent of Peter. Peter is
% parent of Jim. Represent the above knowledge in Prolog and write program to
% represent out father, mother, grandfather, grandmother, grandparent, brother and
% sister. Run queries to find brother, sister, father, mother, of Bob, Liz, Ann,
% Pat, Jim and Peter. Find the grandparents, grandfather, grandmother of Jim, Ann
% and Peter.

% Family relations: father, mother, grandparents, brother, sister
female(pat). female(liz). female(pam). female(ann).
male(jim). male(bob). male(tom). male(peter).

parent(pam, bob). parent(tom, bob). parent(tom, liz).
parent(bob, ann). parent(bob, pat). parent(pat, jim).
parent(bob, peter). parent(peter, jim).

father(F, C)      :- parent(F, C), male(F).
mother(M, C)      :- parent(M, C), female(M).
grandparent(G, C) :- parent(G, P), parent(P, C).
grandfather(G, C) :- grandparent(G, C), male(G).
grandmother(G, C) :- grandparent(G, C), female(G).
sibling(X, Y)     :- parent(P, X), parent(P, Y), X \== Y.
brother(B, X)     :- sibling(B, X), male(B).
sister(S, X)      :- sibling(S, X), female(S).

show(Rel, Person) :-
    Goal =.. [Rel, X, Person],
    findall(X, Goal, L0), sort(L0, L),
    format("~w of ~w: ~w~n", [Rel, Person, L]).

% Queries:
% ?- findall(X, brother(X, bob), L).
% ?- findall(X, sister(X, bob), L).
% ?- findall(X, father(X, bob), L).
% ?- findall(X, mother(X, bob), L).
% ?- findall(X, brother(X, liz), L).
% ?- findall(X, sister(X, liz), L).
% ?- findall(X, father(X, liz), L).
% ?- findall(X, mother(X, liz), L).
% ?- findall(X, brother(X, ann), L).
% ?- findall(X, sister(X, ann), L).
% ?- findall(X, father(X, ann), L).
% ?- findall(X, mother(X, ann), L).
% ?- findall(X, brother(X, pat), L).
% ?- findall(X, sister(X, pat), L).
% ?- findall(X, father(X, pat), L).
% ?- findall(X, mother(X, pat), L).
% ?- findall(X, brother(X, jim), L).
% ?- findall(X, sister(X, jim), L).
% ?- findall(X, father(X, jim), L).
% ?- findall(X, mother(X, jim), L).
% ?- findall(X, brother(X, peter), L).
% ?- findall(X, sister(X, peter), L).
% ?- findall(X, father(X, peter), L).
% ?- findall(X, mother(X, peter), L).
% ?- setof(X, grandparent(X, jim), L).
% ?- setof(X, grandfather(X, jim), L).
% ?- setof(X, grandmother(X, jim), L).
% ?- setof(X, grandparent(X, ann), L).
% ?- setof(X, grandfather(X, ann), L).
% ?- setof(X, grandmother(X, ann), L).
% ?- setof(X, grandparent(X, peter), L).
% ?- setof(X, grandfather(X, peter), L).
% ?- setof(X, grandmother(X, peter), L).
