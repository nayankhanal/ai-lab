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

% Queries:
% ?- tasty(fruits).
% ?- findall(F, tasty(F), L).
% ?- findall(F, likes(manjil, F), L).
% ?- findall(F, likes(swapnil, F), L).
% ?- setof(F, likes(niraj, F), L).
