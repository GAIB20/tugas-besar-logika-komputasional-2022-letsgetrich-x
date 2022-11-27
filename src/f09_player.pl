/* File player.pl */
:- dynamic(currentPlayer/1).
:- dynamic(locPlayer/2).
:- dynamic(cashPlayer/2).
:- dynamic(listPropPlayer/2).
:- dynamic(cardPlayer/2).
:- dynamic(currentPlayer/1).
:- dynamic(playerName/2).
/* locPlayer(no player, location) */
/* currentPlayer(no player) */
/* playerName(no player, name) */
/* locPlayer(no player, titik X, titik Y) */
/* moneyPlayer(no player, cash) */
/* listPropPlayer(no player, list location yang dimiliki) */
/* cardPlayer(no player, list card yang dimiliki) */

/* is Player */
is_player(1).
is_player(2).

/* initialize temp predicate 
tempIndeks(-1).
tempList([]). */

/* Rule inisiasi player */
initPlayer :-
    P1 is 1,
    P2 is 2,
    /* Set player awal */
    assertz(currentPlayer(2)),
    assertz(playerName(1, 'Rachel')),
    assertz(playerName(2, 'Livia')),
    /* Set lokasi awal */
    assertz(locPlayer(P1, 0)),
    assertz(locPlayer(P2, 0)),
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
nilaiProp(_X, -1, 0) :- !.

nilaiProp(X, Y, Z) :-
    hargaBeli(X, Y, Price),
    Y1 is Y - 1,
    nilaiProp(X, Y1, Z1),
    Z is Z1 + Price.

/* total nilai properti player X is Nilai */
countProp([], 0, 0) :- !.

countProp([Head|Tail], Length, Prop) :- 
    Length1 is Length - 1,
    tingkatan(Head, Tingk),
    nilaiProp(Head, Tingk, Nilai),
    countProp(Tail, Length1, Prop1),
    Prop is Prop1 + Nilai.


/* totalAssets player X is Y */
totalAssets(X, Y) :- 
    cashPlayer(X, Cash),
    listPropPlayer(X, ListProp),
    length(ListProp, Length),
    countProp(ListProp, Length, Prop),
    Y is Cash + Prop.

/* Rule menambah cash setiap melewati go, X jumlah steps player Y */
addCashGO(X, Y) :- 
    (
        X > 31 -> incCash(3000, Y), !;
        incCash(0, Y), !
    ),!.


displayProp([],_):-!.
displayProp([Head|Tail], No):-
    write(No),
    nama_lokasi(Head, InfoLoc),
    write(InfoLoc),
    write(' - '),
    tingkatan(Head, Tingk),
    nama_tingkatan(Tingk, InfoTingkt),
    write(InfoTingkt),nl,
    No1 is No - 1,
    displayProp(Tail, No1).


/* Rule menampilkan daftar card */
displayPlayerCard(X) :- 
    cardPlayer(X, ListCard),
    displayCards(ListCard).

/* Rule cek detail player */
checkPlayerDetail(X) :-
    (
        is_player(X) -> playerName(X, Name),
                        write('Information of '), write(Name), nl,
                        locPlayer(X, Loc), tile(Loc, TileName),
                        nama_lokasi(TileName, LocName),
                        write('Location         : '), write(TileName), write(' - '),
                        write(LocName),nl,
                        cashPlayer(X, Cash),
                        write('Money            : '), write(Cash),nl,
                        listPropPlayer(X, ListProp),
                        length(ListProp, Length),
                        countProp(ListProp, Length, Prop),
                        write('Property value   : '), write(Prop),nl,
                        Aset is Cash + Prop,
                        write('Asset value      : '), write(Aset),nl,

                        write('Properties owned : '), nl,
                        displayProp(ListProp, 1),nl,

                        write('Chance card owned: '), nl,
                        displayPlayerCard(X),nl,!
    ),
    !.


/* incrementCash Player by X */
incCash(X, Player) :- 
    cashPlayer(Player, Cash),
    Cashnew is Cash + X,
    retractall(cashPlayer(Player, Cash)),
    asserta(cashPlayer(Player, Cashnew)),
    write(X), write(' has been withdrawn from your account.'), nl, !.

/* decrementCash Player by X */
decCash(X, Player) :- 
    cashPlayer(Player, Cash),
    Cashnew is Cash - X,
    retractall(cashPlayer(Player, Cash)),
    asserta(cashPlayer(Player, Cashnew)),
    write(X), write(' has been added to your account.'), nl, !.



