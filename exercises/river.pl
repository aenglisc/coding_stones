safe([ Bank, _,    Bank, _    ]).
safe([ Bank, Bank, _,    Bank ]).

opposite_bank(south, north).
opposite_bank(north, south).

move(wolf,    [ X, X, G, C], [ Y, Y, G, C ]) :- opposite_bank(X, Y).
move(goat,    [ X, W, X, C], [ Y, W, Y, C ]) :- opposite_bank(X, Y).
move(cabbage, [ X, W, G, X], [ Y, W, G, Y ]) :- opposite_bank(X, Y).
move(farmer,  [ X, W, G, C], [ Y, W, G, C ]) :- opposite_bank(X, Y).

solution(GoalState,    GoalState, [  ]           , _).
solution(CurrentState, GoalState, [ Move | Rest ], Visited) :-
  move(Move, CurrentState, NextState),
  not(member(NextState, Visited)),
  safe(NextState),
  solution(NextState, GoalState, Rest, [ NextState | Visited ]).
