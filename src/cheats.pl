/*  cheat 
(
    memindahkan paksa pemain, 
    mengubah jumlah uang pemain, 
    mengubah kepemilikan dan level properti, 
    dan lain-lain untuk mencapai state yang diinginkan secara mudah dan cepat untuk kebutuhan demo
) 
*/

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

cheatAddMoney(Player, Increment) :-
    is_player(Player),
    cashPlayer(P, Money),
    P == Player,

    retractall(cashPlayer(P, Money)),
    NMoney is Money + Increment,
    asserta(cashPlayer(P, NMoney)), !.

cheatJail:-
    retractall(playerDouble(1,_)),
    asserta(playerDouble(1, 3)),
    cardMechanism('Get Out From Azkaban'),
    jailMechanism.

cheatChanceCard :-
    currentPlayer(X),
    retractall(locPlayer(X, _)),
    asserta(locPlayer(X, 4)),
    drawChanceCard.

testAngel:- 
    retractall(kepemilikan(a1,_)),
    asserta(kepemilikan(a1, 1)),
    retractall(tingkatan(a1,_)),
    asserta(tingkatan(a1, 1)),
    retractall(locPlayer(2, _)),
    asserta(locPlayer(2, 1)),
    propertyMechanism.
