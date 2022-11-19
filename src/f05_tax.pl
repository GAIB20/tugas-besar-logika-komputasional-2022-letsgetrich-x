

/* pay tax, which is 10% of total asset value */
payTax(P) :-
    is_player(P), currentPlayer(P),
    totalAssets(PAsset),
    Tax is PAsset//10,

    write('Total Asset Value: '), write(PAsset), nl,
    write('Tax (10%): '), write(Tax), nl,

    bankruptMechanism(Tax),!,

    decCash(Tax),
    write(Tax), write(' has been withdrawn from your account.'), nl, !.
