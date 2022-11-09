/* */
:- dynamic(playerDouble/2).

/* playerDouble(ID, state), state times double */
playerDouble(1,0).
playerDouble(2,0).

/* random number from 1 to 6 */
rand(X) :- random(1,7,X).

/* increment player double, check if need to go to jail */
incPlayerDouble(Player) :-
    playerName(Player,PlayerName),
    playerDouble(Player, NDouble),
    IncPlayerDouble is NDouble + 1,
    retractall(playerDouble(Player,_)),
    asserta(playerDouble(Player, IncPlayerDouble)),
    (
        (
            IncPlayerDouble==3,
            retractall(inJail(Player,_)),
            asserta(inJail(Player,1)),
            write('Welcome to jail '),
            write(PlayerName),nl,
            retractall(playerDouble(Player,_)),
            asserta(playerDouble(Player,0))
        ); !
    ).
  

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
            
            incPlayerDouble(Player)

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
            asserta(player1same(1,0)),
            retractall(playerDouble(2,_)),
            asserta(playerDouble(2,_))
        )
    ).
    









