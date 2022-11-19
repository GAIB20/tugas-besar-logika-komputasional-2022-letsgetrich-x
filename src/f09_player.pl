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
    assertz(cashPlayer(P1, 30000)),
    assertz(cashPlayer(P2, 30000)),
    /* Set daftar lokasi yang dimiliki */ 
    assertz(listPropPlayer(P1, [])),
    assertz(listPropPlayer(P2, [])),
    /* Set daftar card */ 
    assertz(cardPlayer(P1, [])),
    assertz(cardPlayer(P2, [])).

/* Hitung nilai Prop lokasi X hingga tingkatan Y dan disimpan di Z */
nilaiProp(X, 0, Z) :-
    hargaBeli(X, 0, Price),
    Z is Price.

nilaiProp(X, Y, Z) :-
    hargaBeli(X, Y, Price),
    nilaiProp(X, Y1, Z1),
    Y is Y1 - 1,
    Z is Z1 + Price.

/* total nilai properti player X is Nilai */
countProp(X, Nilai) :- 
    Nilai is 0,
    /* move ListProp to tempList */
    retractall(tempList(_)),
    asserta(tempList(ListProp)),

    repeat,
        /* ambil nilai Head */
        tempList([Head|Tail]),

        /* ambil nilai tingkatan properti dan harga beli */
        tingkatan(),

        /* Hitung nilai properti */
        nilaiProp(Head, Y, Z),
        Nilai is Nilai + Z,
    Tail == [],!.


/* totalAssets player X is Y */
totalAssets(X, Y) :- 
    cashPlayer(X, Cash),
    countProp(X, Prop),
    Y is Cash + Prop.

/* Rule menambah cash setiap melewati go, X jumlah steps player Y */
addCashGO(X, Y) :- 
    X > 31, !,
    incCash(3000, Y).

/* Rule menampilkan daftar properti */
displayProp(X) :- 
    listPropPlayer(X,ListProp),

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

/* incrementCash Player by X */
incCash(X, Player) :- 
    cashPlayer(Player, Cash),
    Cashnew is Cash + X,
    retractall(cashPlayer(Player, Cash)),
    asserta(cashPlayer(Player, Cashnew)).

/* decrementCash Player by X */
decCash(X, Player) :- 
    cashPlayer(Player, Cash),
    Cashnew is Cash - X,
    retractall(cashPlayer(Player, Cash)),
    asserta(cashPlayer(Player, Cashnew)).



