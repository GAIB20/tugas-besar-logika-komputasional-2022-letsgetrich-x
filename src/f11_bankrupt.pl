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
    totalAssets(Assets),
    (Assets < Amount),
    write('Dah bokek kau, bai'), nl,
    endGame,
    !,fail.

bankruptMechanism(Amount) :-
    currentPlayer(X),
    write('Gada duit kau bang'), nl,
    write('Lanjut gak? [ya/tidak] : '),
    read(lanjut),
    (
        (
            lanjut == 'ya',
            displayProp(X), nl,
            write('Properti mana yang mau dijual? : '),
            read(JualProp),

            /* jual property */
            listPropPlayer(Player, ListProp),
            getItemAtIdx(ListProp ,JualProp, PropToSell),
            
            hargaBeli(PropToSell,Type,Price),   
            sell(PropToSell,Type),

            nl, 
            write('Property '),
            write(PropToSell),
            write(' berhasil dijual'), nl,

            /* recheck */
            NewAmount is Amount - Price,
            checkBankrupt(NewAmount),
            !
        );

        (
            write('memang dasar ga punya spirit berjuang, bye dek'),nl,
            endGame
        )
    ).
    



/* endGame, retractall */
endGame :-
    retractall(locPlayer(_,_)).
    retractall(cashPlayer(_,_)).
    retractall(propPlayer(_,_)).
    retractall(cardPlayer(_,_)).
    retractall(currentPlayer(_)).
    retractall(playerName(_,_)).
    retractall(in_jail(_)),
    retractall(dice_after_jail(_)),
    retractall(chance_cards(_)),
    write('BaiBaii Muggle').


/* surrender */
surrender :-
    write('Tombol surrender ada di pengaturan'),
    endGame.