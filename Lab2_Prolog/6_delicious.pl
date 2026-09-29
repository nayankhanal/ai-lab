% Lab 2, Q6: Represent following sentences into Prolog facts: a. The cakes are
% delicious. b. The rice is delicious. c. Biryani is delicious. d. Pickle is
% spicy. e. Meera relishes coffee. f. Ram likes food if they are delicious. g.
% Sita likes food if they are delicious and spicy. Using the above facts and
% production rules, find out the output of following goals: a. Find the list of
% delicious food from the above facts. b. Find out the list of foods that Ram
% likes. c. Find out the list of foods that Sita likes. d. Try out the goal, is
% rice is delicious. e. Find out who relishes coffee.

% Delicious and spicy food
delicious(cakes).
delicious(rice).
delicious(biryani).
spicy(pickle).
relishes(meera, coffee).

likes(ram, F)  :- delicious(F).
likes(sita, F) :- delicious(F), spicy(F).

main :-
    findall(F, delicious(F), D),   format("a. Delicious foods:  ~w~n", [D]),
    findall(F, likes(ram, F), R),  format("b. Ram likes:        ~w~n", [R]),
    findall(F, likes(sita, F), S), format("c. Sita likes:       ~w~n", [S]),
    ( delicious(rice) -> A = yes ; A = no ), format("d. Is rice delicious? ~w~n", [A]),
    findall(P, relishes(P, coffee), C), format("e. Relishes coffee: ~w~n", [C]).

:- initialization(main, main).
