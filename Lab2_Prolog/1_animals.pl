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

main :-
    ( carnivorous(tiger) -> R1 = yes ; R1 = no ), format("Is tiger carnivorous? ~w~n", [R1]),
    ( omnivorous(bear)   -> R2 = yes ; R2 = no ), format("Is bear omnivorous?   ~w~n", [R2]),
    ( carnivorous(deer)  -> R3 = yes ; R3 = no ), format("Is deer carnivorous?  ~w~n", [R3]),
    findall(X, carnivorous(X), C), format("Carnivorous animals: ~w~n", [C]),
    findall(X, omnivorous(X), O),  format("Omnivorous animals:  ~w~n", [O]).

:- initialization(main, main).
