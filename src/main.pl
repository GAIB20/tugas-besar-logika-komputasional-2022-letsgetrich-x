:- include('f10_dice.pl').

:- dynamic(currentPlayer/1).
:- dynamic(playerName/2).
:- dynamic(inJail/2).

/* inJail(ID, state), state : 0 false, 1 true */
inJail(1,0).
inJail(2,0).

/* switch player */
switchPlayer :-
    currentPlayer(X),
    (X == 1),
    retractall(currentPlayer(X)),
    asserta(currentPlayer(2)),
    !.
switchPlayer :-
    currentPlayer(X),
    (X == 2),
    retractall(currentPlayer(X)),
    asserta(currentPlayer(1)),
    !.    

/* manually assign player name */
playerName(1, 'Rachel').
playerName(2, 'Livia').

/* choose start player */
currentPlayer(1).




