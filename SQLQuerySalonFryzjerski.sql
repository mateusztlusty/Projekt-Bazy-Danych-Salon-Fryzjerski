CREATE DATABASE SalonFryzjerski;
use SalonFryzjerski;

CREATE TABLE Fryzjer (
	id_fryzjer INT NOT NULL PRIMARY KEY,
	imie VARCHAR(50) NOT NULL,
	nazwisko VARCHAR(50) NOT NULL,
	numer_stanowiska INT NOT NULL,
	telefon VARCHAR(15) NOT NULL,
	e_mail VARCHAR(50) NULL );

CREATE TABLE Typ (
	id_typ INT NOT NULL PRIMARY KEY,2
	nazwa_strzyzenia VARCHAR(50) NOT NULL,
	cena_strzyzenia VARCHAR(50) NOT NULL,
	czas_strzyzenia VARCHAR(50) NOT NULL );

CREATE TABLE Spotkanie (
	id_spotkania INT NOT NULL PRIMARY KEY,
	data_spotkania DATETIME NOT NULL,
	typ INT NOT NULL,
	id_klient INT NOT NULL,
	id_fryzjer INT NOT NULL );

CREATE TABLE Klient (
	id_klient INT NOT NULL,
	imie VARCHAR(50) NOT NULL,
	nazwisko VARCHAR(50) NOT NULL,
	llogin VARCHAR(50) NOT NULL,
	haslo VARCHAR(50) NOT NULL,
	telefon VARCHAR(15) NOT NULL,
	e_mail VARCHAR(15) NULL );

ALTER TABLE Fryzjer
ADD FOREIGN KEY (id_fryzjer) REFERENCES Spotkanie(id_fryzjer);

ALTER TABLE Klient 
ADD FOREIGN KEY (id_klient) REFERENCES Spotkanie(id_klient);

ALTER TABLE Typ
ADD FOREIGN KEY (id_typ) REFERENCES Spotkanie(typ);

/* uzupe³nienie tabeli przyk³adowymi danymi */

INSERT INTO Fryzjer VALUES (1, 'Tomasz', 'Lenart', 1, '+48 666 000 666', 'tlenart@gg.pl');
INSERT INTO Fryzjer VALUES (2, 'Karol', 'Palka', 3, '+48 666 888 666', 'kpalka@gg.pl')
INSERT INTO Fryzjer VALUES (3, 'Mateusz', 'Pazdzioch', 4, '+48 666 000 777', 'pazdzioch@gg.pl')
INSERT INTO Fryzjer VALUES (4, 'Karolina', 'Majcher', 2, '+48 666 777 666', 'kmajcher@gg.pl')
SELECT * from Fryzjer;

INSERT INTO Typ VALUES (1, 'Farbowanie', '120 ZL', '150 MIN');
INSERT INTO Typ VALUES (2, 'Cieniowanie', '120 ZL', '120 MIN');
INSERT INTO Typ VALUES (3, 'Loki', '80 ZL', '100 MIN');
INSERT INTO Typ VALUES (4, 'Strzyzenie krótkie', '20 ZL', '15 MIN');
INSERT INTO Typ VALUES (5, 'Strzyzenie pó³d³ugie', '35 ZL', '25 MIN');
INSERT INTO Typ VALUES (6, 'Strzyenie d³ugie', '50 ZL', '35 MIN');
INSERT INTO Typ VALUES (7, 'Grzywka', '50 ZL', '30 MIN');
INSERT INTO Typ VALUES (8, 'Effilage', '100 ZL', '80 MIN');
SELECT * from Typ;

INSERT INTO Klient VALUES (1, 'Krystian', 'Grzesik', 'kgrzesik23', 'papapa23', '+48 543 345 543', null );
INSERT INTO Klient VALUES (2, 'Monika', 'Faja', 'fajaa43', 'palopa23', '+48 543 999 000', null );
INSERT INTO Klient VALUES (3, 'W³adys³awa', 'barszcz', 'bbaarr', 'krupnik', '+48 576 543 765', 'barszczyk@on.pl' );
INSERT INTO Klient VALUES (4, 'Kasia', 'Bauman', 'kasiab23', 'lalalaland', '+48 545 345 678', null );
INSERT INTO Klient VALUES (5, 'Brylant', 'Gradz', 'gradzdd', 'tratata52', '+48 345 345 543', 'gradz@on.pl' );
INSERT INTO Klient VALUES (6, 'Krystian', 'Kuper', 'kkuper2', 'ddada', '+48 547 345 543', null );
INSERT INTO Klient VALUES (7, 'Mariola', 'Banas', 'banasiowa', 'partyssa', '+48 900 877 655', null );
SELECT * from Klient;

INSERT INTO Spotkanie VALUES (1, '20191111 11:00:00 AM', 4, 1, 3);
INSERT INTO Spotkanie VALUES (2, '20191111 11:30:00 AM', 8, 2, 4);
INSERT INTO Spotkanie VALUES (3, '20191111 11:45:00 AM', 4, 3, 1);
INSERT INTO Spotkanie VALUES (4, '20191111 12:30:00 AM', 5, 6, 2);
INSERT INTO Spotkanie VALUES (5, '20191111 12:40:00 AM', 1, 4, 3);
SELECT * from Spotkanie;

/* przyk³adowe polecenia i procedury */

SELECT imie, nazwisko FROM Fryzjer ORDER BY numer_stanowiska;

SELECT czas_strzyzenia, nazwa_strzyzenia FROM Typ ORDER BY czas_strzyzenia;

CREATE PROCEDURE [DodajFryzjera] @a INT, @b VARCHAR(50), @c VARCHAR(50), @d INT, @e VARCHAR(15), @f VARCHAR(50)
as
	insert into Fryzjer values (@a, @b, @c, @d, @e, @f);

	exec DodajFryzjera '5' , 'Karol', 'Swiderski' , '5' , '+48 888 999 000', 'karol@karol.pl' ;

	SELECT * from Fryzjer;

CREATE PROCEDURE [UsunFryzjera] @i INT
as
	delete from Fryzjer where id_fryzjer = @i;

	exec UsunFryzjera 5; 

	SELECT * from Fryzjer;
	
CREATE PROCEDURE [DodajSpotkanie] @g INT, @h DATETIME, @j INT, @k INT, @l INT
as
	insert into Spotkanie values (@g, @h, @j, @k, @l);

	exec DodajSpotkanie '7' , '20191111 14:40:00' , '1' , '1' , '3' ;

	SELECT * from Spotkanie;

SELECT id_spotkania FROM Spotkanie WHERE id_fryzjer = 3;
