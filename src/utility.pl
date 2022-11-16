/* insertLast */
insertLast(Insert,[Head|[]],[Head,Insert]) :- !.
insertLast(Insert,[Head|Tail],[Head|NewList]) :-
    insertLast(Insert,Tail,NewList).

/* deleteAtList, idx dimulai dari 1 */
deleteAtList(1,[Head|Tail],Tail) :- !.
deleteAtList(Idx,[Head|Tail],[Head|NewList]) :-
    NewIdx is Idx-1,
    deleteAtList(NewIdx,Tail,NewList).

