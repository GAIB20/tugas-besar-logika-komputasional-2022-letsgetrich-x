/* Bonus 4: Buildable Go */

listUpgradeableProp([],[]) :- !.
listUpgradeableProp([Head|Tail],ListUp) :- 
    tingkatan(Head, Tingk),
    Tingk == 4, !,
    listUpgradeableProp(Tail, ListUp).
listUpgradeableProp([Head|Tail],ListUp) :- 
    tingkatan(Head, Tingk),
    Tingk \= 4, !,
    ListUp1 is ListUp,
    insertLast(Head, ListUp1, Result),
    listUpgradeableProp(Tail, Result),
    ListUp is Result.

displayUpgradeableProp([],_) :- !.
displayUpgradeableProp([Head|Tail],No) :-
    write(No), write('. '),
    write(Head),
    write(' - '),
    nama_lokasi(Head, InfoLoc),
    write(InfoLoc),
    No1 is No + 1,
    displayUpgradeableProp(Tail, No1).
    

buildMechanism(Loc) :- 
    write('Good choice, choose your building upgrade:\n'),
    write('1. Small Cottage \n'),
    write('2. Medium Cottage\n'),
    write('3. Large Cottage\n'),
    write('4. Castle\n'),
    read(Tingkatan),
    (
        buy(Loc,Tingkatan)
    ).


buildGoMechanism:-
    currentPlayer(X),
    listPropPlayer(X, ListProp),
    length(ListProp, Length),
    (
        Length \= 0 -> write('You\'ve got a chance to build your property! Do you want to use this chance?\n'),
                        write('0. Pass\n'),
                        write('1. Build\n'),
                        read(Choice),
                        (
                            Choice == 0 -> write('You\'re going to regret this ...\n'), !;
                            Choice == 1 -> write('Choose the location you\'re going to upgrade \n'),
                                            listPropPlayer(X, ListProp),
                                            listUpgradeableProp(ListProp, ListUp),
                                            retractall(tempNo),
                                            asserta(tempNo(0)),
                                            displayUpgradeableProp(ListUp, 1),
                                            read(Loc), buildMechanism(Loc), !
                        )
    ).