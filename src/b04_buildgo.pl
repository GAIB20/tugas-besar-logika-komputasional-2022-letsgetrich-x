/* Bonus 4: Buildable Go */

listUpgradeableProp([],[]) :- !.
listUpgradeableProp([Head|Tail],NewList) :- 
    tingkatan(Head, Tingk),
    Tingk == 4, !,
    listUpgradeableProp(Tail, NewList).
listUpgradeableProp([Head|Tail],NewList) :- 
    tingkatan(Head, Tingk),
    Tingk \= 4, !,
    listUpgradeableProp(Tail, [Head]).

displayUpgradeableProp :- !.

buildMechanism :- !.

buildGoMechanism:-
    currentPlayer(X),
    listPropPlayer(X, ListProp),
    length(ListProp, Length),
    (
        Length \= 0 -> write("You\'ve got a chance to build your property! Do you want to use this chance?\n"),
                        write('0. Pass\n'),
                        write('1. Build\n'),
                        read(Choice),
                        (
                            Choice == 0 -> write('You\'re going to regret this ...\n');
                            Choice == 1 -> write('Choose the location you\'re going to upgrade \n')
                        )
    )