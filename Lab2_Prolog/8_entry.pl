% Lab 2, Q8: People who are not blacklisted and have an ID card can enter. Ram has
% an ID card. Hari is blacklisted. Write the logic to represent who can enter and
% write query to check whether Ram and Hari can enter.

% People who are not blacklisted and have an ID card can enter
has_id(ram).
blacklisted(hari).

can_enter(X) :- has_id(X), \+ blacklisted(X).

% Queries:
% ?- can_enter(ram).
% ?- can_enter(hari).
