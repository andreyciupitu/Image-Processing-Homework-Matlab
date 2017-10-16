Nume: Ciupitu Andrei-Valentin
Grupa: 312 CC

FUNCTIA DEMO: Functia demo() va realiza cate 3 transformari asupra celor 2 imagini(imaginile trebuie sa fie in acelasi director cu fisierul demo.m).
	Prima transformare este o rotatie fata de orizontala cu matricea T = [-1 0; 0 -1].
	A doua transformare este o scalare cu 0.4 cu matricea T = [0.4 0; 0 0.4].
	Ultima trnsformare este o rotatie cu 45 de grade in sens trigonometric, cu matricea T = [cos(pi/4) -sin(pi/4); sin(pi/4) cos(pi/4)].
	In plus, functia demo va realiza si o rotatie cu 45 de grade folosind forward mapping asupra uneia din poze si va aplica functia transform_image asupra celeilalte cu un factor de 2.8. 

Detalii de implementare:

Interpolarea liniara: Determin intre ce valori consecutive se afla x, apoi determin ecuatia dreptei ce uneste cele 2 puncte pentru a calcula valoarea lui x.

Interpolarea biliniara: Realizez mai intai o interpolare liniara dupa X, apoi o interpolare liniara dupa Y.

Forward-Mapping: Determin mai intai dimensiunile noii imagini, aplicand transformarea T in colturile imaginii. Apoi fiecarei perechi de coordonate (i, j) ii este aplicata transformarea T pentru a determina noua pozitie in imaginea rezultanta. Functia returneaza matricea imaginii rezultante.

Inverse-Mapping: Determin mai intai dimensiunile noii imagini, aplicand transformarea T in colturile imaginii. Calculez T^-1 si o aplic fiecarei perechi de coordonate (i, j) din imaginea rezultanta pentru a putea determina valoarea acelui pixel folosind interpolarea biliniara pe matricea imaginii initiale. Functia returneaza matricea imaginii rezultante.

Anti-Aliasing: Creez mai intai un image stack folosind matricea de blur K din cerinta. Acesta va avea k+1 nivele, unde k este factorul de downscale. Folosind interpolarea triliniara este determinata matricea imaginii rezultante.


