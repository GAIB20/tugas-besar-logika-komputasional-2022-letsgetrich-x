/* File player.pl */
:- dynamic(currentPlayer/1).
:- dynamic(namePlayer/2).
:- dynamic(locPlayer/3).
:- dynamic(cashPlayer/2).
:- dynamic(listPropPlayer/2).
:- dynamic(cardPlayer/2).
:- dynamic(tempIndeks/1).
:- dynamic(tempList/1).
/* currentPlayer(no player) */
/* namePlayer(no player, name) */
/* locPlayer(no player, titik X, titik Y) */
/* moneyPlayer(no player, cash) */
/* listPropPlayer(no player, list location yang dimiliki) */
/* cardPlayer(no player, list card yang dimiliki) */

/* is Player */
is_player(1).
is_player(2).

/* initialize temp predicate */
tempIndeks(-1).
tempList([]).

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
    assertz(listPropPlayer(P1, [])),
    assertz(listPropPlayer(P2, [])),
    /* Set daftar card */ 
    assertz(cardPlayer(P1, [])),
    assertz(cardPlayer(P2, [])).

/* Rule membuat list daftar properti */
daftarProp(X) :- !.

/* Rule hitung nilai properti */
countProp(X, Y) :- !.

/* Rule menambah cash setiap melewati go */
addCashGO(X) :- !.

/* Rule menampilkan daftar properti */
displayProp :- 
    currentPlayer(Player),
    listPropPlayer(Player,ListProp),

    /* reset index */
    retractall(tempIndeks(_)),
    asserta(tempIndeks(1)),

    /* move ListProp to tempList */
    retractall(tempList(_)),
    asserta(tempList(ListProp)),
    
    repeat,
        /* ambil nilai indeks */
        tempIndeks(Idx),

        /* ambil nilai Head */
        tempList([Head|Tail]),

        /* ambil nilai jenis tanah dan harga beli */
        hargaBeli(Head,Type,Price),

        /* print details */
        write(Idx),
        write('. '),
        write(Head),
        write(' - '),
        write(Type),
        write(' - '),
        write(Price),nl,
        NewIdx is Idx + 1,
        retractall(tempIndeks(_)),
        asserta(tempIndeks(NewIdx)),
        retractall(tempList(_)),
        asserta(tempList(Tail)),
    Tail == [],!.

/* Rule menampilkan daftar card */
displayCard(X) :- !.

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

/* incrementCash currentPlayer by X */
incCash(X) :- !.

/* decrementCash currentPlayer by X */
decCash(X) :- !.

/* totalAssets currentPlayer is X */
totalAssets(X) :- !.

/* Rule membuat list daftar card, sementara ga di pake karena card yang disimpan hanya free from jail */
/* daftarCard(X) :- !. */

