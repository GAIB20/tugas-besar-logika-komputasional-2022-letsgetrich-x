:- include('f10_dice.pl').
:- include('f09_player.pl').
:- dynamic(in_jail/1).
:- dynamic(dice_after_jail/2).

/* inJail(ID, state), state : 0 false, 1 true */
initJail:-
    asserta(dice_after_jail(1,0)),
    asserta(dice_after_jail(2,0)).

jailMechanism:-
    currentPlayer(X),
    dice_after_jail(X, 0),
    playerDouble(X,3),
    asserta(in_jail(X)),
    write('Ooops! What a bad muggle you have been. Welcome to Azkaban!\n'),
    checkLocationDetail(jl),
    incDiceAfterJail,
    !.

jailMechanism:-
    currentPlayer(X),
    dice_after_jail(X,Y),
    in_jail(X),
    Y<3,
    playerDouble(X,Z),
    (
        Z = 0 ->  incDiceAfterJail,
                  write('You\'re still in Azkaban :(\n'),
                  !;
        Z > 0 -> escapeJail,!
    ),
    !.

jailMechanism:-
    currentPlayer(X),
    in_jail(X),
    dice_after_jail(X, 3),
    escapeJail,
    !.

jailMechanism:-
    write('hafhaskfskafjiasj').

incDiceAfterJail:-
    currentPlayer(X),
    dice_after_jail(X,Z),
    Z<3,
    retractall(dice_after_jail(X,Z)),
    Z1 is Z+1,
    asserta(dice_after_jail(X,Z1)),
    !.

visitJail:-
    write('You\'ve arrived in Azkaban.. Normally, people lose their sanity here. I certainly hope you don\'nt, \n').

escapeJail:-
    write('Congratulations! You survived your time in Azkaban. You can throw dice now!\n'),
    currentPlayer(X),
    retractall(in_jail(X)).
