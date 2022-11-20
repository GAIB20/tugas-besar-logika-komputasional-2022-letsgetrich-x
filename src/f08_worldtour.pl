/* File worldtour.pl */

apparateMechanism :-
    currentPlayer(X),
    write('Choose your apparate destination \n'),
    read(Dest),
    tile(No2, Dest),
    locPlayer(X, Asal),
    tile(No1, Asal),
    Sumloc is No1 + No2,
    addCashGO(Sumloc, X),
    Newloc is (No1 + No2) mod 32,
    retract(locPlayer(X, Asal)),
    asserta(locPlayer(X, Newloc)),
    namePlayer(X, Name),
    write(Name),
    write(' has arrived in '),
    write(Dest).


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
                            write('You don\'t have enough money!'), !

                        ), !
                    )
    ), !.
    