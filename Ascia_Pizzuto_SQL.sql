/*
Query 1:
Contare il numero di lingue in cui le release contenute nel database sono scritte (il risultato deve
contenere soltanto il numero delle lingue, rinominato “Numero_Lingue”). */

 /*
   1 Le informazioni di cui abbiamo bisogno per questa query sono la tabella "release" e il suo attributo "language"
   2 Controlliamo nella tabella "release" come si chiama l'attributo "numero lingue"
   3 Non ci sono sottoproblemi da eseguire in questa query
   4 Per controllare di fare assunzioni su valori non nulli (diversi da "null") utilizziamo il costrutto "IS NOT NULL".
     Per controllare la veridicità della query, selezioniamo univocamente ogni lingua tramite il costrutto  "DISTINCT"
   5 Non richiesto
   6 Per controllare il risultato della query, abbiamo eseguito la medesima query senza il costrutto "COUNT"
*/

-- Query
SELECT COUNT(DISTINCT language) AS Numero_Lingue
FROM release
WHERE language NOTNULL;

-- Verifica
SELECT DISTINCT language AS Numero_Lingue
FROM release
WHERE language NOTNULL;

/*
Query 2:
Elencare gli artisti che hanno cantato canzoni in italiano (il risultato deve contenere il nome dell’artista
e il nome della lingua). */

/*
   1 Le informazioni di cui abbiamo bisogno per questa query sono le tabella "artist_credit", "language" e "release"
   2 Controlliamo nella tabella release(language) referenzia nella tabella language(id)
   	 Controlliamo nella tabella artist_credit(id) referenzia nella tabella release(artist_credit)
   3 Per controllare la veridicità della query utilizziamo i vincoli di integrità referenziale tra le tabelle utilizzate
   4 Per controllare di fare assunzioni su valori non duplicati utilizziamo il costrutto "DISTINCT" su ogni "artist_credit.name" e "language.name"
   5 Non richiesto
   6 Per controllare il risultato della query, dato che quest'ultima non produce nessuna riga nel risultato, abbiamo provato ad usare un "language" differente
     tra quelli disponibili (ad esempio "French"), affinché ottenessimo un risultato con il quale aver riscontro.
*/

-- Query
SELECT DISTINCT artist_credit.name, language.name
FROM (release JOIN language ON language.id = release.language) JOIN artist_credit ON artist_credit.id = release.artist_credit
WHERE language.name = 'Italian';

-- Verifica
SELECT DISTINCT artist_credit.name, language.name
FROM (release JOIN language ON language.id = release.language) JOIN artist_credit ON artist_credit.id = release.artist_credit
WHERE language.name = 'French';

/*
Query 3:
Elencare le release di cui non si conosce la lingua (il risultato deve contenere soltanto il nome della
release).*/

/*
   1 Le informazioni di cui abbiamo bisogno per questa query è la tabella "release"
   2 Controlliamo che la lingua della release sia uguale a valore nullo e ne selezioniamo il nome
   3 Non ci sono sottoproblemi da eseguire in questa query
   4 Nella BD si fa riferimento ai valori nulli del campo release(language)
   5 Non richiesto
   6 Per controllare il risultato della query abbiamo utilizzato la stessa query con il costrutto "SELECT *(ALL)" per visualizzare meglio a video tutte le righe
     della tabella release dove "language" è un valore nullo.
     Inoltre abbiamo provato a fare un'altra query utilizzando anche la tabella "artist_credit" con un JOIN sulla sua PK (Primary Key) "id" per avere
     un riscontro nei risultati dei nomi delle "release" e dei loro "artist_credit".
*/

-- Query
SELECT release.name
FROM release
WHERE language ISNULL;

-- Verifica 
SELECT release.name, artist_credit.name, release.language
FROM release JOIN artist_credit ON release.artist_credit = artist_credit.id
WHERE language ISNULL;

/*
Query 4:
Elencare le release che nel nome hanno la parola “love”, in qualsiasi posizione (quindi anche in prima
posizione; il risultato deve contenere soltanto il nome della release). */

/*
   1 Le informazioni di cui abbiamo bisogno per questa query sono le tabella "release"
   2 Controlliamo che il nome della release contenga la stringa "love" in una posizione qualsiasi tramite il costrutto "LIKE" utilizzato per le stringhe
   3 Non ci sono sottoproblemi da eseguire in questa query
   4 Per controllare di fare assunzioni su valori non duplicati utilizziamo il costrutto "DISTINCT" su ogni "release.name"
   5 Non richiesto 
   6 Per controllare il risultato della query abbiamo utilizzato la stessa query con "%Love%" poiché produce risultati dato che il confronto dell'operatore 
     è case-sensitive, cioè fa distinzione tra maiuscole e minuscole
*/

-- Query
SELECT DISTINCT release.name
FROM release
WHERE release.name LIKE '%love%'; -- minuscolo

-- Verifica
SELECT DISTINCT release.name
FROM release
WHERE release.name LIKE '%Love%'; -- MAIUSCOLO 

/* 
Query 5:
Elencare tutti gli pseudonimi di Prince con il loro tipo, se disponibile (il risultato deve contenere lo
pseudonimo dell'artista, il nome dell’artista (cioè Prince) e il tipo di pseudonimo (se disponibile)). */

 /*
   1 Le informazioni di cui abbiamo bisogno per questa query sono le tabelle "artist", "artist_alias" e "artist_type"
   2 Controlliamo nella tabella artist(id) referenzia nella tabella artist_alias(artist)
     Controlliamo nella tabella artist_type(id) referenzia nella tabella artist_alias(type)
   3 Per controllare la veridicità della query utilizziamo i vincoli di integrità referenziale tra le tabelle utilizzate.
     Controlliamo che "artist.name" sia uguale a 'Prince'
   4 Controlliamo che "artist_alias.type" sia disponibile (contenga un valore non nullo)
   5 Non richiesto
   6 Per controllare il risultato della query, abbiamo provato ad usare un "artist.name" differente
     tra quelli disponibili (ad esempio "Antonín Dvořák"), affinché ottenessimo un risultato con il quale aver riscontro.
*/

-- Query
SELECT artist_alias.name, artist.name, artist_type.name
FROM artist JOIN artist_alias ON artist.id = artist_alias.artist
				JOIN artist_type ON artist_alias.type = artist_type.id
WHERE artist.name LIKE 'Prince' AND artist_alias.type IS NOT NULL;

-- Verifica
SELECT artist_alias.name, artist.name, artist_type.name
FROM artist JOIN artist_alias ON artist.id = artist_alias.artist
				JOIN artist_type ON artist_alias.type = artist_type.id
WHERE artist.name = 'Antonín Dvořák' AND artist_alias.type IS NOT NULL; 

/*
Query 6:
Elencare le release di gruppi inglesi ancora in attività (il risultato deve contenere il nome del gruppo e il
nome della release e essere ordinato per nome del gruppo e nome della release) */

/*
   1 Le informazioni di cui abbiamo bisogno per questa query sono le tabelle "release", "artist_credit", "artist" e "area"
   2 Controlliamo nella tabella release(artist_credit) referenzia nella tabella artist_credit(id)
     Controlliamo nella tabella artist(area) referenzia nella tabella area(id)
	 Controlliamo nella tabella artist_type(id) referenzia nella tabella artist(type)
     Controlliamo che i gruppi siano ancora in attività con il costrutto "IS NULL" sull'attributo "artist.ended" oppure sugli attributi "artist.end_date_year", "artist.end_date_month" e "artist.end_date_day"
   3 Per controllare la veridicità della query utilizziamo i vincoli di integrità referenziale tra le tabelle utilizzate (vedasi i molteplici JOIN)
     Per controllare di l'ordinamento del nome delle release e dei nomi dei gruppi utilizziamo il costrutto "ORDER BY"
   4 Per controllare di fare assunzioni su valori non duplicati utilizziamo il costrutto "DISTINCT" su ogni "artist_credit.name" e su ogni "release.name"
   5 Non richiesto
   6 Per controllare il risultato della query abbiamo visualizzato tutte le release di gruppi inglesi ancora in attività.
*/

-- Prima versione
SELECT DISTINCT artist_credit.name, release.name
FROM artist_credit JOIN release ON artist_credit.id = release.artist_credit
WHERE artist_credit.name IN 
	(SELECT artist.name
    FROM artist JOIN area ON artist.area = area.id
					JOIN artist_type ON artist.type = artist_type.id
    WHERE artist_type.name = 'Group' AND artist.ended = false AND area.name = 'United Kingdom')
ORDER BY artist_credit.name, release.name;

-- Seconda versione
SELECT DISTINCT artist_credit.name, release.name
FROM artist_credit JOIN release ON artist_credit.id = release.artist_credit
WHERE artist_credit.name IN 
	(SELECT artist.name
    FROM artist JOIN area ON artist.area = area.id
					JOIN artist_type ON artist.type = artist_type.id
    WHERE artist_type.name = 'Group' AND artist.end_date_year IS NULL AND artist.end_date_month IS NULL AND artist.end_date_day IS NULL AND area.name = 'United Kingdom')
ORDER BY artist_credit.name, release.name;

-- Verifica 
SELECT DISTINCT release.name AS Nome_release_artisti_inglesi
FROM release JOIN artist_credit ON artist_credit.id = release.artist_credit
				JOIN artist_credit_name ON artist_credit_name.artist_credit = artist_credit.id
					JOIN artist ON artist.id = artist_credit_name.artist
						JOIN artist_type ON artist.type = artist_type.id
							JOIN area ON artist.area = area.id
WHERE artist.area = 221 AND artist_type.name = 'Group' AND artist.ended = false AND area.name = 'United Kingdom' -- 221 corrisponde al codice di "United Kingdom"
ORDER BY release.name;

/*
Query 7:
Trovare le release in cui il nome dell’artista è diverso dal nome accreditato nella release (il risultato deve
contenere il nome della release, il nome dell’artista accreditato (cioè artist_credit.name) e il nome
dell’artista (cioè artist.name)) */

/*
   1 Le informazioni di cui abbiamo bisogno per questa query sono le tabelle "release", "artist_credit", "artist_credit_name" e "artist"
   2 Controlliamo nella tabella release(artist_credit) referenzia nella tabella artist_credit(id)
     Controlliamo nella tabella artist_credit_name(artist_credit) referenzia nella tabella artist_credit(id)
	 Controlliamo nella tabella artist(id) referenzia nella tabella artist_credit(id) referenzia artist_credit_name(artist)
     Controlliamo che "artist.name" sia diverso da "artist_credit_name" tramite il costrutto "NOT LIKE" oppure attraverso l'operatore aritmetico "<>" o ancora "!="
   3 Per controllare la veridicità della query utilizziamo i vincoli di integrità referenziale tra le tabelle utilizzate (vedasi i molteplici JOIN)
   4 Per controllare di fare assunzioni su valori non duplicati utilizziamo il costrutto "DISTINCT" su ogni " release.name", "artist_credit.name" e su ogni "artist.name"
   5 Non richiesto
   6 Per controllare il risultato della query abbiamo visualizzato la lista completa dei nomi degli artisti e dei nomi accreditati degli artisti.
*/

-- Query
SELECT DISTINCT release.name AS Nome_release, artist_credit.name AS Nome_artista_Accreditato, artist.name AS Nome_artista
FROM release JOIN artist_credit ON release.artist_credit = artist_credit.id
				JOIN artist_credit_name ON artist_credit_name.artist_credit = artist_credit.id
					JOIN artist ON artist.id = artist_credit_name.artist
WHERE artist.name NOT LIKE artist_credit.name; -- Oppure != o ancora <>

-- Verifica
SELECT artist_credit.name nome_accreditato, artist.name nome_artista 
FROM artist JOIN artist_credit_name ON artist.id = artist_credit_name .artist
				JOIN artist_credit ON artist_credit .id = artist_credit_name.artist_credit
					JOIN release ON release.artist_credit = artist_credit.id;  


/*
Query 8:
Trovare gli artisti con meno di tre release (il risultato deve contenere il nome dell’artista ed il numero di
release). */

/*
   1 Le informazioni di cui abbiamo bisogno per questa query sono le tabelle "release", "artist_credit", "artist_credit_name" e "artist"
   2 Controlliamo nella tabella release(artist_credit) referenzia nella tabella artist_credit(id)
     Controlliamo nella tabella artist_credit_name(artist_credit) referenzia nella tabella artist_credit(id)
	 Controlliamo nella tabella artist(artist_credit) referenzia nella tabella artist_credit_name(artist)
   3 Per controllare la veridicità della query utilizziamo il vincolo di integrità referenziale tra le tabelle utilizzate (vedasi il JOIN)
   4 Per controllare di fare assunzioni su artisti che hanno pubblicato meno di 3 release, utilizziamo il costrutto "HAVING COUNT" sull'attributo
     "artist_credit" di "release" ponendolo minore di 3
   5 Non richiesto
   6 Per controllare il risultato della query abbiamo visualizzato l'associazione Nome artista - Numero release totali in ordine decrescente sul numero delle release di ogni artista 
*/

-- Query
SELECT artist.name AS Nome_artista, COUNT(release.artist_credit) AS Numero_release
FROM release JOIN artist_credit ON release.artist_credit = artist_credit.id
				JOIN artist_credit_name ON artist_credit_name.artist_credit = artist_credit.id
					JOIN artist ON artist.id = artist_credit_name.artist
GROUP BY artist.name
HAVING COUNT(release.artist_credit) < 3; 

-- Verifica
SELECT artist.name AS Nome_artista, COUNT(release.artist_credit) AS Numero_release
FROM release JOIN artist_credit ON release.artist_credit = artist_credit.id
				JOIN artist_credit_name ON artist_credit_name.artist_credit = artist_credit.id
					JOIN artist ON artist.id = artist_credit_name.artist
GROUP BY release.artist_credit, artist.name
ORDER BY COUNT(release.artist_credit) DESC, artist.name; 

/*
Query 9:
Trovare la registrazione più lunga di un’artista donna (il risultato deve contenere il nome della
registrazione, la sua durata in minuti e il nome dell’artista; tenere conto che le durate sono memorizzate
in millesimi di secondo) (scrivere due versioni della query con e senza operatore aggregato MAX). */

/*
   1 Le informazioni di cui abbiamo bisogno per questa query sono le tabelle "recording", "artist_credit", "artist_credit_name", "artist" e "gender"
   2 Controlliamo che nella tabella recording(artist_credit) referenzia nella tabella artist_credit(id)
     Controlliamo che nella tabella artist_credit_name(artist_credit) referenzia nella tabella artist_credit(id)
	 Controlliamo che nella tabella artist(id) referenzia nella tabella artist_credit_name(artist)
	 Controlliamo che nella tabella gender(id) referenzia nella tabella artist(gender)
   3 Per controllare la veridicità della query utilizziamo i vincoli di integrità referenziale tra le tabelle utilizzate (vedasi molteplici JOIN).
     Per controllare di fare assunzioni su artiste donna, utilizziamo, nella sottoquery, la clausola "WHERE" contenente la specifica di "gender.name" posta uguale a 'Female'.
     Per controllare di fare assunzioni sulla registrazione più lunga, utilizziamo la funzione "MAX" sull'attributo "length" di "recording".
   4 Per controllare di fare assunzioni su registrazioni calcolate in minuti, trasformiamo i millisecondi in minuti (in 1 minuto ci sono 60.000 millisecondi) nella clausola "SELECT"
   5 Prima versione: con operatore "MAX"
     Seconda versione: senza operatore "MAX" (utilizziamo operatore "ALL" rispetto a 2 sottoquery)
   6 Per controllare il risultato della query abbiamo visualizzato il nome della registrazione più lunga fatta da ogni artista donna e la loro durata in ordine decrescente
*/

-- Con MAX 
SELECT DISTINCT recording.name, artist.name, recording.length / 60000 AS Durata
FROM recording JOIN artist_credit ON recording.artist_credit = artist_credit.id
    				JOIN artist_credit_name ON artist_credit.id = artist_credit_name.artist_credit
    					JOIN artist ON artist_credit_name.artist = artist.id
    						JOIN gender ON artist.gender = gender.id
	WHERE recording.length IN
		(SELECT MAX (recording.length)
    	FROM recording JOIN artist_credit ON recording.artist_credit = artist_credit.id
        					JOIN artist_credit_name ON artist_credit.id = artist_credit_name.artist_credit
        						JOIN artist ON artist_credit_name.artist = artist.id
        							JOIN gender ON artist.gender = gender.id
    		WHERE gender.name LIKE 'Female');  

-- Senza MAX
SELECT DISTINCT recording.name, artist.name, recording.length / 60000 AS Durata
FROM recording JOIN artist_credit ON recording.artist_credit = artist_credit.id
    				JOIN artist_credit_name ON artist_credit.id = artist_credit_name.artist_credit
    					JOIN artist ON artist_credit_name.artist = artist.id
    						JOIN gender ON artist.gender = gender.id
	WHERE gender.name = 'Female' AND recording.length >= ALL 
		(SELECT recording.length
         FROM recording
         WHERE recording.length is not null and recording.artist_credit IN  
              (SELECT artist.id 
               FROM artist 
               JOIN gender ON artist.gender = gender.id 
               WHERE gender.name = 'Female')); 
			   
-- Verifica
SELECT recording.name, recording.length / 60000 as Durata
FROM recording
WHERE recording.artist_credit IN 
	(SELECT artist.id 
	FROM artist JOIN gender ON artist.gender = gender.id 
	WHERE gender.name = 'Female') AND recording.length IS NOT NULL
ORDER BY recording.length DESC; 

/*
Query 10:
Elencare le lingue cui non corrisponde nessuna release (il risultato deve contenere il nome della lingua,
il numero di release in quella lingua, cioè 0, e essere ordinato per lingua) (scrivere due versioni della
query; almeno una delle due versioni non deve utilizzare le viste). */

/*
   1 Le informazioni di cui abbiamo bisogno per questa query sono le tabelle "release" e "language"
   2 Controlliamo che nella tabella release(language) referenzia nella tabella language(id)
   3 Per controllare la veridicità della query utilizziamo i vincoli di integrità referenziale tra le tabelle utilizzate. In particolare utilizziamo
     un "RIGHT JOIN" per fare in modo che ad ogni riga della tabella di dx corrisponda una riga della tabella di sx per cui la clausola "ON" sia soddisfatta. Se così non è,
	 i valori corrispondenti agli attributi della tabella di sx avranno valore nullo (“null”)
     Per controllare di fare l'elenco delle lingue, utilizziamo la clausola "ORDER BY" che le elenca alfabeticamente(automaticamente) in ordine crescente
	 Per controllare di fare l'elenco delle lingue a cui non corrisponde nessuna release, utilizziamo il costrutto "COUNT" su "release.language" e lo poniamo uguale a "0"
	 utilizzando il costrutto "HAVING"
   4 Non richiesti valori duplicati/nulli
   5 Prima versione: senza vista
     RIGHT JOIN: nel risultato si avranno tutte le righe della tabella che nella query compare a dx.
	 A ogni riga della tabella di dx vengono fatte corrispondere le eventuali righe della tabella di sx per cui la clausola ON è vera → Se non è così, i valori corrispondenti agli attributi della tabella di sx avranno valore nullo (“null”)
     Seconda versione: con vista
   6 Per controllare il risultato della query abbiamo visualizzato  il numero di release per ogni lingua in ordine decrescente
*/

-- Senza vista
SELECT language.name, COUNT(release.language)
FROM release RIGHT JOIN language ON release.language = language.id
GROUP BY language.name
HAVING COUNT(release.language) = 0
ORDER BY language.name; 

-- Verifica 
SELECT COUNT(release.language), language.name
FROM release RIGHT JOIN language on release.language = language.id
GROUP BY language.name
ORDER BY COUNT(release.language) DESC;

-- Con vista
CREATE VIEW Query10 AS SELECT language.name, COUNT(release.language)
FROM release RIGHT JOIN language ON release.language = language.id
GROUP BY language.name
HAVING COUNT(release.language) = 0
ORDER BY language.name;

/*
Query 11:
Ricavare la seconda registrazione per lunghezza di un artista uomo (il risultato deve comprendere l'artista
accreditato, il nome della registrazione e la sua lunghezza) (scrivere due versioni della query; almeno
una delle due versioni non deve utilizzare le viste). */

/*
   1 Le informazioni di cui abbiamo bisogno per questa query sono le tabelle "recording", "artist_credit", "artist_credit_name", "artist" e "gender"
   2 Controlliamo che nella tabella recording(artist_credit) referenzia nella tabella artist_credit(id)
     Controlliamo che nella tabella artist_credit_name(artist_credit) referenzia nella tabella artist_credit(id)
	 Controlliamo che nella tabella artist(id) referenzia nella tabella artist_credit_name(artist)
	 Controlliamo che nella tabella gender(id) referenzia nella tabella artist(gender)
   3 Per controllare la veridicità della query utilizziamo i vincoli di integrità referenziale tra le tabelle utilizzate (vedasi molteplici JOIN).
     Per controllare di fare assunzioni su artisti uomo, utilizziamo, nella sottoquery, la clausola "WHERE" contenente la specifica di "gender.name" posta uguale a 'Male'.
     Per controllare di fare assunzioni sulla registrazione più lunga, utilizziamo la funzione "MAX" sull'attributo "length" di "recording".
	 Per controllare di fare assunzioni sulla seconda registrazione più lunga, utilizziamo la funzione "MAX" sull'attributo "length" di "recording" in una sottoquery
   4 Per controllare di fare assunzioni su registrazioni calcolate in minuti, trasformiamo i millisecondi in minuti (in 1 minuto ci sono 60.000 millisecondi) nella clausola "SELECT"
   5 Prima versione: senza vista
     Seconda versione: con vista
   6 Per controllare il risultato della query abbiamo  visualizzato tutti i nomi degli artisti uomini accreditati e le loro registrazioni in ordine decrescente 
*/

-- Senza vista
SELECT artist_credit.name AS Nome_Artista_Accreditato, recording.name AS Nome_recording, recording.length / 60000 AS Durata
FROM recording JOIN artist_credit ON recording.artist_credit = artist_credit.id
WHERE length = -- Oppure "IN"
(SELECT MAX(recording.length)
                FROM recording JOIN artist_credit ON recording.artist_credit = artist_credit.id
                    				JOIN artist_credit_name ON artist_credit.id = artist_credit_name.artist_credit
                    					JOIN artist ON artist_credit_name.artist = artist.id
                    						JOIN gender ON artist.gender = gender.id
                WHERE gender.name LIKE 'Male' AND recording.length <
 				(SELECT MAX(recording.length)
                                        FROM recording));

-- Verifica
SELECT artist_credit.name AS Nome_artista, recording.name AS Nome_registrazione, recording.length / 60000 AS Durata
FROM recording JOIN artist_credit ON recording.artist_credit = artist_credit.id
					JOIN artist_credit_name ON artist_credit_name.artist_credit = artist_credit.id
						JOIN artist ON artist.id = artist_credit_name.artist
							JOIN gender ON artist.gender = gender.id 
WHERE gender.name = 'Male' AND recording.length IS NOT NULL
ORDER BY recording.length DESC; 

-- Con vista
CREATE VIEW Query11 AS SELECT artist_credit.name AS Nome_Artista_Accreditato, recording.name AS Nome_recording, recording.length / 60000 AS Durata
FROM recording JOIN artist_credit ON recording.artist_credit = artist_credit.id
WHERE length = -- Oppure "IN"
(SELECT MAX(recording.length)
                FROM recording JOIN artist_credit ON recording.artist_credit = artist_credit.id
                    				JOIN artist_credit_name ON artist_credit.id = artist_credit_name.artist_credit
                    					JOIN artist ON artist_credit_name.artist = artist.id
                    						JOIN gender ON artist.gender = gender.id
                WHERE gender.name LIKE 'Male' AND recording.length <
 				(SELECT MAX(recording.length)
                                        FROM recording));

/*
Query 12: (NO PER VERSIONE SOFT):
Per ogni stato esistente riportare la lunghezza totale delle registrazioni di artisti di quello stato (il risultato
deve comprendere il nome dello stato e la lunghezza totale in minuti delle registrazioni (0 se lo stato non
ha registrazioni) (scrivere due versioni della query; almeno una delle due versioni non deve utilizzare le
viste). */

/*
   1 Le informazioni di cui abbiamo bisogno per questa query sono le tabelle "recording", "artist_credit", "artist_credit_name", "artist", "area_type" e "area"
   2 Controlliamo che nella tabella recording(artist_credit) referenzia nella tabella artist_credit(id)
     Controlliamo che nella tabella artist_credit_name(artist_credit) referenzia nella tabella artist_credit(id)
	 Controlliamo che nella tabella artist(id) referenzia nella tabella artist_credit_name(artist)
	 Controlliamo che nella tabella area(id) referenzia nella tabella artist(area)
	 Controlliamo che nella tabella area_type(id) referenzia nella tabella area(type)
   3 Per controllare la veridicità della query utilizziamo i vincoli di integrità referenziale tra le tabelle utilizzate (vedasi molteplici JOIN).
     Per controllare di fare assunzioni su a
   4 Per controllare di fare assunzioni su registrazioni calcolate in minuti, trasformiamo i millisecondi in minuti (in 1 minuto ci sono 60.000 millisecondi) nella clausola "SELECT"
   5 Query (Prima versione -> CASE - THEN - END) --> Valuta una lista di condizioni e ritorna un risultato delle scelte multiple.
	 Il "CASE" ha 2 formati (entrambi supportano un argomento "ELSE" opzionale):
	 1 - Il caso semplice compara un'espressione con un insieme di espressioni semplici per determinarne il risultato.
	 2 - Il caso "ricercato" valuta un insieme di espressioni booleane per determinare il risultato.
	 Il "CASE" può essere usato con  dichiarazioni come SELECT, UPDATE, DELETE e SET, e in clausole come IN, WHERE, ORDER BY e HAVING.

     Query (Seconda versione -> Senza vista con COALESCE)--> Valuta in ordine gli argomenti e ritorna il valore corrente della prima espressione
	 che non è inizialmente valutata a "NULL" (Ad esempio SELECT COALESCE(NULL, NULL, 'terzo_valore', 'quarto_valore');
	 ritorna "terzoa_valore" perché il terzo valore è il primo valore non nullo.
   6 Per controllare il risultato della query abbiamo eseguito una prova di verifica su un country(ad esempio "Romania"), il quale possiede lunghezza totale delle recording = 0,
     poiché le recording che gli appartengono hanno il campo "length" = "null".
	 Inoltre abbiamo eseguito una verifica visualizzando l'elenco completo dei "country", in questo modo possiamo sapere che ci sono degli stati a cui non appartiene nessuna recording.
*/

-- Senza vista - CASE - THEN - END
SELECT  area.name AS Area, (CASE WHEN SUM(recording.length) ISNULL THEN 0 ELSE SUM(recording.length) END)/ 60000 AS Durata
FROM recording JOIN artist_credit ON recording.artist_credit = artist_credit.id
       				JOIN artist_credit_name ON artist_credit.id = artist_credit_name.artist_credit
            			JOIN artist ON artist.id = artist_credit_name.artist
                    		JOIN area ON artist.area = area.id
	 							JOIN area_type ON area.type = area_type.id
WHERE area_type.name = 'Country'
GROUP BY area.name
ORDER BY area.name;

-- Senza vista - COALESCE
SELECT  area.name AS Area, (COALESCE(SUM(recording.length) / 60000, 0)) AS Durata
FROM recording JOIN artist_credit ON recording.artist_credit = artist_credit.id
       				JOIN artist_credit_name ON artist_credit.id = artist_credit_name.artist_credit
            			JOIN artist ON artist.id = artist_credit_name.artist
                    		JOIN area ON artist.area = area.id
	 								JOIN area_type ON area.type = area_type.id
WHERE area_type.name = 'Country'
GROUP BY area.name
ORDER BY area.name;

-- Esempio di verifica
SELECT recording.name, recording.length
FROM recording JOIN artist_credit ON recording.artist_credit = artist_credit.id
					JOIN artist_credit_name ON artist_credit.id = artist_credit_name.artist_credit
						JOIN artist ON artist.id = artist_credit_name.artist
							JOIN area ON artist.area = area.id
								JOIN area_type ON area.type = area_type.id
WHERE area.name = 'Romania';

-- Verifica 
SELECT area.name
FROM area JOIN area_type ON area_type.id = area.type
WHERE area_type.name = 'Country'; 

-- Con vista - CASE - THEN - END
CREATE VIEW Query12 AS SELECT  area.name AS Area, (CASE WHEN SUM(recording.length) ISNULL THEN 0 ELSE SUM(recording.length) END)/ 60000 AS Durata
FROM recording JOIN artist_credit ON recording.artist_credit = artist_credit.id
       				JOIN artist_credit_name ON artist_credit.id = artist_credit_name.artist_credit
            			JOIN artist ON artist.id = artist_credit_name.artist
                    		JOIN area ON artist.area = area.id
	 							JOIN area_type ON area.type = area_type.id
WHERE area_type.name = 'Country'
GROUP BY area.name
ORDER BY area.name;

/*
Query 13: (NO PER VERSIONE SOFT):
Ricavare gli artisti britannici che hanno pubblicato almeno 10 release (il risultato deve contenere il nome
dell’artista, il nome dello stato (cioè United Kingdom) e il numero di release) (scrivere due versioni della
query; almeno una delle due versioni non deve utilizzare le viste). */

/*
   1 Le informazioni di cui abbiamo bisogno per questa query sono le tabelle "artist_credit", "artist_credit_name", "artist", "release" e "area"
   2 Controlliamo che nella tabella release(artist_credit) referenzia nella tabella artist_credit(id)
     Controlliamo che nella tabella artist_credit_name(artist_credit) referenzia nella tabella artist_credit(id)
	 Controlliamo che nella tabella artist(id) referenzia nella tabella artist_credit_name(artist)
	 Controlliamo che nella tabella area(id) referenzia nella tabella artist(area)
   3 Per controllare la veridicità della query utilizziamo i vincoli di integrità referenziale tra le tabelle utilizzate (vedasi molteplici JOIN).
     Per controllare di fare assunzioni su artisti britannici abbiamo imposto che "area.name" sia uguale a "United Kingdom"
     Per controllare di fare assunzioni su almeno 10 release abbiamo imposto un vincolo di ">=10" sul costrutto "HAVING COUNT"
   4 Non richiesti valori duplicati/nulli
   5 Prima versione: senza vista
     Seconda versione: con vista
   6 Per controllare meglio il risultato della query abbiamo creato una vista contenente i nomi degli artisti britannici e il loro numero totale di release
     per poi effettuarci una query selezionando gli artisti che hanno rilasciato almeno 10 release. 
*/

-- Senza vista
SELECT artist.name AS Nome_artista, area.name AS Nome_area, COUNT(release.artist_credit)
FROM release JOIN artist_credit ON release.artist_credit = artist_credit.id
       			JOIN artist_credit_name ON artist_credit.id = artist_credit_name.artist_credit
            		JOIN artist ON artist.id = artist_credit_name.artist
                    	JOIN area ON artist.area = area.id
WHERE area.name = 'United Kingdom'
GROUP BY artist.name, area.name
HAVING COUNT(release.artist_credit) >= 10
ORDER BY artist.name; 

-- Con vista
CREATE VIEW Query13 AS SELECT artist.name AS Nome_artista, area.name AS Nome_area, COUNT(release.artist_credit)
FROM release JOIN artist_credit ON release.artist_credit = artist_credit.id
       			JOIN artist_credit_name ON artist_credit.id = artist_credit_name.artist_credit
            		JOIN artist ON artist.id = artist_credit_name.artist
                    	JOIN area ON artist.area = area.id
WHERE area.name = 'United Kingdom'
GROUP BY artist.name, area.name
ORDER BY artist.name;

-- Verifica
SELECT *
FROM Query13
WHERE Query13.count >= 10;

/*
Query 14: (NO PER VERSIONE SOFT):
Considerando il numero medio di tracce tra le release pubblicate su CD, ricavare gli artisti che hanno
pubblicato esclusivamente release con più tracce della media (il risultato deve contenere il nome
dell’artista e il numero di release ed essere ordinato per numero di release discendente) (scrivere due
versioni della query; almeno una delle due versioni non deve utilizzare le viste). */

/*
   1 Le informazioni di cui abbiamo bisogno per questa query sono le tabelle "artist_credit", "artist_credit_name", "artist", "release", "medium_format" e "medium"
   2 Controlliamo che nella tabella release(artist_credit) referenzia nella tabella artist_credit(id)
     Controlliamo che nella tabella artist_credit_name(artist_credit) referenzia nella tabella artist_credit(id)
	 Controlliamo che nella tabella artist(id) referenzia nella tabella artist_credit_name(artist)
	 Controlliamo che nella tabella medium(release) referenzia nella tabella release(id)
	 Controlliamo che nella tabella medium_format(id) referenzia nella tabella medium(format) 
   3 Per controllare la veridicità della query utilizziamo i vincoli di integrità referenziale tra le tabelle utilizzate (vedasi molteplici JOIN).
     Per controllare di fare assunzioni relative alla media di tracce pubblicate su CD utilizziamo il costrutto "WHERE" nel quale eguagliamo
	 "media_format.name" a "CD" e per calcolare la media utilizziamo il costrutto "AVG" sulla sottoquery che abbiamo rideonimanto "SUBQ"
	 Per controllare l'ordinamento decrescente del numero delle release utilizziamo il costrutto "DESC" sul costrutto "ORDER BY COUNT" del numero di artisti accreditati
	 che soddisfano le condizioni precedentemente citate.
   4 Non richiesti valori duplicati/nulli
   5 Prima versione: senza vista
     Seconda versione: con vista
   6 Per controllare meglio il risultato della query abbiamo creato una vista contenente i nomi degli artisti e il totale delle loro release in formato 'CD'
     per poi farci una query per selezionare solo gli artisti che hanno rilasciato un numero di release in formato 'CD' contenenti un numero di track superiore alla media.
*/

-- Senza vista
SELECT artist.name AS Nome_artista, COUNT(release.artist_credit) AS Numero_track
FROM release JOIN artist_credit ON release.artist_credit = artist_credit.id
       			JOIN artist_credit_name ON artist_credit.id = artist_credit_name.artist_credit
            		JOIN artist ON artist.id = artist_credit_name.artist
                		JOIN medium ON medium.release = release.id
                    		JOIN medium_format ON medium.format = medium_format.id
WHERE medium_format.name = 'CD'
GROUP BY artist.name
HAVING COUNT(medium.track_count) > 
(SELECT AVG(medium.track_count)
FROM medium JOIN medium_format on medium_format.id = medium.format
WHERE medium_format.name = 'CD')
ORDER BY count(release.artist_credit) DESC;

-- Con vista 
CREATE VIEW Query14 AS SELECT artist.name AS Nome_artista, COUNT(release.artist_credit) AS Numero_track
FROM release JOIN artist_credit ON release.artist_credit = artist_credit.id
       			JOIN artist_credit_name ON artist_credit.id = artist_credit_name.artist_credit
            		JOIN artist ON artist.id = artist_credit_name.artist
                		JOIN medium ON medium.release = release.id
                    		JOIN medium_format ON medium.format = medium_format.id
WHERE medium_format.name = 'CD'
GROUP BY artist.name
ORDER BY count(release.artist_credit) DESC;

-- Verifica
SELECT Nome_artista, Numero_track
FROM Query14
WHERE Numero_track > (SELECT AVG(medium.track_count)
FROM medium JOIN medium_format on medium_format.id = medium.format
WHERE medium_format.name = 'CD')
ORDER BY Numero_track DESC, Nome_artista;

/*
Query 15: (NO PER VERSIONE SOFT):
Ricavare il primo artista morto dopo Louis Armstrong (il risultato deve contenere il nome dell’artista, la
sua data di nascita e la sua data di morte) (scrivere due versioni della query; almeno una delle due versioni
non deve utilizzare le viste) */

/*
   1 Le informazioni di cui abbiamo bisogno per questa query sono la tabella "artist"
   2 Effettuiamo controlli sugli attributi riguardanti l'anno, il mese e il giorno di morte degli artisti morti dopo la morte di 'Louis Armstrong'
   3 Per controllare la veridicità della query utilizziamo una serie di controlli successivi attraverso l'utilizzo del costrutto "WHERE" nelle sottoquery.
     Il primo controllo va fatto sull'anno di morte di Armstrong.
	 Il secondo controllo va fatto sugli anni di morte successivi alla morte di Armstrong.
	 Il terzo controllo va fatto sul minimo tra gli anni di morte successivi alla morte di Armstrong.
	 Il quarto controllo va fatto sul minimo tra i mesi del minimo tra gli anni di morte successivi alla morte di Armstrong.
	 Il quinto controllo va fatto sul minimo tra i giorni del minimo tra i mesi del minimo tra gli anni di morte successivi alla morte di Armstrong.
   4 Controlliamo che gli attributi di morte "artist.end_date_day", "artist.end_date_month" e "artist.end_date_day" abbiano valore diverso da "null" utilizzando l'operatore "NOTNULL"
   5 Prima versione: casistiche
     Seconda versione: MAKE_DATE, prende in input 3 campi (anno, mese, giorno) e li unisce in un unico campo di tipo "DATE" utilizzabile nelle operazioni
   6 Per controllare meglio il risultato della query abbiamo inserito un controllo finale sull'anno, il mese e il giorno di morte degli artisti affinché debbano
     essere tutti presenti e non possano contenere valore nullo ("null") poiché vogliamo escludere un artista morto nello stesso anno di Armstrong
	 di cui conosciamo solo l'anno, perciò non sappiamo se egli sia morto prima o dopo Armstrong.
	 Inoltre abbiamo fatto una verifica visualizzando il nome, la data di nascita e la data di morte di tutti gli artisti morti dopo Louis Armstrong
*/

-- Prima versione (casistiche)
SELECT artist.name, artist.begin_date_year, artist.begin_date_month,
artist.begin_date_day,  artist.end_date_year, artist.end_date_month,
artist.end_date_day
FROM artist
WHERE artist.end_date_year =
      (SELECT MIN(artist.end_date_year)
      FROM artist
      WHERE artist.end_date_year >
            (SELECT artist.end_date_year
            FROM artist
            WHERE artist.name = 'Louis Armstrong'))
  AND artist.end_date_month =
      (SELECT MIN(artist.end_date_month)
      FROM artist WHERE artist.end_date_year =
                        (SELECT MIN(artist.end_date_year)
                        FROM artist WHERE artist.end_date_year >
                                          (SELECT artist.end_date_year
                                          FROM artist
                                          WHERE artist.name = 'Louis Armstrong')))
  AND artist.end_date_day =
      (SELECT MIN(artist.end_date_day)
      FROM artist
      WHERE artist.end_date_month =
            (SELECT MIN(artist.end_date_month)
            FROM artist
            WHERE artist.end_date_year =
                  (SELECT MIN(artist.end_date_year)
                  FROM artist
                  WHERE artist.end_date_year >
                        (SELECT artist.end_date_year
                        FROM artist
                        WHERE artist.name = 'Louis Armstrong'))))

AND artist.end_date_day NOTNULL AND artist.end_date_month NOTNULL AND artist.end_date_day NOTNULL;

-- Seconda versione (MAKE_DATE)
SELECT artist.name, make_date(artist.begin_date_year, artist.begin_date_month, artist.begin_date_day) AS Data_nascita,
       make_date(artist.end_date_year, artist.end_date_month, artist.end_date_day) AS Data_morte
FROM artist
WHERE make_date(artist.end_date_year, artist.end_date_month, artist.end_date_day) = 
(SELECT MIN(make_date(artist.end_date_year, artist.end_date_month, artist.end_date_day))
FROM artist
WHERE make_date(artist.end_date_year, artist.end_date_month, artist.end_date_day) >
(SELECT make_date(artist.end_date_year, artist.end_date_month, artist.end_date_day)
FROM artist
WHERE artist.name = 'Louis Armstrong'));

-- Verifica
SELECT artist.name, make_date(artist.begin_date_year, artist.begin_date_month, artist.begin_date_day) AS Data_nascita,
       make_date(artist.end_date_year, artist.end_date_month, artist.end_date_day) AS Data_morte
FROM artist
WHERE make_date(artist.end_date_year, artist.end_date_month, artist.end_date_day) >
(SELECT make_date(artist.end_date_year, artist.end_date_month, artist.end_date_day)
FROM artist
WHERE artist.name = 'Louis Armstrong')
ORDER BY artist.end_date_year;

/*
Query 16 (NO PER VERSIONE SOFT):
Elencare le coppie di artisti che non hanno mai collaborato tra di loro ma hanno collaborato con un
medesimo terzo artista in una release o in una registrazione (il risultato deve comprendere i nomi delle
coppie di artisti e essere ordinato per i loro nomi) (scrivere due versioni della query; almeno una delle
due versioni non deve utilizzare le viste).
*/

/* L'idea di base che avevamo su come fare questa query era quella di dividere l'intero problema in sottoproblemi (eventualmente delle viste) sui quali fare una query:
   - Cercare tutte le coppie di artisti che hanno collaborato insieme in una release o in una recording (escludendo la collaborazione di un artista con se stesso)
   - Cercare tutte le coppie di artisti che non hanno mai collaborato tra loro o in una release o in una recording 
   Inoltre avevamo pensato di utilizzare il costrutto del "FULL OUTER JOIN", ma con "EXCEPT" "INTERSECT" ovvero:
   
   SELECT <select list>
   FROM TableA A FULL OUTER JOIN TableB B ON A.Key = B.Key
   WHERE A.Key IS NULL OR B.Key IS NULL;  
*/

/* Query 17 (NO PER VERSIONE SOFT):
Trovare il nome e la lunghezza della traccia più lunga appartenente a una release rilasciata in almeno due
paesi (il risultato deve contenere il nome della traccia e la sua lunghezza in secondi) (scrivere due versioni
della query). */

/*
   1 Le informazioni di cui abbiamo bisogno per questa query sono la tabella "track", "recording", "release", "artist_credit", "release_country", "country_area", "area" e "medium"
   2 Controlliamo che nella tabella medium(id) referenzia nella tabella track(medium)
     Controlliamo che nella tabella recording(id) referenzia nella track(recording)
     Controlliamo che nella tabella artist_credit(id) referenzia nella tabella recording(artist_credit)
	 Controlliamo che nella tabella release(artist_credit) referenzia nella tabella artist_credit(id)
	 Controlliamo che nella tabella release_country(release) referenzia nella tabella release(id)
	 Controlliamo che nella tabella country_area(area) referenzia nella tabella release_country(country)
	 Controlliamo che nella tabella area(id) referenzia nella tabella country_area(area)
   3 Per controllare la veridicità della query utilizziamo i vincoli di integrità referenziale tra le tabelle utilizzate (vedasi molteplici JOIN).
     Per controllare la veridicità della query utilizziamo una serie di controlli successivi attraverso l'utilizzo del costrutto "WHERE" nelle sottoquery.
     Il primo controllo va fatto sulle release rilasciate in almeno 2 stati.
	 Il secondo controllo va fatto sulla traccia di durata maggiore tra quelle filtrate precedentemente.
   4 Utilizziamo il costrutto "DISTINCT" per filtrare sui nomi delle track 
   5 Prima versione: senza vista
     Seconda versione: con vista
   6 Per controllare meglio il risultato della query abbiamo eseguito una verifica attraverso una query che visualizza la durata e il nome della traccia
     che ha lunghezza maggiore tra tutte quelle rilasciate il almeno 2 Stati nella vista "Query17".
*/

-- Senza vista
SELECT DISTINCT track.name, track.length / 60000 AS Durata
FROM medium JOIN track ON medium.id = track.medium
				 JOIN recording ON track.recording = recording.id
           			JOIN artist_credit ON recording.artist_credit = artist_credit.id
           				JOIN release ON artist_credit.id = release.artist_credit
           					JOIN release_country ON release.id = release_country.release
           						JOIN country_area ON release_country.country = country_area.area
           							JOIN area ON country_area.area = area.id
WHERE track.length =
    (SELECT MAX(track.length)
    FROM medium JOIN track ON medium.id = track.medium
				 JOIN recording ON track.recording = recording.id
          			JOIN artist_credit ON recording.artist_credit = artist_credit.id
          				JOIN release ON artist_credit.id = release.artist_credit
          					JOIN release_country ON release.id = release_country.release
    WHERE release_country.release IN
    (SELECT release
    FROM release_country
    GROUP BY release
    HAVING COUNT(release) >= 2
	));
	
-- Con vista
CREATE VIEW Query17 AS SELECT track.name, track.length AS length -- Niente cast per evidenziare chiaramente la più lunga in millisecondi
						FROM medium JOIN track ON medium.id = track.medium
				 			JOIN recording ON track.recording = recording.id
           						JOIN artist_credit ON recording.artist_credit = artist_credit.id
           							JOIN release ON artist_credit.id = release.artist_credit
           								JOIN release_country ON release.id = release_country.release
           									JOIN country_area ON release_country.country = country_area.area
           										JOIN area ON country_area.area = area.id
WHERE release_country.release IN
	(SELECT release
	FROM release_country
	GROUP BY release
	HAVING COUNT(release) >= 2)
GROUP BY track.name, track.length
ORDER BY track.length DESC;

-- Verifica
SELECT length / 60000 AS Durata, name AS Nome_track
FROM Query17
WHERE length IN (SELECT MAX(length) 
				 FROM Query17)
