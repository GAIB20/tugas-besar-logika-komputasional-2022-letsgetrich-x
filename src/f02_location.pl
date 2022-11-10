:- dynamic(kepemilikan/2).
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

/* DESKRIPSI LOKASI */
desc_lokasi(a1, 'Desa asal keluarga Weasley, Lovegood, dan Diggory' ).
desc_lokasi(a2, 'Desa asal Lily dan James Potter').
desc_lokasi(a3, 'Desa asal Voldemort').
desc_lokasi(b1, 'Kota tempat tinggal keluarga Dursley').
desc_lokasi(b2, 'Tempat tinggal keluarga Malfoy').
desc_lokasi(b3, 'Tempat tinggal keluarga Black').
desc_lokasi(jl, 'Tempat ini adalah penjara paling mengerikan di dunia sihir. \n                       Pemain akan masuk ke Azkaban jika mendapatkan kartu masuk penjara \n                       atau mendapatkan double 3 kali berturut-turut. \n \nTerdapat 4 mekanisme untuk keluar dari Azkaban : \n     1. Apabila terdapat dadu yang double sebelum tiga kali giliran,\n       pemain langsung keluar dari penjara\n     2. Apabila pemain sudah melempar dadu sebanyak tiga kali, pemain keluar dari penjara. \n     3. Pemain mempunyai kartu untuk lolos dari penjara. Pada giliran berikutnya, \n       pemain dapat memilih untuk mengaktifkannya. \n     4. Pemain dapat membayar pada giliran berikutnya sehingga lolos dari penjara lalu \n       dapat langsung melempar dadu. \n').
desc_lokasi(c1, 'Tempat persembunyian Golden Trio').
desc_lokasi(c2, 'Sekolah sihir Prancis').
desc_lokasi(c3, 'Sekolah sihir Scandinavia').
desc_lokasi(tx, 'Tax').
desc_lokasi(d1, 'Sekolah sihir Inggris').
desc_lokasi(d2, 'Sekolah sihir dengan spesialisasi teater').
desc_lokasi(d3, 'Pusat ekonomi dunia sihir').
desc_lokasi(fp, 'Free Park').
desc_lokasi(e1, 'Kantor pemerintahan dunia sihir').
desc_lokasi(e2, 'Stasiun kereta api').
desc_lokasi(e3, 'Pusat kesehatan dunia sihir').
desc_lokasi(f1, 'Sisi gelap Diagon Alley').
desc_lokasi(f2, 'Markas Gellert Grindelwart').
desc_lokasi(f3, 'Muggle street, asal Severus Snape').
desc_lokasi(wt, 'Apparate').
desc_lokasi(g1, 'Forbidden Forest').
desc_lokasi(g2, 'Bank dunia sihir').
desc_lokasi(g3, 'Desa khusus penyihir').
desc_lokasi(cc, 'Chance Card').
desc_lokasi(h1, 'Pusat informasi dunia sihir').
desc_lokasi(h2, 'Sebuah hutan di Inggris').


/* Kepemilikan */
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
    write('Nama Lokasi          : '),
    write(Name), nl,
    write('Deskripsi            : '),
    desc_lokasi(X, Desc),
    write(Desc), nl,
    (
        is_property(X) -> write('Kepemilikan          : '),
                          kepemilikan(X, Milik),
                          write(Milik), nl,
                          /* nunggu properti jadi ?*/
                          write('Biaya sewa saat ini  : \n'),
                          write('Biaya Akuisisi       : \n'),
                          write('Tingkatan Properti   : \n'), !;
        X = cc -> write('Anda berhak memilih salah satu dari kartu berikut: \n'), !
        /* nunggu chance card */
    ),
    !.

checkLocationDetail(X):-
    write(X),
    write(' bukan lokasi yang valid! Silahkan masukkan lokasi yang valid.').

