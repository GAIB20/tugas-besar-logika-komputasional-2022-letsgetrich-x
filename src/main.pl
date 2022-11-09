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

startGame :-
    /* Start Game */
    write('Welcome to Let\'s Get Rich'), nl,
    write('Enter player 1 name : '),
    read(Player1),
    write('Enter player 2 name : '),
    read(Player2),

    /* Assigning player name to ID */
    
    playerName(1, Player1),
    playerName(2, Player2),
    
    random(1,3,StartPlayer),
    currentPlayer(StartPlayer).

    /* Random player that starts first */

 
