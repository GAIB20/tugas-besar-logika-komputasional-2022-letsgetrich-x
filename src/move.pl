

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
                              write(Player),
                              write(' moved '),
                              write(Steps),
                              write(' steps'),nl,
                              write('You are currently in '),
                              write(Currloc), nl,
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

