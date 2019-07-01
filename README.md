# Users articles challenge

https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet

## H2 Instaliranje aplikacije
U ovom delu sam instalirao express js i napravio bazu podataka.
Baza ima dve tabele,users i articles,user_id predstavlja relaciju izmedju tabela.
U zavisnosti od toga ko je ulogovani korisnik vrsi se i prikaz vesti ostalo.
##H2 Kreiranje fajlova
U ovom delu sam kreirao sve potrebne fajlove.
U folderu pages se nalaze stranice za login-index.ejs,za kreiranje clanaka create.ejs,
brisanje-delete.ejs,prikaz clanaka-listarticles.ejs i za update clanaka-update.ejs.
##H3 Index.js
U fajlu index.js se nalazi konekcija ka bazi kao i sve potrebne rute za prikaz,kreiranje,
brisanje i izmenu clanaka.

'/auth'- Uzima podatke unete u formu i proverava da li u bazi postoji registrovani user.
Ukoliko postoji user sa tim podacima upucuje se na rutu '/home' gde se vrsi provera da li
se korisnik ulogovao i u zavisnosti od toga se upucuje na stranicu za prikaz vesti ili se 
salje odgovor da se mora ulogovati.

'/add'-Uzima podatke unete na stranici create.ejs i preko insert query upita salje u bazu.

'/list'-Preko query upita prikazuje sve vesti u zavisnosti od toga ko je ulogovani korisnik.

'/del'-Vrsi brisanje vesti u zavisnosti od id_article.

'/edit'-Vrsi update tabele articles

