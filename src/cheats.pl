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

/* Check Mekanisme Double */
cheatDoubleDice(DiceVal) :-
    currentPlayer(Player),
    
    (DiceVal>0, DiceVal<7) -> (    
        write('Dice 1 : '),
        write(DiceVal), nl,

        write('Dice 2 : '),
        write(DiceVal), nl,nl,nl,

        write('Double!'), nl,
        (in_jail(Player) -> switchPlayer;!), 
        Forward is 2*DiceVal,
        incPlayerDouble,
        move(Player, Forward),
        map,
        !
    ); write('Double dice value must be in between 1-6.'), nl
    , !.

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
    jailMechanism,
    retractall(playerDouble(1,_)),
    asserta(playerDouble(1, 1)).

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

testBankrupt:-
    retractall(cashPlayer(2,_)),
    asserta(cashPlayer(2,100)),

    retractall(kepemilikan(a1,_)),
    asserta(kepemilikan(a1,2)),
    retractall(tingkatan(a1,_)),
    asserta(tingkatan(a1,3)),
    modifyTileInfo(a1),

    retractall(kepemilikan(a2,_)),
    asserta(kepemilikan(a2,2)),
    retractall(tingkatan(a2,_)),
    asserta(tingkatan(a2,3)),
    modifyTileInfo(a2),

    retractall(kepemilikan(a3,_)),
    asserta(kepemilikan(a3,1)),
    retractall(tingkatan(a3,_)),
    asserta(tingkatan(a3,3)),
    modifyTileInfo(a3).


cheatWorldTour:-
    currentPlayer(X),
    retractall(locPlayer(X,_)),
    asserta(locPlayer(X,24)),
    apparateMechanism.

cheatFlipCoin:-
    currentPlayer(X),
    retractall(locPlayer(X,_)),
    asserta(locPlayer(X,29)),
    playCoinFlip.

cheatTax:-
    currentPlayer(X),
    retractall(locPlayer(X,_)),
    asserta(locPlayer(X,28)),
    payTax.
