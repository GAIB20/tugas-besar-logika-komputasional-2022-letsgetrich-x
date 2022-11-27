
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

    rand(A),
    write('Dice 1 : '),
    write(A), nl,

    rand(B),
    write('Dice 2 : '),
    write(B), nl,nl,nl,

    (
        (
            A == B, 
            write('Double!'), nl,
            Forward is A+B,
            ((in_jail(Player), hasPickedJailMechanism) -> escapeJail, move(Player, Forward), switchPlayer,fail;
            in_jail(Player) -> switchPlayer;
            !), 
            incPlayerDouble,
            move(Player, Forward),
            map,
            !
        );

        (
            A \== B, 
            Forward is A+B,
            move(Player, Forward),
            switchPlayer,
            retractall(playerDouble(Player,_)),
            asserta(playerDouble(Player,0))
        )
    ).
    

/* increment player double, check if need to go to jail */
incPlayerDouble :-
    currentPlayer(PlayerDouble),
    playerName(PlayerDouble,_),
    playerDouble(PlayerDouble,DoubleNow),
    NewPlayerDouble is DoubleNow + 1,
    retractall(playerDouble(PlayerDouble,DoubleNow)),
    asserta(playerDouble(PlayerDouble, NewPlayerDouble)),
    !.
  
/* switch player */
switchPlayer :-
    currentPlayer(X),
    playerName(X, PlayerName),

    (firstTurn -> 
        (   nl,write(PlayerName), 
            write('\'s turn is over...'),nl,
            write('Press any key to continue'),nl,
            read(_)
        );!
    ),
    retractall(firstTurn),

    retractall(currentPlayer(_)),
    (
        X == 1 -> asserta(currentPlayer(2));
        asserta(currentPlayer(1))
    ),
    currentPlayer(NewPlayer),
    playerName(NewPlayer,NewPlayerName),

    map,
    nl,
    write('It\'s '),
    write(NewPlayerName),
    write('\'s turn'),nl,
    jailMechanism, 
    
    write('Type throwDice to advance'),nl,

    !.

otherPlayer(Other) :-
    currentPlayer(X),
    X == 1 -> Other is 2;
    Other is 1.


/**

Tambahin line 33

if sin jail , switch player

**/



