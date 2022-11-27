/* insertLast */
insertLast(Insert,[],[Insert]) :- !.
insertLast(Insert,[Head|Tail],[Head|NewList]) :-
    insertLast(Insert,Tail,NewList).

/* deleteAtList, idx dimulai dari 1 */
deleteAtList(1,[_Head|Tail],Tail) :- !.
deleteAtList(Idx,[Head|Tail],[Head|NewList]) :-
    NewIdx is Idx-1,
    deleteAtList(NewIdx,Tail,NewList).

/* getItemAtIdx */
getItemAtIdx([Head|_], 1, Head) :- !.
getItemAtIdx([_Head|Tail], Index, Item) :-
    NewIndex is Index - 1,
    getItemAtIdx(Tail, NewIndex, Item).

/* displaylist */
displayList([]):-!.
displayList([Head|Tail]):-
    write(Head),
    displayList(Tail).

/* insertNTimes */
insertNTimes(_Val, List, List, 0) :- !.
insertNTimes(Val, List, Newlist, N) :-
    insertLast(Val, List, Inserted),
    N1 is N-1,
    insertNTimes(Val, Inserted, Newlist, N1).

/* getValAtIdx */
getValAtIdx([H|_], 1, H):-!.
getValAtIdx([_|T], Idx, Val1):-
    Idx>1,
    Idx1 is Idx-1,
    getValAtIdx(T,Idx1,Val1).

/* isIn */
isIn(_X,[],0) :- !.
isIn(X,[X|_Tail],1) :- !.
isIn(X,[_Head|Tail],Ans) :-
    isIn(X,Tail,Ans).

/* subset */
subset(List1,List2,Ans) :-
    subsetRec(List1,List2,AnsRec),
    length(List1, LenList1),
    AnsRec == LenList1 -> Ans is 1;
    Ans is 0.

subsetRec([], _List, 0):- !.
subsetRec([Head|Tail], List, Ans):-
    isIn(Head,List,In),
    subsetRec(Tail,List,NewAns),
    Ans is NewAns + In.

/* getIndex */
getIndex([], _X, 0):-!.
getIndex([H|_], H, Index):-
    Index is 1, 
    !.
getIndex([_H|T], X, Index):-
    getIndex(T,X,Index1),
    Index is 1+Index1.

