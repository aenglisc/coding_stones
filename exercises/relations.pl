:- dynamic parents_of/3.

mother_of(C, M) :- parents_of(C, _, M).
father_of(C, F) :- parents_of(C, F, _).

sibling_of(C1, C2) :-
  parents_of(C1, F, M),
  parents_of(C2, F, M),
  C1 \= C2.

parent_of(C, P) :- parents_of(C, P, _).
parent_of(C, P) :- parents_of(C, _, P).

ancestor_of(C, A) :- parent_of(C, A).
ancestor_of(C, A) :- parent_of(C, X), ancestor_of(X, A).

nephew_of(F, N) :- sibling_of(F, X), parent_of(N, X).

grandfather_of(F, G) :-
  parent_of(F, P),
  father_of(P, G).
