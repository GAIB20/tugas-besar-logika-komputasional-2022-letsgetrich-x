/*  cheat 
(misal memindahkan paksa pemain, 
mengubah jumlah uang pemain, 
mengubah kepemilikan dan level properti, 
dan lain-lain untuk mencapai state yang diinginkan secara mudah dan cepat untuk kebutuhan demo) */

/* MOVEMENT CHEAT: forced movement */
/* jika argumen Player sama dengan currentPlayer, Player akan dipindahkan dan giliran berikutnya adalah Player yang sama */
/* jika argumen Player berbeda dengan currentPlayer, Player tersebut akan memperoleh giliran, dipindahkan, kemudian giliran dikembalikan ke currentPlayer */
cheatMove(Player, Steps) :-
    is_player(Player),
    currentPlayer(P),
    (
        Player \= P -> switchPlayer; Player =:= P
    ),
    move(Player, Steps), switchPlayer,
    retractall(playerDouble(Player,_)),
    asserta(playerDouble(Player,0)).
