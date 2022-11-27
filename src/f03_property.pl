:-include('f02_location.pl').
:-include('f09_player.pl').
:-include('f11_bankrupt.pl').
:-include('b01_colorset.pl').
:- dynamic(tingkatan/2).
:- dynamic(hargaBeli/3).
/* hargaBeliProp(loc, Tingkatan, hargaBeli)*/
/*
    0 = tanah
    1 = bangunan 1
    2 = bangunan 2
    3 = bangunan 3
    4 = landmark
*/
hargaBeli(a1, 0, 200).
hargaBeli(a1, 1, 1000).
hargaBeli(a1, 2, 2000).
hargaBeli(a1, 3, 3000).
hargaBeli(a1, 4, 3000).
hargaBeli(a2, 0, 150).
hargaBeli(a2, 1, 1050).
hargaBeli(a2, 2, 2000).
hargaBeli(a2, 3, 3000).
hargaBeli(a2, 4, 2950).
hargaBeli(a3, 0, 100).
hargaBeli(a3, 1, 1000).
hargaBeli(a3, 2, 2100).
hargaBeli(a3, 3, 3000).
hargaBeli(a3, 4, 2900).

hargaBeli(b1, 0, 300).
hargaBeli(b1, 1, 1200).
hargaBeli(b1, 2, 2200).
hargaBeli(b1, 3, 3200).
hargaBeli(b1, 4, 3200).
hargaBeli(b2, 0, 300).
hargaBeli(b2, 1, 1250).
hargaBeli(b2, 2, 2100).
hargaBeli(b2, 3, 3300).
hargaBeli(b2, 4, 3200).
hargaBeli(b3, 0, 350).
hargaBeli(b3, 1, 1200).
hargaBeli(b3, 2, 2200).
hargaBeli(b3, 3, 3200).
hargaBeli(b3, 4, 3200).

hargaBeli(c1, 0, 400).
hargaBeli(c1, 1, 1500).
hargaBeli(c1, 2, 2500).
hargaBeli(c1, 3, 3200).
hargaBeli(c1, 4, 3500).
hargaBeli(c2, 0, 400).
hargaBeli(c2, 1, 1450).
hargaBeli(c2, 2, 2100).
hargaBeli(c2, 3, 3300).
hargaBeli(c2, 4, 3500).
hargaBeli(c3, 0, 450).
hargaBeli(c3, 1, 1400).
hargaBeli(c3, 2, 2500).
hargaBeli(c3, 3, 3600).
hargaBeli(c3, 4, 4000).

hargaBeli(d1, 0, 450).
hargaBeli(d1, 1, 1600).
hargaBeli(d1, 2, 2600).
hargaBeli(d1, 3, 3000).
hargaBeli(d1, 4, 3600).
hargaBeli(d2, 0, 500).
hargaBeli(d2, 1, 1650).
hargaBeli(d2, 2, 2200).
hargaBeli(d2, 3, 3000).
hargaBeli(d2, 4, 3700).
hargaBeli(d3, 0, 400).
hargaBeli(d3, 1, 1600).
hargaBeli(d3, 2, 2400).
hargaBeli(d3, 3, 3800).
hargaBeli(d3, 4, 4000).

hargaBeli(e1, 0, 450).
hargaBeli(e1, 1, 1650).
hargaBeli(e1, 2, 2700).
hargaBeli(e1, 3, 3400).
hargaBeli(e1, 4, 4000).
hargaBeli(e2, 0, 500).
hargaBeli(e2, 1, 1700).
hargaBeli(e2, 2, 2600).
hargaBeli(e2, 3, 3000).
hargaBeli(e2, 4, 3700).
hargaBeli(e3, 0, 450).
hargaBeli(e3, 1, 1800).
hargaBeli(e3, 2, 2500).
hargaBeli(e3, 3, 4000).
hargaBeli(e3, 4, 4200).

hargaBeli(f1, 0, 550).
hargaBeli(f1, 1, 2000).
hargaBeli(f1, 2, 2900).
hargaBeli(f1, 3, 3700).
hargaBeli(f1, 4, 4000).
hargaBeli(f2, 0, 550).
hargaBeli(f2, 1, 1900).
hargaBeli(f2, 2, 2100).
hargaBeli(f2, 3, 3300).
hargaBeli(f2, 4, 4500).
hargaBeli(f3, 0, 450).
hargaBeli(f3, 1, 1400).
hargaBeli(f3, 2, 2500).
hargaBeli(f3, 3, 3600).
hargaBeli(f3, 4, 4000).

hargaBeli(g1, 0, 700).
hargaBeli(g1, 1, 2100).
hargaBeli(g1, 2, 2700).
hargaBeli(g1, 3, 4000).
hargaBeli(g1, 4, 5000).
hargaBeli(g2, 0, 750).
hargaBeli(g2, 1, 2000).
hargaBeli(g2, 2, 2300).
hargaBeli(g2, 3, 3800).
hargaBeli(g2, 4, 4500).
hargaBeli(g3, 0, 750).
hargaBeli(g3, 1, 2400).
hargaBeli(g3, 2, 2500).
hargaBeli(g3, 3, 3600).
hargaBeli(g3, 4, 4000).

hargaBeli(h1, 0, 800).
hargaBeli(h1, 1, 3000).
hargaBeli(h1, 2, 3500).
hargaBeli(h1, 3, 4000).
hargaBeli(h1, 4, 5500).
hargaBeli(h2, 0, 800).
hargaBeli(h2, 1, 2900).
hargaBeli(h2, 2, 3600).
hargaBeli(h2, 3, 3900).
hargaBeli(h2, 4, 4500).

/*hargaSewa(loc, Tingkatan lokasi, harga)*/
hargaSewa(_Loc, _Tingkatan, Harga):- 
    _Tingkatan == 0 ->
    hargaBeli(_Loc, _Tingkatan, X),
    Harga is X//2.
hargaSewa(_Loc, _Tingkatan, Harga):- 
    _Tingkatan == 1 ->
    hargaBeli(_Loc, 0, X),
    hargaBeli(_Loc, 1, X1),
    Harga is (X+X1)//2.
hargaSewa(_Loc, _Tingkatan, Harga):- 
    _Tingkatan == 2 ->
    hargaBeli(_Loc, 0, X),
    hargaBeli(_Loc, 1, X1),
    hargaBeli(_Loc, 2, X2),
    Harga is (X+X1+X2)//2.
hargaSewa(_Loc, _Tingkatan, Harga):- 
    _Tingkatan == 3 ->
    hargaBeli(_Loc, 0, X),
    hargaBeli(_Loc, 1, X1),
    hargaBeli(_Loc, 2, X2),
    hargaBeli(_Loc, _Tingkatan, X3),
    Harga is (X+X1+X2+X3)//2.
hargaSewa(_Loc, _Tingkatan, Harga):- 
    _Tingkatan == 4 ->
    hargaBeli(_Loc, 0, X),
    hargaBeli(_Loc, 1, X1),
    hargaBeli(_Loc, 2, X2),
    hargaBeli(_Loc, 3, X3),
    hargaBeli(_Loc, _Tingkatan, X4),
    Harga is (X+X1+X2+X3+X4)//2.

/*Harga akuisisi/ambil alih = harga total beli*/
/*hargaAmbil(loc, Tingkatan lokasi, harga)*/
hargaAmbil(_Loc, _Tingkatan, Harga):- 
    _Tingkatan == 0 ->
    hargaBeli(_Loc, _Tingkatan, X),
    Harga is X,!.
hargaAmbil(_Loc, _Tingkatan, Harga):- 
    _Tingkatan == 1 ->
    hargaBeli(_Loc, 0, X),
    hargaBeli(_Loc, 1, X1),
    Harga is X+X1,!.
hargaAmbil(_Loc, _Tingkatan, Harga):- 
    _Tingkatan == 2 ->
    hargaBeli(_Loc, 0, X),
    hargaBeli(_Loc, 1, X1),
    hargaBeli(_Loc, 2, X2),
    Harga is X+X1+X2,!.
hargaAmbil(_Loc, _Tingkatan, Harga):- 
    _Tingkatan == 3 ->
    hargaBeli(_Loc, 0, X),
    hargaBeli(_Loc, 1, X1),
    hargaBeli(_Loc, 2, X2),
    hargaBeli(_Loc, _Tingkatan, X3),
    Harga is X+X1+X2+X3,!.
hargaAmbil(_Loc, _Tingkatan, Harga):- 
    _Tingkatan == 4 ->
    hargaBeli(_Loc, 0, X),
    hargaBeli(_Loc, 1, X1),
    hargaBeli(_Loc, 2, X2),
    hargaBeli(_Loc, 3, X3),
    hargaBeli(_Loc, _Tingkatan, X4),
    Harga is X+X1+X2+X3+X4,!.

/*tingkatan properti
  tingkatan(Loc)*/
tingkatan(a1,-1).
tingkatan(a2,-1).
tingkatan(a3,-1).
tingkatan(b1,-1).
tingkatan(b2,-1).
tingkatan(b3,-1).
tingkatan(c1,-1).
tingkatan(c2,-1).
tingkatan(c3,-1).
tingkatan(d1,-1).
tingkatan(d2,-1).
tingkatan(d3,-1).
tingkatan(e1,-1).
tingkatan(e2,-1).
tingkatan(e3,-1).
tingkatan(f1,-1).
tingkatan(f2,-1).
tingkatan(f3,-1).
tingkatan(g1,-1).
tingkatan(g2,-1).
tingkatan(g3,-1).
tingkatan(h1,-1).
tingkatan(h2,-1).

nama_tingkatan(0, 'Land').
nama_tingkatan(1, 'Small Cottage').
nama_tingkatan(2, 'Medium Cottage').
nama_tingkatan(3, 'Large Cottage').
nama_tingkatan(4, 'Castle').

/*checkPropertyDetail(Loc)*/
checkPropertyDetail(X):-
    nama_lokasi(X, Name),!,
    write('Location Name               : '),
    write(Name), nl,
    write('Description                 : '),
    desc_lokasi(X, Desc),
    write(Desc), nl,
    (
        is_property(X) -> hargaBeli(X, 0, HargaTanah), 
                          hargaBeli(X, 1, HargaBg1),
                          hargaBeli(X, 2, HargaBg2),
                          hargaBeli(X, 3, HargaBg3),
                          hargaBeli(X, 4, HargaLm),
                          write('------ Property Price List ------\n'),
                          write(' Land                  : '), write(HargaTanah),nl,
                          write(' Small Cottage         : '), write(HargaBg1),nl,
                          write(' Medium Cottage        : '), write(HargaBg2),nl,
                          write(' Large Cottage         : '), write(HargaBg3),nl,
                          write(' Castle                : '), write(HargaLm),nl,
                          nl,
                          hargaSewa(X, 0, HargaTanah1),
                          hargaSewa(X, 1, HargaBg11),
                          hargaSewa(X, 2, HargaBg21),
                          hargaSewa(X, 3, HargaBg31),
                          hargaSewa(X, 4, HargaLm1),
                          write('------- Rent Price List -------\n'),
                          write(' Land                  : '), write(HargaTanah1),nl,
                          write(' Small Cottage         : '), write(HargaBg11),nl,
                          write(' Medium Cottage        : '), write(HargaBg21),nl,
                          write(' Large Cottage         : '), write(HargaBg31),nl,
                          write(' Castle                : '), write(HargaLm1),nl
    ),
    !.

/*Membeli properti
  buy(Loc, Tingkatan)*/
/*Player hanya bisa beli landmark jika sampai di properti sendiri dan bangunannya sudah tingkat 3*/
buy(_Loc, Tingkatan):- currentPlayer(X), cashPlayer(X, Cash),hargaAmbil(_Loc,Tingkatan, Harga),tingkatan(_Loc, Temp),(
                    (
                        Tingkatan == 4 ->(Temp\=3->write('Can\'t build Castle\n'),propertyMechanism ;( hargaBeli(_Loc, Tingkatan, HargaLM),
                                          HargaLM=<Cash -> (retractall(kepemilikan(_Loc,_)),
                                                                  kepemilikan(_Loc, X),
                                                                  retractall(tingkatan(_Loc,_)),
                                                                  assertz(tingkatan(_Loc, Tingkatan)),
                                                                  NewCash is Cash - HargaLM,
                                                                  retractall(cashPlayer(_)),
                                                                  assertz(cashPlayer(NewCash)),
                                                                  retractall(tingkatan(_Loc,_)),
                                                                  asserta(tingkatan(_Loc,Tingkatan)),
                                                                  write('Congrats! Castle have been build!\n'));write('Sorry you don\'t have enough cash\n')
                                          );
                                          write('Can\'t build Castle\n') 
                                         );
                        Temp == -1 ->(
                            Harga=<Cash -> (retractall(kepemilikan(_Loc,_)),
                                                    assertz(kepemilikan(_Loc, X)),
                                                    retractall(tingkatan(_Loc,_)),
                                                    assertz(tingkatan(_Loc, Tingkatan)),
                                                    NewCash is Cash - Harga,
                                                    retractall(cashPlayer(X, _)),
                                                    assertz(cashPlayer(X, NewCash)),
                                                    write('Property paid!\n'),
                                                    listPropPlayer(X, List),
                                                    retractall(listPropPlayer(X,_)),
                                                    insertLast(_Loc, List, NewList),
                                                    retractall(tingkatan(_Loc,_)),
                                                    asserta(tingkatan(_Loc,Tingkatan)),
                                                    asserta(listPropPlayer(X,NewList)),
                                                    length(NewList,Len),
                                                    write('\nProperties List:\n'),
                                                    displayProp(NewList, Len),
                                                    checkColorset);write('Sorry you don\'t have enough cash\n')
                        );
                        Temp \= 4 -> (
                            Tingkatan > Temp -> (
                                hargaAmbil(_Loc, Temp, HargaAsli),
                                HargaUpgrade is Harga - HargaAsli,
                                HargaUpgrade=< Cash ->(
                                    NewCash is Cash - HargaUpgrade,
                                    retractall(cashPlayer(X, _)),
                                    assertz(cashPlayer(X, NewCash)),
                                    retractall(tingkatan(_Loc,_)),
                                    asserta(tingkatan(_Loc,Tingkatan)),
                                    write('Congrats! Your Property have been upgraded!\n')
                                );!
                            );write('Can\'t upgrade below state\n'), propertyMechanism
                        )
                        ;!
                    );
                    !
                    ), !.

/*Menjual properti
  sell(Loc)*/
sell(Loc):- currentPlayer(X), tingkatan(Loc,Tingkatan), hargaAmbil(Loc, Tingkatan, Harga), 
            incCash(Harga, X), retractall(tingkatan(Loc,_)), assertz(tingkatan(Loc, -1)),
            retractall(kepemilikan(_Loc,_)),assertz(kepemilikan(_Loc, 0)).   

/*property mechanism*/
propertyMechanism:-
    currentPlayer(X), locPlayer(X, CurrLoc), tile(CurrLoc, CurrLoc1),kepemilikan(CurrLoc1,Milik),
    checkPropertyDetail(CurrLoc1), tingkatan(CurrLoc1, Stat),
    (
        Milik == 0 -> (write('No one has bought any property here.\n'),
                      write('0. Pass \n'),
                      write('1. Buy\n'),
                      read(Choice),
                        (
                            Choice == 0 -> write('Pass an opportunity? What a shame\n');
                            Choice == 1 -> (write('Good choice, what do you want to buy?\n'),
                                            write('0. Land\n'),
                                            write('1. Small Cottage \n'),
                                            write('2. Medium Cottage\n'),
                                            write('3. Large Cottage\n'),
                                            write('4. Castle\n'),
                                            read(Tingkatan),
                                            (
                                                buy(CurrLoc1,Tingkatan)
                                            ),!
                                           );
                            !
                        )
                      );
        Milik == X -> (Stat \=4 ->
                        write('You arrive at your own property\n'),
                        write('0. Pass \n'),
                        write('1. Upgrade\n'),
                        read(Choice),
                        (
                            Choice == 0 -> write('Pass an opportunity? What a shame\n');
                            Choice == 1 -> (write('Good choice, choose your building upgrade:\n'),
                                            write('1. Small Cottage \n'),
                                            write('2. Medium Cottage\n'),
                                            write('3. Large Cottage\n'),
                                            write('4. Castle\n'),
                                            read(Tingkatan),
                                            (
                                                buy(CurrLoc1,Tingkatan)
                                            ),
                                            !);
                            !
                        );(
                            write('You arrive at your own Castle\n')
                        )
                      );
        (
            write('You arrive at other player property, you have to pay the rent fee\n'),
            hargaSewa(CurrLoc1, Stat, HargaSewa),
            totalAssets(X, AssetsPlayer),
            cashPlayer(X, Cash),
            NewCash is Cash-HargaSewa,
            retractall(cashPlayer(X, NewCash)),
            /*cuma bisa ambil alih kalo cashnya masih ada, bukan assets*/
            Stat\=4 -> 
                                (
                                    hargaAmbil(CurrLoc1, Stat, HargaAmbil),
                                    HargaAmbil=<NewCash ->(
                                        write('Do you want to take over?\n'),
                                        write('0. Pass \n'),
                                        write('1. Take Over\n'),
                                        read(Choice),(
                                            Choice == 0 -> write('Pass an opportunity? What a shame\n');
                                            Choice == 1 -> (NewCash2 is NewCash-HargaAmbil,
                                                           retractall(cashPlayer(X,_)),
                                                           asserta(cashPlayer(X,NewCash2)),
                                                           retractall(kepemilikan(CurrLoc1,_)),
                                                           assertz(kepemilikan(CurrLoc1, X)),
                                                           write('Congratulations!! The Property is now yours\n'),
                                                           propertyMechanism
                                            );!
                                        )
                                    )
                                );
            write('Can\'t take over property');!
        )
    )
    .
