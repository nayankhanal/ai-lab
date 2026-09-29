% Lab 2, Q5: Represent the following sentences into Prolog facts. Lily is a
% flower. Mango is a fruit. Lotus is a flower. Daisy is a flower. Banana is a
% fruit. Watermelon is a fruit. Ram likes mango. Ram likes lotus. Sita likes
% watermelon. Ram likes lily. Sita likes mango. Hari likes fruit. Using above
% facts find out the output: Find the list of flowers from the above facts. Find
% the list of the fruits from above facts. What does Ram like? What does Sita
% like? List the fruits Hari likes.

% Flowers, fruits and likes
flower(lily). flower(lotus). flower(daisy).
fruit(mango). fruit(banana). fruit(watermelon).

likes(ram, mango). likes(ram, lotus). likes(ram, lily).
likes(sita, watermelon). likes(sita, mango).
likes(hari, X) :- fruit(X).

main :-
    findall(X, flower(X), F),      format("Flowers:          ~w~n", [F]),
    findall(X, fruit(X), Fr),      format("Fruits:           ~w~n", [Fr]),
    findall(X, likes(ram, X), R),  format("Ram likes:        ~w~n", [R]),
    findall(X, likes(sita, X), S), format("Sita likes:       ~w~n", [S]),
    findall(X, likes(hari, X), H), format("Fruits Hari likes: ~w~n", [H]).

:- initialization(main, main).
