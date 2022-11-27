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
/* locPlayer(no player, no tile) */
/* moneyPlayer(no player, cash) */
/* listPropPlayer(no player, list location yang dimiliki) */
/* cardPlayer(no player, list card yang dimiliki) */

/* is Player */
is_player(1).
is_player(2).

/* Rule inisiasi player */
initPlayer :-
    P1 is 1,
    P2 is 2,
    /* Set player awal */
    assertz(currentPlayer(2)),

    /* read playername */
    nl,
    write('Insert player name, use single quote, e.g. \'Rachelszzz\''), nl,
    write('Insert Player 1 name : '),
    read(Player1Name),
    write('Insert Player 2 name : '),
    read(Player2Name),

    assertz(playerName(1, Player1Name)),
    assertz(playerName(2, Player2Name)),

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
        X > 31 -> incCash(3000, Y);
        !
    ).


displayProp([],_):-!.
displayProp([Head|Tail], No):-
    write(No),
    write('. '),
    nama_lokasi(Head, InfoLoc),
    write(InfoLoc),
    write(' - '),
    tingkatan(Head, Tingk),
    nama_tingkatan(Tingk, InfoTingkt),
    write(InfoTingkt),nl,
    No1 is No + 1,
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
                        (
                            Length > 0 -> displayProp(ListProp, 1),nl;
                            write('You don\'t have any property yet ...\n')
                        ),
                        write('Chance card owned: '), nl,
                        cardPlayer(X, ListCard),
                        length(ListCard, LengthCard),
                        (
                            LengthCard > 0 -> displayPlayerCard(X),nl, !;
                            write('You don\'t have any chance card yet ...\n'), !
                        )
    ),
    !.


/* incrementCash Player by X */
incCash(X, Player) :- 
    cashPlayer(Player, Cash),
    Cashnew is Cash + X,
    retractall(cashPlayer(Player, Cash)),
    asserta(cashPlayer(Player, Cashnew)),
    write('Yay! Your cash is increased by '), write(X), write('!'), nl,
    write('Your money right now is '), write(Cashnew), nl.

/* decrementCash Player by X */
decCash(X, Player) :- 
    \+ bankruptMechanism(X),
    cashPlayer(Player, Cash),
    Cashnew is Cash - X,
    retractall(cashPlayer(Player, Cash)),
    asserta(cashPlayer(Player, Cashnew)),
    write('Your cash is decreased by '), write(X), write('!'), nl,
    write('Your money right now is '), write(Cashnew), nl.
