/* File player.pl */
:- dynamic(locPlayer/2).
:- dynamic(cashPlayer/2).
:- dynamic(propPlayer/2).
:- dynamic(cardPlayer/2).
:- dynamic(currentPlayer/1).
:- dynamic(playerName/2).
/* locPlayer(no player, location) */
/* moneyPlayer(no player, cash) */
/* locPlayer(no player, location) */
/* locPlayer(no player, location) */

/* is Player */
is_player(1).
is_player(2).

/* Rule inisiasi player */
initPlayer :-
    P1 is 1,
    P2 is 2,
    /* Set player awal */
    assertz(currentPlayer(1)),
    assertz(playerName(1, 'Rachel')),
    assertz(playerName(2, 'Livia')),
    /* Set lokasi awal */
    assertz(locPlayer(P1, 0)),
    assertz(locPlayer(P2, 0)),
    /* Set uang awal, nilai properti */ 
    assertz(cashPlayer(P1, 50000)),
    assertz(cashPlayer(P2, 50000)),
    /* Set daftar properti */ 
    assertz(propPlayer(P1, [])),
    assertz(propPlayer(P2, [])),
    /* Set daftar card */ 
    assertz(cardPlayer(P1, [])),
    assertz(cardPlayer(P2, [])).

/* Rule membuat list daftar properti */
daftarProp(X) :-
    !.
/* Rule membuat list daftar card */
daftarCard(X) :-
    !.
/* Rule hitung nilai properti */
countProp(X, Y) :-
    !.
/* Rule menampilkan daftar properti */
displayProp(X) :-
    !.
/* Rule menampilkan daftar card */
displayCard(X) :-
    !.

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
                        displayCard(X),nl,!
    ),
    !.