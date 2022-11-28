:-include('main.pl').
:- dynamic(chance_cards/1).

/* red chance cards */
/* kesempatan dapat kartu, semakin banyak semakin mudah didapatkan */
card_chance('Go To Azkaban', 3).
card_chance('Attack By Death Eaters', 2).
card_chance('Tax', 3).
card_chance('Improper Use', 5).
card_chance('Get Out From Azkaban', 3).
card_chance('Quidditch Game', 1).
card_chance('Knight Bus', 2). 
card_chance('Gift', 3).
card_chance('Cloak of Invisibility', 4).


card_info('Go To Azkaban', '__| |____________________________________________| |__\n(__   ____________________________________________   __)\n   | |                GO TO AZKABAN               | |\n   | |                                            | |\n   | |       You used an unforgiveable curse,     | |\n   | |          I hope you enjoy your time        | |\n   | |        with the Dementors in Azkaban..     | |\n __| |____________________________________________| |__\n(__   ____________________________________________   __)\n   | |                                            | | \n \n').
card_info('Attack By Death Eaters', ' __| |____________________________________________| |__ \n(__   ____________________________________________   __)\n   | |           ATTACK BY DEATH EATERS           | |\n   | |                                            | |\n   | |        Bellatrix Lestrange, and her        | |\n   | |   fellow Death Eaters attacked a building  | |\n   | |          Pay 5000 for the damages.         | |\n __| |____________________________________________| |__\n(__   ____________________________________________   __)\n   | |                                            | | \n').
card_info('Tax', ' __| |____________________________________________| |__ \n(__   ____________________________________________   __)\n   | |                     TAX                    | |\n   | |                                            | |\n   | |     As a good citizen of the Wizarding     | |\n   | |    World, you need to pay your taxes to    | |\n   | |           the Ministry of Magic!           | |\n __| |____________________________________________| |__\n(__   ____________________________________________   __)\n   | |                                            | | \n \n').
card_info('Improper Use',' __| |____________________________________________| |__ \n(__   ____________________________________________   __)\n   | |               IMPROPER USE                 | |\n   | |                                            | |\n   | |     You\'ve been using magic without care   | |\n   | |      and caught the attention of Muggles!  | |\n   | |           Pay 3000 as sanction.            | |\n __| |____________________________________________| |__\n(__   ____________________________________________   __)\n   | |                                            | | \n \n' ).
card_info('Get Out From Azkaban',' __| |____________________________________________| |__ \n(__   ____________________________________________   __)\n   | |             GET OUT OF JAIL                | |\n   | |                                            | |\n   | |     Use this card to get out of Azkaban    | |\n   | |      in case, *just in case* you need to   | |\n   | |             serve time there..             | |\n __| |____________________________________________| |__\n(__   ____________________________________________   __)\n   | |                                            | | \n' ).
card_info('Quidditch Game',' __| |____________________________________________| |__ \n(__   ____________________________________________   __)\n   | |               QUIDDITCH GAME               | |\n   | |                                            | |\n   | |       Any Wizard would enjoy some good     | |\n   | |     Quidditch Game, eh? Get 8000 to watch  | |\n   | |           the game of the year!            | |\n __| |____________________________________________| |__\n(__   ____________________________________________   __)\n   | |                                            | | \n \n' ).
card_info('Knight Bus',' __| |____________________________________________| |__ \n(__   ____________________________________________   __)\n   | |                  KNIGHT BUS                | |\n   | |                                            | |\n   | |       Get a chance to use Knight Bus!      | |\n   | |     Activate this card to use the knight   | |\n   | |         bus and go straight to GO          | |\n __| |____________________________________________| |__\n(__   ____________________________________________   __)\n  | |                                            | | \n \n' ).
card_info('Gift',' __| |____________________________________________| |__ \n(__   ____________________________________________   __)\n   | |                    GIFT                    | |\n   | |                                            | |\n   | |      Her name wouldn\'t be Mrs. Weasley     | |\n   | |     if she hadn\'t been so kind! You got    | |\n   | |      2000 as a gift from Mrs. Weasley!     | |\n __| |____________________________________________| |__\n(__   ____________________________________________   __)\n   | |                                            | | \n \n' ).
card_info('Cloak of Invisibility',' __| |____________________________________________| |__ \n (__   ____________________________________________   __)\n   | |           CLOAK OF INVISIBILITY            | |\n   | |                                            | |\n   | |      Anyone who wears this cloak would     | |\n   | |    be *Invisible*. Use this on people\'s    | |\n   | |          property and not pay rent~        | |\n __| |____________________________________________| |__\n(__   ____________________________________________   __)\n   | |                                            | | \n \n').
displayCards([]):-!.
displayCards([Head|Tail]):-
    card_info(Head, Info),
    write(Info),
    displayCards(Tail),
    !.

/*bebas biaya sewa*/
cardMechanism('Cloak of Invisibility'):-
    currentPlayer(Player),
    cardPlayer(Player, Cards),
    retractall(cardPlayer(Player, _)),
    insertLast('Cloak of Invisibility', Cards, NewCards),
    asserta(cardPlayer(Player, NewCards)).

/* kurangin duit 5000 */
cardMechanism('Attack By Death Eaters'):-
    currentPlayer(X),
    decCash(5000, X).

/* pindahin ke pajak terDEKAT*/
cardMechanism('Tax'):-
    currentPlayer(X),
    locPlayer(X, PlayerLoc),
    findall(Loc, tile(Loc, tx), ListTax),
    closestTax(PlayerLoc, ListTax, ClosestTax),
    retractall(locPlayer(X,_)),
    asserta(locPlayer(X, ClosestTax)),
    write('You have been moved to Tax!'), nl,
    payTax(X),
    !.

/* kurangin duit 3000 */
cardMechanism('Improper Use'):-
    currentPlayer(X),
    decCash(3000, X),
    !.

/* taro ke deck card player */
cardMechanism('Get Out From Azkaban'):-
    currentPlayer(Player),
    cardPlayer(Player, Cards),
    retractall(cardPlayer(Player, _)),
    insertLast('Get Out From Azkaban', Cards, NewCards),
    asserta(cardPlayer(Player, NewCards)),
    !.

/* tambahin duit 8000 */
cardMechanism('Quidditch Game'):-
    currentPlayer(X),
    incCash(8000, X),
    !.

/* advance to go */
cardMechanism('Knight Bus'):-
    currentPlayer(X),
    retractall(locPlayer(X,_)),
    incCash(3000, X),
    tile(Go, go),
    asserta(locPlayer(X, Go)),
    buildGoMechanism,
    !.

/* tambahin duit 2000 */
cardMechanism('Gift'):-
    currentPlayer(X),
    incCash(2000, X),
    !.

/* jeblosss */
cardMechanism('Go To Azkaban'):-
    currentPlayer(X),
    retractall(playerDouble(X,_)),
    asserta(playerDouble(X,3)),
    jailMechanism,
    !.

closestTax(_CurrLoc, [Head|[]], ClosestTax):-
    ClosestTax is Head.

closestTax(CurrLoc, [Head|Tail], ClosestTax):-
    closestTax(CurrLoc, Tail, CurrClosestTax),
    CurrDist is abs(CurrLoc - Head),
    (
        CurrDist < abs(CurrLoc - CurrClosestTax) -> ClosestTax is Head;
        ClosestTax is CurrClosestTax
    ),
    !.

drawChanceCard:-
    write('Welcome to Chance Card! Testing your luck without Felix Felicis eh?\n'),
    chance_cards(X),
    length(X, Length),
    random(1, Length, Rand),
    getValAtIdx(X, Rand, Card),
    write('You drew a card!\n'),
    card_info(Card, Info),
    write(Info),
    cardMechanism(Card),
    !.


insertCardToList(X, N):-
    chance_cards(TempList),
    insertNTimes(X, TempList, List, N),
    retractall(chance_cards(_)),
    asserta(chance_cards(List)).


initChanceCard:-
    retractall(chance_cards(_)),
    asserta(chance_cards([])),
    forall(card_chance(X, N), insertCardToList(X, N)).
