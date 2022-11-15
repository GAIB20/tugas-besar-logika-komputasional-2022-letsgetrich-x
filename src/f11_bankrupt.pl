
/* mekanisme player terindikasi bangkrut*/
bankruptMechanism(Ammount) :-
    /* totalAssets(Assets), */
    Assets is 10000,
    (Assets >= Ammount,!,fail);
    (
        write('helo')
    ),!.

/* (bankruptMechanism(1000000000);!). */


    

    

/* menyelesaikan permainan */
/* endGame :- */

/* currentPlayer menyerah */
/* surrender :- */