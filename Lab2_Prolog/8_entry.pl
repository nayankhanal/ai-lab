% Lab 2, Q8: People who are not blacklisted and have an ID card can enter. Ram has
% an ID card. Hari is blacklisted. Write the logic to represent who can enter and
% write query to check whether Ram and Hari can enter.

% People who are not blacklisted and have an ID card can enter
has_id(ram).
blacklisted(hari).

can_enter(X) :- has_id(X), \+ blacklisted(X).

main :-
    ( can_enter(ram)  -> R = yes ; R = no ), format("Can Ram enter?  ~w~n", [R]),
    ( can_enter(hari) -> H = yes ; H = no ), format("Can Hari enter? ~w~n", [H]).

:- initialization(main, main).
