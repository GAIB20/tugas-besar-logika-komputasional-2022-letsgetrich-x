/* */
:- dynamic(player1same/1).
:- dynamic(player2same/1).

player1same(0).
player2same(0).

rand(X) :- random(1,6,X).

throwDice :-
    currentPlayer(X),
    write('It\'s '),
    write(X), 
    write(' turns'), nl,

    rand(A),
    write('Dice 1 : '),
    write(A), nl,

    rand(B),
    write('Dice 2 : '),
    write(B), nl,

    (
        (
            A == B, 
            write('Double!'), nl,
            playerId(IdDouble),
            (
                (
                    (IdDouble == 1), 
                    player1same(NPlayer1), 
                    IncNPlayer1 is NPlayer1 + 1,
                    retractall(player1same(NPlayer1)),
                    asserta(player1same(IncNPlayer1)),
                    (
                        (
                            (IncNPlayer1 == 3),
                            retractall(isOneInJail(_)),
                            asserta(isOneInJail(1)),
                            write('Welcome to jail '),
                            write(X),nl,
                            retractall(player1same(_)),
                            asserta(player1same(0))
                        );!
                    )
                );
                (
                    (IdDouble == 2),
                    player2same(NPlayer2), 
                    IncNPlayer2 is NPlayer2+1, 
                    retractall(player2same(NPlayer2)),
                    asserta(player2same(IncNPlayer2)),
                    (
                        (
                            (IncNPlayer2 == 3),
                            retractall(isTwoInJail(_)),
                            asserta(isTwoInJail(1)),
                            write('Welcome to jail '),
                            write(X),nl,
                            retractall(player2same(_)),
                            asserta(player2same(0)),
                            !
                        );!
                    )
                )
            )
        );

        (
            A \== B, 
            switchPlayer,
            Forward is A+B,
            write(X),
            write(' moved '),
            write(Forward),
            write(' steps'), nl,
           
            retractall(player1same(_)),
            asserta(player1same(0)),
            retractall(player2same(_)),
            asserta(player2same(0))
        )
    ).
    









