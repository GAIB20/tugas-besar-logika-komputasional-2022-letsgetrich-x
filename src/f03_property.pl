:-include('f02_location.pl').
/* hargaBeliProp(loc, jenis, hargaBeli)*/
/*
    tanah = tanah
    bg1 = bangunan 1
    bg2 = bangunan 2
    bg3 = bangunan 3
    lm = landmark
*/
hargaBeli(a1, tanah, 200).
hargaBeli(a1, bg1, 1000).
hargaBeli(a1, bg2, 2000).
hargaBeli(a1, bg3, 3000).
hargaBeli(a1, lm, 3000).
hargaBeli(a2, tanah, 150).
hargaBeli(a2, bg1, 1050).
hargaBeli(a2, bg2, 2000).
hargaBeli(a2, bg3, 3000).
hargaBeli(a2, lm, 2950).
hargaBeli(a3, tanah, 100).
hargaBeli(a3, bg1, 1000).
hargaBeli(a3, bg2, 2100).
hargaBeli(a3, bg3, 3000).
hargaBeli(a3, lm, 2900).

hargaBeli(b1, tanah, 300).
hargaBeli(b1, bg1, 1200).
hargaBeli(b1, bg2, 2200).
hargaBeli(b1, bg3, 3200).
hargaBeli(b1, lm, 3200).
hargaBeli(b2, tanah, 300).
hargaBeli(b2, bg1, 1250).
hargaBeli(b2, bg2, 2100).
hargaBeli(b2, bg3, 3300).
hargaBeli(b2, lm, 3200).
hargaBeli(b3, tanah, 350).
hargaBeli(b3, bg1, 1200).
hargaBeli(b3, bg2, 2200).
hargaBeli(b3, bg3, 3200).
hargaBeli(b3, lm, 3200).

hargaBeli(c1, tanah, 400).
hargaBeli(c1, bg1, 1500).
hargaBeli(c1, bg2, 2500).
hargaBeli(c1, bg3, 3200).
hargaBeli(c1, lm, 3500).
hargaBeli(c2, tanah, 400).
hargaBeli(c2, bg1, 1450).
hargaBeli(c2, bg2, 2100).
hargaBeli(c2, bg3, 3300).
hargaBeli(c2, lm, 3500).
hargaBeli(c3, tanah, 450).
hargaBeli(c3, bg1, 1400).
hargaBeli(c3, bg2, 2500).
hargaBeli(c3, bg3, 3600).
hargaBeli(c3, lm, 4000).

hargaBeli(d1, tanah, 450).
hargaBeli(d1, bg1, 1600).
hargaBeli(d1, bg2, 2600).
hargaBeli(d1, bg3, 3000).
hargaBeli(d1, lm, 3600).
hargaBeli(d2, tanah, 500).
hargaBeli(d2, bg1, 1650).
hargaBeli(d2, bg2, 2200).
hargaBeli(d2, bg3, 3000).
hargaBeli(d2, lm, 3700).
hargaBeli(d3, tanah, 400).
hargaBeli(d3, bg1, 1600).
hargaBeli(d3, bg2, 2400).
hargaBeli(d3, bg3, 3800).
hargaBeli(d3, lm, 4000).

hargaBeli(e1, tanah, 450).
hargaBeli(e1, bg1, 1650).
hargaBeli(e1, bg2, 2700).
hargaBeli(e1, bg3, 3400).
hargaBeli(e1, lm, 4000).
hargaBeli(e2, tanah, 500).
hargaBeli(e2, bg1, 1700).
hargaBeli(e2, bg2, 2600).
hargaBeli(e2, bg3, 3000).
hargaBeli(e2, lm, 3700).
hargaBeli(e3, tanah, 450).
hargaBeli(e3, bg1, 1800).
hargaBeli(e3, bg2, 2500).
hargaBeli(e3, bg3, 4000).
hargaBeli(e3, lm, 4200).

hargaBeli(f1, tanah, 550).
hargaBeli(f1, bg1, 2000).
hargaBeli(f1, bg2, 2900).
hargaBeli(f1, bg3, 3700).
hargaBeli(f1, lm, 4000).
hargaBeli(f2, tanah, 550).
hargaBeli(f2, bg1, 1900).
hargaBeli(f2, bg2, 2100).
hargaBeli(f2, bg3, 3300).
hargaBeli(f2, lm, 4500).
hargaBeli(f3, tanah, 450).
hargaBeli(f3, bg1, 1400).
hargaBeli(f3, bg2, 2500).
hargaBeli(f3, bg3, 3600).
hargaBeli(f3, lm, 4000).

hargaBeli(g1, tanah, 700).
hargaBeli(g1, bg1, 2100).
hargaBeli(g1, bg2, 2700).
hargaBeli(g1, bg3, 4000).
hargaBeli(g1, lm, 5000).
hargaBeli(g2, tanah, 750).
hargaBeli(g2, bg1, 2000).
hargaBeli(g2, bg2, 2300).
hargaBeli(g2, bg3, 3800).
hargaBeli(g2, lm, 4500).
hargaBeli(g3, tanah, 750).
hargaBeli(g3, bg1, 2400).
hargaBeli(g3, bg2, 2500).
hargaBeli(g3, bg3, 3600).
hargaBeli(g3, lm, 4000).

hargaBeli(h1, tanah, 800).
hargaBeli(h1, bg1, 3000).
hargaBeli(h1, bg2, 3500).
hargaBeli(h1, bg3, 4000).
hargaBeli(h1, lm, 5500).
hargaBeli(h2, tanah, 800).
hargaBeli(h2, bg1, 2900).
hargaBeli(h2, bg2, 3600).
hargaBeli(h2, bg3, 3900).
hargaBeli(h2, lm, 4500).
hargaBeli(h3, tanah, 850).
hargaBeli(h3, bg1, 3000).
hargaBeli(h3, bg2, 3500).
hargaBeli(h3, bg3, 4600).
hargaBeli(h3, lm, 6000).

/*hargaSewa(loc, status lokasi, harga)*/
hargaSewa(_Loc, _Status, Harga):- 
    _Status = tanah,
    hargaBeli(_Loc, _Status, X),
    Harga is X//2.
hargaSewa(_Loc, _Status, Harga):- 
    _Status = bg1,
    hargaBeli(_Loc, tanah, X),
    hargaBeli(_Loc, bg1, X1),
    Harga is (X+X1)//2.
hargaSewa(_Loc, _Status, Harga):- 
    _Status = bg2,
    hargaBeli(_Loc, tanah, X),
    hargaBeli(_Loc, bg1, X1),
    hargaBeli(_Loc, bg2, X2),
    Harga is (X+X1+X2)//2.
hargaSewa(_Loc, _Status, Harga):- 
    _Status = bg3,
    hargaBeli(_Loc, tanah, X),
    hargaBeli(_Loc, bg1, X1),
    hargaBeli(_Loc, bg2, X2),
    hargaBeli(_Loc, _Status, X3),
    Harga is (X+X1+X2+X3)//2.
hargaSewa(_Loc, _Status, Harga):- 
    _Status = lm,
    hargaBeli(_Loc, tanah, X),
    hargaBeli(_Loc, bg1, X1),
    hargaBeli(_Loc, bg2, X2),
    hargaBeli(_Loc, bg3, X3),
    hargaBeli(_Loc, _Status, X4),
    Harga is (X+X1+X2+X3+X4)//2.

/*Status Kepemilikan*/
/*status(loc, kepemilikan)*/

/*Harga akuisisi/ambil alih = harga total beli*/
/*hargaAmbil(loc, status lokasi, harga)*/
hargaAmbil(_Loc, _Status, Harga):- 
    _Status = tanah,
    hargaBeli(_Loc, _Status, X),
    Harga is X.
hargaAmbil(_Loc, _Status, Harga):- 
    _Status = bg1,
    hargaBeli(_Loc, tanah, X),
    hargaBeli(_Loc, bg1, X1),
    Harga is X+X1.
hargaAmbil(_Loc, _Status, Harga):- 
    _Status = bg2,
    hargaBeli(_Loc, tanah, X),
    hargaBeli(_Loc, bg1, X1),
    hargaBeli(_Loc, bg2, X2),
    Harga is X+X1+X2.
hargaAmbil(_Loc, _Status, Harga):- 
    _Status = bg3,
    hargaBeli(_Loc, tanah, X),
    hargaBeli(_Loc, bg1, X1),
    hargaBeli(_Loc, bg2, X2),
    hargaBeli(_Loc, _Status, X3),
    Harga is X+X1+X2+X3.


/*checkPropertyDetail(Loc)*/
checkPropertyDetail(X):-
    nama_lokasi(X, Name),!,
    write('Nama Lokasi               : '),
    write(Name), nl,
    write('Deskripsi                 : '),
    desc_lokasi(X, Desc),
    write(Desc), nl,
    (
        is_property(X) -> hargaBeli(X, tanah, HargaTanah), 
                          hargaBeli(X, bg1, HargaBg1),
                          hargaBeli(X, bg2, HargaBg2),
                          hargaBeli(X, bg3, HargaBg3),
                          hargaBeli(X, lm, HargaLm),
                          write('Harga Tanah               : '), write(HargaTanah),nl,
                          write('Harga Bangunan 1          : '), write(HargaBg1),nl,
                          write('Harga Bangunan 2          : '), write(HargaBg2),nl,
                          write('Harga Bangunan 3          : '), write(HargaBg3),nl,
                          write('Harga Landmark            : '), write(HargaLm),nl,
                          nl,
                          hargaSewa(X, tanah, HargaTanah1),
                          hargaSewa(X, bg1, HargaBg11),
                          hargaSewa(X, bg2, HargaBg21),
                          hargaSewa(X, bg3, HargaBg31),
                          hargaSewa(X, lm, HargaLm1),
                          write('Biaya Sewa Tanah          : '), write(HargaTanah1),nl,
                          write('Biaya Sewa Bangunan 1     : '), write(HargaBg11),nl,
                          write('Biaya Sewa Bangunan 2     : '), write(HargaBg21),nl,
                          write('Biaya Sewa Bangunan 3     : '), write(HargaBg31),nl,
                          write('Biaya Sewa Landmark       : '), write(HargaLm1),nl
    ),
    !.

/*Membeli properti
  buy(Loc, )*/
