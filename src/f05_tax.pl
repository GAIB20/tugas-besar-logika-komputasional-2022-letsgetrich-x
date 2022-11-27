

/* pay tax, which is 10% of total asset value */
payTax(P) :-
    is_player(P), currentPlayer(P),
    totalAssets(P, PAsset),
    Tax is PAsset//10,

    write('Total Asset Value: '), write(PAsset), nl,
    write('Tax (10%): '), write(Tax), nl,

    \+ bankruptMechanism(Tax),
    decCash(Tax, P),
    !.
