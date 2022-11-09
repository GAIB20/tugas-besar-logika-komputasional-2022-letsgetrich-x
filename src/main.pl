:- include('f10_dice.pl').

:- dynamic(currentPlayer/1).
:- dynamic(isOneInJail/1).
:- dynamic(isTwoInJail/1).
    
/* first player */  
currentPlayer('Rachel').

/* state awal penjara : 0 false, 1 true */
isOneInJail(0).
isTwoInJail(0).

/* mengganti pemain */
switchPlayer :-
    currentPlayer(X),
    X == 'Rachel',
    retractall(currentPlayer(X)),
    asserta(currentPlayer('Livia')),
    !.
switchPlayer :-
    currentPlayer(X),
    X == 'Livia',
    retractall(currentPlayer(X)),
    asserta(currentPlayer('Rachel')).

/* id pemain */
playerId(X) :- 
    currentPlayer(A),
    A == 'Rachel',
    X is 1,
    !.
playerId(X) :- 
    currentPlayer(A),
    A == 'Livia',
    X is 2,
    !.
