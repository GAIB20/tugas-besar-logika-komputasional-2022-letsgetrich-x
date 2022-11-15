:- include('f09_player.pl').
:- include('f10_dice.pl').
:- dynamic(in_jail/2).
:- dynamic(dice_after_jail/2).

move(Player, Steps) :-
    in_jail(Player, 0),
    locPlayer(P, Loc), P=:=Player,
    Loc1 is (Loc+Steps) mod 32,
    retract(locPlayer(P, Loc)),
    asserta(locPlayer(P, Loc1)), !.

