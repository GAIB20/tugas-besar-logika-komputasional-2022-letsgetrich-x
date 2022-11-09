/* */
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
            
            incPlayerDouble,
            !

        );

        (
            A \== B, 
            switchPlayer,
            Forward is A+B,
            write(PlayerName),
            write(' moved '),
            write(Forward),
            write(' steps'), nl,
           
            retractall(playerDouble(1,_)),
            asserta(playerDouble(1,0)),
            retractall(playerDouble(2,_)),
            asserta(playerDouble(2,0))
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
    (
        (
            NewPlayerDouble==3,
            retractall(inJail(PlayerDouble,_)),
            asserta(inJail(PlayerDouble,1)),
            write('Welcome to jail '), 
            write(PlayerDoubleName),nl, 
            retractall(playerDouble(PlayerDouble,_)),
            asserta(playerDouble(PlayerDouble,0))
        ); !
    ),
    !.
  








