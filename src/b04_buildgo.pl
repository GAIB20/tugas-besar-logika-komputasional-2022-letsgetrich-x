/* Bonus 4: Buildable Go */

listUpgradeableProp([],[]) :- !.
listUpgradeableProp([Head|Tail],ListUp) :- 
    tingkatan(Head, Tingk),
    Tingk == 4, !,
    listUpgradeableProp(Tail, Result),
    ListUp = Result.
listUpgradeableProp([Head|Tail],ListUp) :- 
    tingkatan(Head, Tingk),
    Tingk \= 4, !,
    listUpgradeableProp(Tail, Result),
    ListUp = [Head|Result].


displayUpgradeableProp([],_) :- !.
displayUpgradeableProp([Head|Tail],No) :-
    write(No), write('. '),
    write(Head),
    write(' - '),
    nama_lokasi(Head, InfoLoc),
    write(InfoLoc),nl,
    No1 is No + 1,
    displayUpgradeableProp(Tail, No1).
    

buildMechanism(Loc) :- 
    hargaBeli(Loc, 1, HargaBg1Asli),
    hargaBeli(Loc, 2, HargaBg2Asli),
    hargaBeli(Loc, 3, HargaBg3Asli),
    hargaBeli(Loc, 4, HargaLm),
    write('------ Upgrade Price List ------\n'),
    write(' Small Cottage         : '), write(HargaBg1Asli),nl,
    write(' Medium Cottage        : '), write(HargaBg2Asli),nl,
    write(' Large Cottage         : '), write(HargaBg3Asli),nl,
    write(' Castle                : '), write(HargaLm),nl,nl,
    write('Choose your building upgrade:\n'),
    tingkatan(Loc, Tingk),
    (
        Tingk == 0 -> write('1. Small Cottage \n'),
                        write('2. Medium Cottage\n'),
                        write('3. Large Cottage\n');
        Tingk == 1 -> write('2. Medium Cottage\n'),
                        write('3. Large Cottage\n');
        Tingk == 2 -> write('3. Large Cottage\n');
        Tingk == 3 -> write('4. Castle\n');
        !
    ),
    tingkatan(Loc, Temp),
    read(Tingkatan),
    (
        currentPlayer(X), cashPlayer(X, Cash),
        hargaAmbil(Loc,Tingkatan, Harga),
        hargaAmbil(Loc, Temp, HargaAsli),
        HargaUpgrade is Harga - HargaAsli,
        HargaUpgrade =< Cash ->  (
                                    decCash(HargaUpgrade, X),
                                    retractall(tingkatan(Loc,_)),
                                    asserta(tingkatan(Loc,Tingkatan)),
                                    write('Congrats! Your Property have been upgraded!\n'), modifyTileInfo(Loc)
                                );
                                write('Sorry you don\'t have enough cash\n'), buildGoMechanism
    ).


buildGoMechanism:-
    currentPlayer(X),
    listPropPlayer(X, ListProp),
    length(ListProp, Length),
    (
        Length \= 0 -> nl, write('You\'ve got a chance to build your property! Do you want to use this chance?\n'),
                        write('0. Pass\n'),
                        write('1. Build\n'),
                        read(Choice),
                        (
                            Choice == 0 -> write('You\'re going to regret this ...\n'), !;
                            Choice == 1 -> listUpgradeableProp(ListProp, ListUp),
                                            length(ListUp, LengthUp),
                                            (
                                                LengthUp \= 0 -> write('Choose the location you\'re going to upgrade \n'),
                                                                displayUpgradeableProp(ListUp, 1),
                                                                write('Input the location code\n'),
                                                                read(Loc), buildMechanism(Loc), !;
                                                write('Hey, all of your property is already a castle! You can\'t build again!\n'), !
                                            )
                                            
                        );
        write('Sorry, you can\'t build anything, you don\'t have any property yet!\n')
    ).