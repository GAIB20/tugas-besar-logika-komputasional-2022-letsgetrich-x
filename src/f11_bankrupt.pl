:- include('utility.pl').

/* checkBankrupt */
checkBankrupt(Amount) :-
    bankruptMechanism(Amount);!.

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
    write('Your galleons is not enough...'), nl,
    write('Do you still wanna continue fighting for Harry? [yes/no] : '),
    read(lanjut),
    (
        (
            lanjut == 'yes',
            displayProp(X), nl,
            write('Which property you want to sell? : '),
            read(JualProp),

            /* jual property */
            listPropPlayer(X, ListProp),
            getItemAtIdx(ListProp ,JualProp, PropToSell),
            tingkatan(PropToSell, Type),
            hargaBeli(PropToSell,Type,Price),   
            sell(PropToSell,Type),

            nl, 
            write(PropToSell),
            write(' has been sold'), nl,

            /* recheck */
            NewAmount is Amount - Price,
            checkBankrupt(NewAmount),
            !
        );

        (
            write('What a shame, no fighting spirit bro...'),nl,
            endGame
        )
    ).

/* endGame, retractall */
endGame :-
    retractall(locPlayer(_,_)),
    retractall(cashPlayer(_,_)),
    retractall(propPlayer(_,_)),
    retractall(cardPlayer(_,_)),
    retractall(currentPlayer(_)),
    retractall(playerName(_,_)),
    retractall(in_jail(_)),
    retractall(dice_after_jail(_)),
    retractall(chance_cards(_)),
    write('Thank you for visiting harry\'s house').


/* surrender */
surrender :-
    write('Why so weak? Why? Why you surrender?'),
    endGame.