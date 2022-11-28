:-dynamic(isWorldCup/1).
:-dynamic(turnsAfterWorldCup/1).

turnsAfterWorldCup(0).

worldCupMechanism:-
    retractall(isWorldCup(_)),
    currentPlayer(X),
    write('Congratulations. You have been granted a chance to become Triwizard Tournament\'s host.'),nl,
    write('Triwizard Tournament is the largest magical contest held between the three largest wizarding schools of Europe'),nl,nl,
    listPropPlayer(X,ListProp),
    write('\nList of your property: \n'),
    displayProp(ListProp,1), nl,
    write('Pick a property to become the host of Triwizard Tournament: '),
    read(Choice),nl,
    getItemAtIdx(ListProp ,Choice, ChosenHost),
    /* naikin harga jadi 4x*/

    forall(hargaBeli(ChosenHost,Type,_), 
        (
            hargaBeli(ChosenHost,Type,X),
            NewX is X * 4,
            retractall(hargaBeli(ChosenHost,Type,X)),
            asserta(hargaBeli(ChosenHost,Type,NewX))
        )
    ),
    write(ChosenHost),
    write(' is now hosting World Cup! The property rent price is now quadrupled~~'),nl,
    asserta(isWorldCup(ChosenHost)).

checkWorldCup:-
    isWorldCup(Host),
    turnsAfterWorldCup(3),
    retractall(isWorldCup(_)),
    retractall(turnsAfterWorldCup(_)),
    forall(hargaBeli(ChosenHost,Type,_), 
        (
            hargaBeli(ChosenHost,Type,X),
            NewX is X // 4,
            retractall(hargaBeli(ChosenHost,Type,X)),
            asserta(hargaBeli(ChosenHost,Type,NewX))
        )
    ),
    !.

checkWorldCup:-
    isWorldCup(_),
    turnsAfterWorldCup(X),
    retractall(turnsAfterWorldCup(_)),
    X1 is X+1,
    asserta(turnsAfterWorldCup(X1)),
    !.

checkWorldCup:-
    !.
