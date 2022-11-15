:- include('f01_board.pl').
:- include('f02_location.pl').
:- include('f03_property.pl').
:- include('f04_chance.pl').
:- include('f05_tax.pl').
:- include('f06_jail.pl').
:- include('f07_freeparking.pl').
:- include('f08_worldtour.pl').
:- include('f09_player.pl').
:- include('f10_dice.pl').


:- dynamic(playerName/2).
:- dynamic(menu_status/1).

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

startGame:-
    initPlayer,
    initJail.




