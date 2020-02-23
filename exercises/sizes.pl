  bigger(ant, flea).
  bigger(mouse, ant).
  bigger(cat, mouse).
  bigger(horse, cat).
  bigger(whale, horse).

  bigger_than(A, B) :- bigger(A, B).
  bigger_than(A, B) :- bigger(A, X), bigger_than(X, B).

  much_bigger_than(A, B) :- bigger(A, X), bigger_than(X, B).
