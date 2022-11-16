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
    !.

bankruptMechanism(Amount) :-
    currentPlayer(X),
    write('Gada duit kau bang'), nl,
    write('Lanjut gak? '),
    read(lanjut),
    (
        (
            lanjut == 'ya',
            displayProp(X),
            write('Properti mana yang mau dijual?'),
            read(JualProp),

            /* jual property */
            write('Property berhasil dijual'), nl,
            deleteAtList()

            /* recheck */
            NewAmount is Amount - HasilJual,
            checkBankrupt(NewAmount),
            !
        );

        (
            write('memang dasar ga punya spirit berjuang, bye dek'),nl,
            endGame
        )
    ).
    



/* endGame, retractall */
/** 
endGame :-
**/

/* surrender */
/** 
surrender :-
**/