/* File worldtour.pl */

apparateMechanism :-
    currentPlayer(X),
    write('Choose your apparate destination \n'),
    read(Dest),
    (
        Dest \= wt -> (tile(NoDest, Dest),
                    (
                        NoDest < 24 -> incCash(3000, X);
                        !
                    ),
                    retract(locPlayer(X, _)),
                    asserta(locPlayer(X, NoDest)),
                    playerName(X, Name),
                    write(Name),
                    write(' has arrived in '),
                    nama_lokasi(Dest, LocName),
                    write(LocName),
                    (
                        Dest = fp -> parkirGratisMechanism;
                        Dest = jl -> visitJail;
                        Dest = wt -> worldTourMechanism;
                        Dest = cc -> drawChanceCard;
                        Dest = cf -> playCoinFlip;
                        Dest = tx -> payTax(X);
                        Dest = go -> buildGoMechanism;
                        is_property(Dest) -> propertyMechanism, !; 
                        !
                    )
                    );
        write('Apparate to your current location seems like a waste of money right?\n'), apparateMechanism,!
    ), !.


worldTourMechanism :-
    currentPlayer(X),
    write('You got a chance to apparate to anywhere you want \n'),
    write('Do you want to use this chance? \n'),
    write('0. No, maybe next time \n'),
    write('1. Yes, I will pay 500 to try this spell \n'),
    read(Choice),
    (
        Choice == 0 -> write('You\'re going to regret this ... \n');
        Choice == 1 -> (cashPlayer(X, Cash),
                        (
                            Cash >= 500 -> decCash(500, X),
                                            apparateMechanism, !;
                            write('You don\'t have enough money!'),!,fail

                        ), !
                    )
    ), !.
    