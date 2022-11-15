/* File player.pl */
:- dynamic(currentPlayer/1).
:- dynamic(namePlayer/2).
:- dynamic(locPlayer/3).
:- dynamic(cashPlayer/2).
:- dynamic(listLocPlayer/2).
:- dynamic(cardPlayer/2).
/* currentPlayer(no player) */
/* namePlayer(no player, name) */
/* locPlayer(no player, titik X, titik Y) */
/* moneyPlayer(no player, cash) */
/* listLocPlayer(no player, list location yang dimiliki) */
/* cardPlayer(no player, list card yang dimiliki) */

/* is Player */
is_player(1).
is_player(2).

/* Rule inisiasi player */
initPlayer :-
    P1 is 1,
    P2 is 2,
    write('Masukkan nama Player 1: '), read(Name1),nl,
    write('Masukkan nama Player 2: '), read(Name2),nl,
    assertz(namePlayer(1, Name1)),
    assertz(namePlayer(2, Name2)),
    /* Set pemain pertama */
    currentPlayer(1),
    /* Set lokasi awal */
    assertz(locPlayer(P1, 0, 0)),
    assertz(locPlayer(P2, 0, 0)),
    /* Set uang awal, nilai properti */ 
    assertz(cashPlayer(P1, 50000)),
    assertz(cashPlayer(P2, 50000)),
    /* Set daftar lokasi yang dimiliki */ 
    assertz(listLocPlayer(P1, [])),
    assertz(listLocPlayer(P2, [])),
    /* Set daftar card */ 
    assertz(cardPlayer(P1, [])),
    assertz(cardPlayer(P2, [])).

/* Rule menambah cash setiap melewati go */
addCashGO(X) :-

/* Rule membuat list daftar properti */
daftarProp(X) :-

/* Rule hitung nilai properti */
countProp(X, Y) :-

/* Rule menampilkan daftar properti */
displayProp(X) :-

/* Rule menampilkan daftar card */
displayCard(X) :-

/* Rule cek detail player */
checkPlayerDetail(X) :-
    (
        is_player(X) -> write('Informasi Player '), write(X), nl,
                        locPlayer(X, Loc),
                        write('Lokasi                : '), write(Loc),nl,
                        cashPlayer(X, Cash),
                        write('Total Uang            : '), write(Cash),nl,
                        countProp(X, Prop),
                        write('Total Nilai Properti  : '), write(Prop),nl,
                        Aset is Cash + Prop,
                        write('Total Aset            : '), write(Aset),nl,

                        write('Daftar Kepemilikan Properti  : '), nl,
                        displayProp(X),nl,

                        write('Daftar Kepemilikan Card      : '), nl,
                        displayCard(X),nl,
    ),
    !.