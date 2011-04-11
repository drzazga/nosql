#Import danych
Skypt importujacy baze filmow ze strony http://www.themoviedb.org/. Aby skrypt dzialal poprawnie nalezy uzupelnic pola w pliku konfiguracyjnym odpowiednimi danymi.
Klucz do API strony mozna pobrac rejestruj sie tu: http://www.themoviedb.org/account/signup. 

#Widoki
W celu utworzenia widokow w zaimportowanej bazie nalezy posluzyc sie plikiem mapReduceViews.js:
> couchapp push mapReduceViews.js http://sigma.ug.edu.pl:<numer_portu>/<nazwa_bazy>

#Wykresy
Wizualizacje dostepne pod adresem: (http://sigma.ug.edu.pl/~bdrzazgo/)
Wykresy tworzone sa przy uzyciu narzedzia Protovis. W folderze js znajduja sie wszystkie potrzebne pliki z danymi, aby samemu
je stworzyc nalezy uruchomic skrypt create_charts.rb.

Plik data_runtime.js odpowada za dane do wykresu kolowego. 
Plik data_year.js odpowiada za dane dostarczane do wykresu slupkowego.