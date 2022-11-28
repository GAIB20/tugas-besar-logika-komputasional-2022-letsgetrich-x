:- dynamic(biaya_sewa/2).
:- dynamic(biaya_akuisisi/2).
:- dynamic(tingkatan_property/2).

/* is Property */
is_property(a1).
is_property(a2).
is_property(a3).
is_property(b1).
is_property(b2).
is_property(b3).
is_property(c1).
is_property(c2).
is_property(c3).
is_property(d1).
is_property(d2).
is_property(d3).
is_property(e1).
is_property(e2).
is_property(e3).
is_property(f1).
is_property(f2).
is_property(f3).
is_property(g1).
is_property(g2).
is_property(g3).
is_property(h1).
is_property(h2).

/* NAMA LOKASI */
nama_lokasi(go, 'GO' ).
nama_lokasi(a1, 'Ottery St Catchpole' ).
nama_lokasi(a2, 'Godric\'s Hollow').
nama_lokasi(a3, 'Little Hangleton').
nama_lokasi(b1, 'Little Whinging').
nama_lokasi(b2, 'Malfoy Manor').
nama_lokasi(b3, 'Grimmauld Place').
nama_lokasi(jl, 'Azkaban').
nama_lokasi(c1, 'Shell Cottage').
nama_lokasi(c2, 'Beauxbatons').
nama_lokasi(c3, 'Durmstrang').
nama_lokasi(tx, 'Tax').
nama_lokasi(d1, 'Hogwarts School of Witchcraft and Wizardry').
nama_lokasi(d2, 'Wizarding Academy of Dramatics Arts').
nama_lokasi(d3, 'Diagon Alley').
nama_lokasi(fp, 'Free Park').
nama_lokasi(e1, 'Ministry of Magic').
nama_lokasi(e2, 'Platform Nine and Three Quarters').
nama_lokasi(e3, 'St. Mungo\'s').
nama_lokasi(f1, 'Knockturn Alley').
nama_lokasi(f2, 'Nurmengard').
nama_lokasi(f3, 'Spinner\'s End').
nama_lokasi(wt, 'Apparate').
nama_lokasi(g1, 'Forbidden Forest').
nama_lokasi(g2, 'Gringgots').
nama_lokasi(g3, 'Hogsmeade').
nama_lokasi(cc, 'Chance Card').
nama_lokasi(h1, 'Daily Prophet').
nama_lokasi(h2, 'Forest of Dean').
nama_lokasi(wc, 'TriWizard Tournament').
nama_lokasi(cf, 'Galleon Flip Mini-Games').

/* DESKRIPSI LOKASI */
desc_lokasi(a1, 'The Hometown of Great Wizard Families, The Weasleys, The Lovegoods, and The Diggorys' ).
desc_lokasi(a2, 'The Hometown of Lily dan James Potter').
desc_lokasi(a3, 'The Village of The Dark Lord, Voldemort').
desc_lokasi(b1, 'A Muggle City, The Hometown of The Dursleys').
desc_lokasi(b2, 'Where The Malfoys Resort').
desc_lokasi(b3, 'The Black Family\'s Residence.').
desc_lokasi(jl, 'The Fortress That Jails The Criminals of The Wizarding World \n                       Here lives the Dementors that drained people of all happiness and leave them with their worst memories.\n                       Players will be jailed in Azkaban if they draw the "Go To Azakaban" card, \n                       or.. they get three doubles three times in a row. \n \nThere are 4 mechanisms to get out of Azkaban alive : \n     1. If the jailed player roll a double before passing three turns,\n       they will escape Azkaban at once.\n     2. If the player has passed three turns, they can escape. \n     3. If the player has Escape From Azkaban chance card, on the next turn, \n       they can activate it and escape. \n     4. Players can pay their way out off Azkaban on their next turn \n       and throw dice. \n').
desc_lokasi(c1, 'The Home of Bill Weasley where The Golden Trio hid').
desc_lokasi(c2, 'France Wizarding School').
desc_lokasi(c3, 'Scandinavian Wizarding School').
desc_lokasi(tx, 'Tax. You have to pay your Tax to the Ministry of Magic!').
desc_lokasi(d1, 'Scottish Wizarding School').
desc_lokasi(d2, 'Wizarding School for Threatrical or Performance Career').
desc_lokasi(d3, 'The Economic Hub of The Wizarding World').
desc_lokasi(fp, 'Free Park').
desc_lokasi(e1, 'The Government of The Wizarding World').
desc_lokasi(e2, 'A Magically Concealed Train Platform').
desc_lokasi(e3, 'Hospital for Magical Maladies and Injuries').
desc_lokasi(f1, 'The Dark Side of Diagon Alley').
desc_lokasi(f2, 'Where Gellert Grindelwart Jails His Captives').
desc_lokasi(f3, 'Muggle Street, Home to Severus Snape').
desc_lokasi(wt, 'Apparate: Magically Travel to A Place of Your Choice').
desc_lokasi(g1, 'Forbidden Forest').
desc_lokasi(g2, 'The Bank of The Wizarding World').
desc_lokasi(g3, 'All-Wizarding Village in Britain').
desc_lokasi(cc, 'Chance Card').
desc_lokasi(h1, 'The Office to The Wizarding Newspaper in Britain').
desc_lokasi(h2, 'A Forest in England').
desc_lokasi(cf, 'Guess and Test your Luck!').
desc_lokasi(wc, 'Win in a magical contest, and double your property rent fee!').


/* Kepemilikan */
:- dynamic(kepemilikan/2).
kepemilikan(a1, 0).
kepemilikan(a2, 0).
kepemilikan(a3, 0).
kepemilikan(b1, 0).
kepemilikan(b2, 0).
kepemilikan(b3, 0).
kepemilikan(c1, 0).
kepemilikan(c2, 0).
kepemilikan(c3, 0).
kepemilikan(d1, 0).
kepemilikan(d2, 0).
kepemilikan(d3, 0).
kepemilikan(e1, 0).
kepemilikan(e2, 0).
kepemilikan(e3, 0).
kepemilikan(f1, 0).
kepemilikan(f2, 0).
kepemilikan(f3, 0).
kepemilikan(g1, 0).
kepemilikan(g2, 0).
kepemilikan(g3, 0).
kepemilikan(h1, 0).
kepemilikan(h2, 0).

checkLocationDetail(X):-
    nama_lokasi(X, Name),!,
    write('Location Name        : '),
    write(Name), nl,
    write('Description          : '),
    desc_lokasi(X, Desc),
    write(Desc), nl,
    (                    
        is_property(X) -> checkPropertyDetail(X);
        X = cc -> write('Can\'t get you Felix Felicis, but in return, You have *chances* to get one of these cards   : \n'),
                          forall(card_info(_,Y),  write(Y)), !;
        !
    ),
    !.

checkLocationDetail(X):-
    write(X),
    write(' is not a valid location, sorry! :(\n').