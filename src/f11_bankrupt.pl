:- include('utility.pl').

/* bankruptMechanism */
bankruptMechanism(Amount) :-
    /* If cash >= yang harus dibayarkan, pass */
    currentPlayer(X),
    cashPlayer(X,Cash),
    (Cash >= Amount),
    !,fail.

bankruptMechanism(Amount) :-
    /* If harta X < yang harus dibayarkan, X kalah  */
    currentPlayer(X),
    totalAssets(X,Assets),
    (Assets < Amount),
    write('Sorry, your total assets cannot cover your sin...'), nl,
    endGame,
    !.

bankruptMechanism(Amount) :-
    currentPlayer(X),
    write('Your galleons is not enough...\n'), 
    write('Do you still wanna continue fighting for a position in Hogwarts?\n'),
    write('0. No\n'),
    write('1. Yes\n'),
    write('Choice : '),
    read(Lanjut),
    (
        Lanjut == 1 -> (
            listPropPlayer(X,ListProp),
            write('\nList of your property: \n'),
            displayProp(ListProp,1), nl,
            write('Which property you want to sell? : '),
            read(JualProp),

            /* jual property */
            listPropPlayer(X, ListProp),
            getItemAtIdx(ListProp ,JualProp, PropToSell),
            tingkatan(PropToSell, Type),
            hargaBeli(PropToSell,Type,Price),   
            sell(PropToSell),

            nl, 
            nama_lokasi(PropToSell, NamaProp),
            write(NamaProp),
            write(' has been sold'), nl,

            /* recheck */
            bankruptMechanism(Amount)
        );
        (
            write('You don\'t have enough assets to continue playing...'),nl,
            endGame
        )
    ).

/* endGame, retractall */
endGame :-
    currentPlayer(X),
    (
        X = 1 -> playerName(2, Winner);
        playerName(1, Winner)
    ),
    nl,nl,nl,
    write(Winner),
    write(' HAS WON THE GAME!'),nl,nl,nl,
    write('***    You\'re a Wizard, '),
    write(Winner),
    write('    ***'),nl,
    write('   /\\                                                        /\\'),nl,
    write('(  |  |                                                      |  )|'),nl,
    write(' /----\\                  Welcome to Hogwarts!             /----\\'),nl,
    write('[______]               We Hope You Have A Great Time      [______]'),nl,
    write(' |    |         _____                        _____         |    |'),nl,
    write(' |[]  |        [     ]                      [     ]        |  []|'),nl,
    write(' |    |       [_______][ ][ ][ ][][ ][ ][ ][_______]       |    |'),nl,
    write(' |    [ ][ ][ ]|     |  ,----------------,  |     |[ ][ ][ ]    |'),nl,
    write(' |             |     |/\'    ____..____    \'\\|     |             |'),nl,
    write('  \\  []        |     |    /\'    ||    \'\\    |     |        []  /'),nl,
    write('   |      []   |     |   |o     ||     o|   |     |  []       |'),nl,
    write('   |           |  _  |   |     _||_     |   |  _  |           |'),nl,
    write('   |   []      | (_) |   |    (_||_)    |   | (_) |       []  |'),nl,
    write('   |           |     |   |     (||)     |   |     |           |'),nl,
    write('   |           |     |   |      ||      |   |     |           |'),nl,
    write(' /\'\'           |     |   |o     ||     o|   |     |           \'\'\\'),nl,
    write('[_____________[_______]--\'------\'\'------\'--[_______]_____________]'),nl,
    retractall(locPlayer(_,_)),
    retractall(cashPlayer(_,_)),
    retractall(propPlayer(_,_)),
    retractall(cardPlayer(_,_)),
    retractall(currentPlayer(_)),
    retractall(playerName(_,_)),
    retractall(in_jail(_)),
    retractall(dice_after_jail(_)),
    retractall(chance_cards(_)).

/* surrender */
surrender :-
    write('I guess you were never worthy of being a wizard after all..'),nl,
    endGame.