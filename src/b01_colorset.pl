/* Bonus 1 : Colorset */

/* dynamic predicate */
:-dynamic(list_colorset/1).
:-dynamic(color_in_colorset/1).
:-dynamic(colorsets/1).
:-dynamic(temp_list/1).

/* initialize dynamic predicates */
list_colorset([]).
colorsets([]).
color_in_colorset([]).
temp_list([]).

/* deklarasi colorset */
colorset(a, [a1,a2,a3]).
colorset(b, [b1,b2,b3]).
colorset(c, [c1,c2,c3]).
colorset(d, [d1,d2,d3]).
colorset(e, [e1,e2,e3]).
colorset(f, [f1,f2,f3]).
colorset(g, [g1,g2,g3]).
colorset(h, [h1,h2]).

color(a,a1).
color(a,a2).
color(a,a3).
color(b,b1).
color(b,b2).
color(b,b3).
color(c,c1).
color(c,c2).
color(c,c3).
color(d,d1).
color(d,d2).
color(d,d3).
color(e,e1).
color(e,e2).
color(e,e3).
color(f,f1).
color(f,f2).
color(f,f3).
color(g,g1).
color(g,g2).
color(g,g3).
color(h,h1).
color(h,h2).

checkColorset :-
    listPropPlayer(1,PropPlayer1),
    listPropPlayer(2,PropPlayer2),
    /* reset colorsets */
    retractall(colorsets(_)),
    asserta(colorsets([a,b,c,d,e,f,g,h])),

    /* loop for every colorsets */
    repeat, 
        /* Color to process */
        colorsets([Color|TailColorsets]),

        /* List of Color */
        colorset(Color, ListColorsetColor),
        list_colorset(ListColorset),

        subset(ListColorsetColor, PropPlayer1, Verdict1),
        subset(ListColorsetColor, PropPlayer2, Verdict2),

        isIn(Color, ListColorset, IsInList),

        /* if ListColorsetColor subset of PropPlayer */
        (((Verdict1 == 1) ; (Verdict2 == 1))-> 
        (
            /* if Color not in ListColorset */
            IsInList == 0 -> (
                retractall(list_colorset(_)),
                insertLast(Color, ListColorset, NewListColorsetTrue),
                assertz(list_colorset(NewListColorsetTrue)),
                /*upgradePrice(Color),*/
                updateListOfColor,
                write('\nColorset '),
                write(Color),
                write(' price has been upgraded'),nl
            );write('')
        ); 
        /* else */
        (
            /* if Color in List Colorset */
            IsInList == 1 -> (
                retractall(list_colorset(_)),
                getIndex(ListColorset, Color, Index),
                Index \= 0 -> (
                    deleteAtList(Index, ListColorset, NewListColorsetFalse),
                    assertz(list_colorset(NewListColorsetFalse)),
                    /*downgradePrice(Color),*/
                    updateListOfColor,
                    write('\nColorset '),
                    write(Color),
                    write(' price has been downgraded'),nl
                )
                
            );write('')
        )),

        retractall(colorsets(_)),
        asserta(colorsets(TailColorsets)),

    TailColorsets == [],!.
    
upgradePrice(Colorset) :- 
    colorset(Colorset, ListColorsetColor),
    retractall(temp_list(_)),
    asserta(temp_list(ListColorsetColor)),
    
    repeat,
        temp_list([Head|Tail]),

        forall(hargaBeli(Head,Type,_), 
            (
                hargaBeli(Head,Type,X),
                NewX is X * 2,
                retractall(hargaBeli(Head,Type,X)),
                asserta(hargaBeli(Head,Type,NewX))
            )
        ),

        retractall(temp_list(_)),
        asserta(temp_list(Tail)),

    Tail == [],!.

downgradePrice(Colorset) :- 
    colorset(Colorset, ListColorsetColor),
    retractall(temp_list(_)),
    asserta(temp_list(ListColorsetColor)),
    
    repeat,
        temp_list([Head|Tail]),

        forall(hargaBeli(Head,Type,_), 
            (
                hargaBeli(Head,Type,X),
                NewX is X // 2,
                retractall(hargaBeli(Head,Type,X)),
                asserta(hargaBeli(Head,Type,NewX))
            )
        ),

        retractall(temp_list(_)),
        asserta(temp_list(Tail)),

    Tail == [],!.

updateListColor([]) :- !.
updateListColor([Head|Tail]) :-
    colorset(Head,ListColorset),
    color_in_colorset(ColorInColorset),
    retractall(color_in_colorset(_)),
    append(ListColorset,ColorInColorset,NewList),
    asserta(color_in_colorset(NewList)),
    updateListColor(Tail).

updateListOfColor :-
    list_colorset(ListColor),
    retractall(color_in_colorset(_)),
    asserta(color_in_colorset([])),
    updateListColor(ListColor).

/*
list_colorset(ListColor),
retractall(color_in_colorset(_)),
asserta(color_in_colorset([])),
updateListColor(ListColor),
*/