t = Time.now

cat1 = Category.create title: "Tulostus", color: "red"
cat2 = Category.create title: "Loopit", color: "teal"
cat3 = Category.create title: "Funktiot", color: "pink"
cat4 = Category.create title: "Lisätehtävä", color: "black"
cat5 = Category.create title: "Rekursio", color: "blue"

bat1 = Batch.create title: "Viikko 2", deadline: t.advance(days: 12)
bat2 = Batch.create title: "Viikko 3", deadline: t.advance(days: 24)
bat3 = Batch.create title: "Viikko 4", deadline: t.advance(days: 36)
bat4 = Batch.create title: "Viikko 1", deadline: t.advance(days: -1)

e1 = Exercise.create title: "Tulostelua",
                     text: "Tulosta seuraavat sanat (yksi riviä kohti):
* kissa
* pallo
* kissalla on pallo",
                     file_upload: true,
                     category: cat1
e11 = Exercise.create title: "Rakenna funktiot",
                     text: "Tee erilliset funktiot, jotka palauttavat kolmen luvun ryhmästä
                            suurimman ja joka laskee suorakolmion pinta-alan",
                     file_upload: true,
                     category: cat3,
                     batch: bat1
e15 = Exercise.create title: "Tee Pythonia",
                     text: "Tulosta sanan **kaikki** kirjaimet (yksi riviä kohti) seuraavista sanoista:
* kissa
* pallo
* kissapallo
* kissalla on pallo",
                     file_upload: true,
                     category: cat1
e2 = Exercise.create title: "Muuttuvat muuttujat ja tietotyypit 2",
                     text: "Kirjoita funktio, joka palauttaa aina merkkijonon pienellä kirjoitettuna",
                     file_upload: false,
                     category: cat1,
                     batch: bat1
e3 = Exercise.create title: "Python laskin",
                     text: "Tee laskin, joka osaa summata, vähentää ja kertoa

Olisi kiva jos laskin ei olisi kertakäyttöinen",
                     file_upload: true,
                     category: cat4,
                     batch: bat1
e4 = Exercise.create title: "Foreach-loopit",
                     text: "Looppaa taulukon [1,2,3] alkiot ja alkioihin +5",
                     file_upload: true,
                     category: cat2,
                     batch: bat2
e4 = Exercise.create title: "For-loopit",
                     text: "Looppaa taulukon [1,2,3] alkiot ja alkioihin +5",
                     file_upload: true,
                     category: cat2,
                     batch: bat2
e4 = Exercise.create title: "Vokaali ja konsonantti funktio",
                     text: "Tee funktio, joka kertoo onko kirjain konsonantti vai vokaali",
                     file_upload: false,
                     category: cat3,
                     batch: bat3
e4 = Exercise.create title: "Vokaalit ja konsonantit merkkijonossa",
                     text: "Laske edellisen funktion avulla kuinka monta vokaalia ja konsonanttia
                            annetussa merkkijonossa esiintyy.",
                     file_upload: true,
                     category: cat2,
                     batch: bat3
e4 = Exercise.create title: "Joulukuusia",
                     text: "Tee neljä-tasoinen joulukuusi *-merkeillä käyttäen **rekursiota**",
                     file_upload: true,
                     category: cat5,
                     batch: bat3

e4 = Exercise.create title: "Markdown esittelyssä",
                     text: "Heading
=======

Sub-heading
-----------

### Another deeper heading

Paragraphs are separated
by a blank line.

Two spaces at the end of a line leave a
line break.

Text attributes _italic_,
**bold**, `monospace`.

Bullet list:

  * apples
  * oranges
  * pears

Numbered list:

  1. apples
  2. oranges
  3. pears

A [link](http://example.com).
",
                     file_upload: true,
                     category: cat5,
                     batch: bat4

u1 = User.create email: "student@example.com", password: "password", teacher: false
u2 = User.create email: "teacher@example.com", password: "password", teacher: true
