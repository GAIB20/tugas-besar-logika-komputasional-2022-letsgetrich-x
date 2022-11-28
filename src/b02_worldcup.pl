:-dynamic(isWorldCup/1).
:-dynamic(turnsAfterWorldCup/1).

turnsAfterWorldCup(0).

worldCupMechanism:-
    retractall(isWorldCup(_)),
    currentPlayer(X),
    write('Congratulations. You have been granted a chance to become Triwizard Tournament\'s host.'),nl,
    write('Triwizard Tournament is the largest magical contest held between the three largest wizarding schools of Europe'),nl,nl,
    listPropPlayer(X,ListProp),
    length(ListProp, ListPropLength),
    (
        ListPropLength \= 0 -> write('\nList of your property: \n'),
                              displayProp(ListProp, 1), nl,
                              write('Pick a property to become the host of Triwizard Tournament: '),
                              read(Choice),nl,
                              getItemAtIdx(ListProp ,Choice, ChosenHost),
                              asserta(isWorldCup(ChosenHost)),
                              nama_lokasi(ChosenHost, HostName),
                              write(HostName),
                              write(' is now hosting Triwizard Tournament~!'),nl;
        write('You don\'t have any property to host Triwizard Tournament. Sorry!')
    ),!.

checkWorldCup:-
    isWorldCup(Host),
    turnsAfterWorldCup(3),
    retractall(isWorldCup(_)),
    retractall(turnsAfterWorldCup(_)),
    asserta(turnsAfterWorldCup(0)),
    write('The Triwizard Tournament hosted in '),
    nama_lokasi(Host, HostName),
    write(HostName),
    write(' is now over! We hope you had a great time~'),nl,
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
