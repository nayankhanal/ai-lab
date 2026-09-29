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

main :-
    forall(member(P, [bob, liz, ann, pat, jim, peter]),
           ( forall(member(R, [father, mother, brother, sister]), show(R, P)), nl )),
    forall(member(P, [jim, ann, peter]),
           ( forall(member(R, [grandparent, grandfather, grandmother]), show(R, P)), nl )).

:- initialization(main, main).
