:- include('move.pl').
/* dynamic variables */
:- dynamic(playerDouble/2).

/* playerDouble(ID, state), state times double */
playerDouble(1,0).
playerDouble(2,0).

/* random number from 1 to 6 */
rand(X) :- random(1,7,X).

/* throwDice */
throwDice :-
    currentPlayer(Player),
    playerName(Player, PlayerName), 
    write('It\'s '),
    write(PlayerName), 
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
            Forward is A+B,
            move(Player, Forward),
            incPlayerDouble,
            !

        );

        (
            A \== B, 
            Forward is A+B,
            move(Player, Forward),
            switchPlayer,
            asserta(playerDouble(2,0))
            write(PlayerName),
            write(' moved '),
            write(Forward),
            write(' steps'), nl,
           
            retractall(playerDouble(Player,_)),
            asserta(playerDouble(Player,0))
        )
    ).
    

/* increment player double, check if need to go to jail */
incPlayerDouble :-
    currentPlayer(PlayerDouble),
    playerName(PlayerDouble,PlayerDoubleName),
    playerDouble(PlayerDouble,DoubleNow),
    NewPlayerDouble is DoubleNow + 1,
    retractall(playerDouble(PlayerDouble,DoubleNow)),
    asserta(playerDouble(PlayerDouble, NewPlayerDouble)),
    !.
  
/* switch player */
switchPlayer :-
    currentPlayer(X),
    (X == 1),
    retractall(currentPlayer(X)),
    asserta(currentPlayer(2)),
    !.
switchPlayer :-
    currentPlayer(X),
    (X == 2),
    retractall(currentPlayer(X)),
    asserta(currentPlayer(1)),
    !.    








