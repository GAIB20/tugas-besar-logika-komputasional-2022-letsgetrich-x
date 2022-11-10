/* File player.pl */
:- dynamic(player/7).
/* Informasi Player: No, Lokasi, Total Uang, Total Nilai Properti, Total Aset, Daftar Properti, Daftar Card */

/* Rule inisiasi player */
initPlayer :-
    P1 is 1,
    P2 is 2,
    /* Set lokasi awal */ Loc is go,
    /* Set uang awal */ Cash is 10000,
    /* Set nilai properti */ Prop is 0,
    /* Set total aset */ Aset is Cash + Prop,
    /* Set daftar properti */ PropList is [],
    /* Set daftar card */ CardList is [],
    asserta(player(P1, Loc, Cash, Prop, Aset, PropList, CardList)),
    asserta(player(P2, Loc, Cash, Prop, Aset, PropList, CardList)).

/* Rule membuat list daftar properti */
daftarProp(X) :-

/* Rule membuat list daftar card */
daftarCard(X) :-

/* Rule hitung nilai properti */
countProp(X) :-

/* Rule menampilkan daftar properti */
displayProp(X) :-

/* Rule menampilkan daftar card */
displayCard(X) :-

/* Rule cek detail player */
checkPlayerDetail(X) :-
    player(X, Loc, Cash, Prop, Aset, PropList, CardList),
    write('Informasi Player '), write(X), nl,
    write('Lokasi                : '), write(Loc),nl,
    write('Total Uang            : '), write(Cash),nl,
    write('Total Nilai Properti  : '), write(Prop),nl,
    Aset is Cash + Prop,
    write('Total Aset            : '), write(Aset),nl,

    write('Daftar Kepemilikan Properti  : '), nl,
    displayProp(X),nl,

    write('Daftar Kepemilikan Card      : '), 
    displayCard(X),nl.