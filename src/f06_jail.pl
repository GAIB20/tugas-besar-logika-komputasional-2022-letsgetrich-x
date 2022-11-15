:- include('f09_player.pl').
:- dynamic(in_jail/2).
:- dynamic(dice_after_jail/2).

/* inJail(ID, state), state : 0 false, 1 true */
initJail:-
    asserta(in_jail(1,0)),
    asserta(in_jail(2,0)),
    asserta(dice_after_jail(1,0)),
    asserta(dice_after_jail(2,0)).

jailMechanism:-
    currentPlayer(X),
    dice_after_jail(X, 0),
    playerDouble(3),
    retractall(in_jail(X,Y)),
    asserta(in_jail(X,1)),
    write('Ooops, Anda masuk ke Azkaban!\n'),
    checkLocationDetail(jl),
    incDiceAfterJail,
    !.

jailMechanism:-
    currentPlayer(X),
    dice_after_jail(X,Y),
    in_jail(X,1),
    Y<3,
    playerDouble(X,Z),
    (
        Z = 0 ->  incDiceAfterJail,
                  write('Anda masih berada dalam Azkaban :(\n'),
                  !;
        Z > 0 -> escapeJail,!
        /* nunggu chance card */
    ),
    !.

jailMechanism:-
    currentPlayer(X),
    in_jail(X,1),
    dice_after_jail(X, 3),
    escapeJail,
    !.

incDiceAfterJail:-
    currentPlayer(X),
    dice_after_jail(X,Z),
    Z<3,
    retractall(dice_after_jail(X,Z)),
    Z1 is Z+1,
    asserta(dice_after_jail(X,Z1)),
    !.

escapeJail:-
    write('Anda telah dilepaskan dari Azkaban. Silahkan melempar dadu!\n'),
    currentPlayer(X),
    retractall(in_jail(X, Y)),
    asserta(in_jail(X,0)).
