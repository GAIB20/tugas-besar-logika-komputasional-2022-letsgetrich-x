:- include('f02_location.pl').
:- include('f07_freeparking.pl').
:- include('f09_player.pl').

move(Player, Steps) :-
    jailMechanism,
    (
        \+ in_jail(Player) -> 
                              locPlayer(P, Loc), P=:=Player,
                              Loc1 is (Loc+Steps) mod 32,
                              retract(locPlayer(P, Loc)),
                              asserta(locPlayer(P, Loc1)), 
                              tile(Loc1, Currloc),
                              write(Player),
                              write(' moved '),
                              write(Steps),
                              write(' steps'),nl,
                              write(Currloc), nl,
                              (
                                Currloc =  fp -> parkirGratisMechanism;
                                Currloc = jl -> visitJail;
                                is_property(currLoc) -> propertyMechanism, !;
                                !
                              ),!;
        in_jail(Player) -> !
    ),
    !.

