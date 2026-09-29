% Lab 2, Q7: Create a Prolog database to represent the following facts: a. Curry
% is tasty b. Fruits are tasty c. Rice is tasty d. Chilies are spicy e. Pickle is
% spicy f. Pickle is tasty g. Manjil likes food if they are tasty h. Swapnil likes
% food if they are spicy and tasty i. Niraj likes food if they are spicy or tasty.
% Using the facts and rules given above, find the output of following goals: a.
% Find if fruits are tasty. b. Find the list of tasty foods. c. Find the list of
% foods that Manjil likes. d. Find the list of foods that Swapnil likes. e. Find
% the list of foods that Niraj likes.

% Tasty and spicy food preferences
tasty(curry). tasty(fruits). tasty(rice). tasty(pickle).
spicy(chilies). spicy(pickle).

likes(manjil, F)  :- tasty(F).
likes(swapnil, F) :- spicy(F), tasty(F).
likes(niraj, F)   :- spicy(F) ; tasty(F).

main :-
    ( tasty(fruits) -> A = yes ; A = no ), format("a. Are fruits tasty? ~w~n", [A]),
    findall(F, tasty(F), T),            format("b. Tasty foods:  ~w~n", [T]),
    findall(F, likes(manjil, F), M),    format("c. Manjil likes: ~w~n", [M]),
    findall(F, likes(swapnil, F), S),   format("d. Swapnil likes: ~w~n", [S]),
    setof(F, likes(niraj, F), N),       format("e. Niraj likes:  ~w~n", [N]).

:- initialization(main, main).
