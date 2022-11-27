

move(Player, Steps) :-
    jailMechanism,
    (
        \+ in_jail(Player) -> 
                              locPlayer(P, Loc), P=:=Player,
                              Loc1 is (Loc+Steps) mod 32,
                              Sumsteps is Loc+Steps,
                              addCashGO(Sumsteps, P),
                              retract(locPlayer(P, Loc)),
                              asserta(locPlayer(P, Loc1)), 
                              tile(Loc1, Currloc),
                              playerName(Player,PlayerName),
                              write(PlayerName),
                              write(' moved '),
                              write(Steps),
                              write(' steps'),nl,
                              write('*** You have arrived at '),
                              write(Currloc),
                              write('***'),nl,
                              (
                                Currloc = fp -> parkirGratisMechanism;
                                Currloc = jl -> visitJail;
                                Currloc = wt -> worldTourMechanism;
                                Currloc = cc -> drawChanceCard;
                                Currloc = cf -> playCoinFlip;
                                Currloc = tx -> payTax(Player);
                                Currloc = go -> buildGoMechanism;
                                is_property(CurrLoc) -> propertyMechanism, !; !
                              ),!;
        in_jail(Player) -> !
    ),
    !.

