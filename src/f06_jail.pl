:- dynamic(in_jail/1).
:- dynamic(dice_after_jail/2).

initJail:-
    asserta(dice_after_jail(1,0)),
    asserta(dice_after_jail(2,0)).

jailMechanism:-
    currentPlayer(X),
    dice_after_jail(X, 0),
    playerDouble(X,3),
    asserta(in_jail(X)),
    retractall(playerDouble(X,_)),
    asserta(playerDouble(X,0)),
    write('Ooops! What a bad muggle you have been. You are now jailed in Azkaban!\n'),
    retractall(locPlayer(X,_)),
    asserta(locPlayer(X, 8)),
    checkLocationDetail(jl),
    !.

jailMechanism:-
    currentPlayer(X),
    in_jail(X),
    dice_after_jail(X,Y),
    Y>=0,
    Y<3,
    playerDouble(X,Z),
    (
        (Y = 3; Z = 1) -> escapeJail,!;
        Y >= 0 ->  incDiceAfterJail,
                  write('You\'re still in Azkaban :(\n'),
                  write('Do you want to escape now?\n'),
                  write('0. No, i can hold out the Dementors..\n'),
                  write('1. Pay 1000\n'),
                  write('2. Use Escape Azkaban Card\n'),
                  !
    ),
    !.

jailMechanism:-
    currentPlayer(X),
    in_jail(X),
    dice_after_jail(X, 3),
    escapeJail,
    !.

jailMechanism:-
    !.

incDiceAfterJail:-
    currentPlayer(X),
    dice_after_jail(X,Z),
    Z<3,
    retractall(dice_after_jail(X,Z)),
    Z1 is Z+1,
    asserta(dice_after_jail(X,Z1)),
    !.

visitJail:-
    write('You\'ve arrived in Azkaban.. Normally, people lose their sanity here. I certainly hope you don\'t, \n').

escapeJail:-
    write('Congratulations! You survived your time in Azkaban. You can move now!\n'),
    currentPlayer(X),
    retractall(in_jail(X)),
    retractall(playerDouble(X,_)),
    asserta(playerDouble(X,0)).

testJail:-
    retractall(playerDouble(1,_)),
    asserta(playerDouble(1, 3)),
    jailMechanism.
