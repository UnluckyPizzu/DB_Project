
-- Operazione 1: un utente prenota un alloggio
INSERT INTO Prenotazione_alloggio Values (DEFAULT,'24/07/2020','21/01/2021',4,'Madosca@gmail.com');

-- Operazione 2: un utente scrive una recensione relativa ad una stanza (abbiamo inserito una prenotazione perchè ogni recensione corrisponde ad una ed una sola prenotazione)
INSERT INTO Prenotazione_stanza Values (DEFAULT,'25/12/2020','01/01/2021',2,'Projectpacca@hotmail.it');
INSERT INTO Recensione_stanza Values (DEFAULT,4,'Che bello! Bella casa.',6);

-- Operazione 3: memorizza un nuovo alloggio con il nome del relativo proprietario
INSERT INTO Alloggio Values (DEFAULT,'Attico di lusso','Intimo',3,5,5,3,900,100,200,200,'Moderati','Appartamento','Intero',2,'Galliate',5,'Meraviglia',3,3,28066,'09:00:00','15:00:00');

-- Operazione 4: stampa tutti i dati di un proprietario
SELECT *
FROM proprietario
WHERE Id_proprietario = 1;

-- Operazione 5: stampare tutte le recensioni di una stanza con relativa data di inizio e data di fine prenotazione
SELECT recensione_stanza.Id_recensione_stanza,recensione_stanza.Commento, recensione_stanza.Valutazione, prenotazione_stanza.data_inizio, prenotazione_stanza.data_fine
FROM recensione_stanza JOIN Prenotazione_stanza ON recensione_stanza.prenotazione_stanza = Prenotazione_stanza.Numero_prenotazione_stanza
						JOIN Stanza on Prenotazione_stanza.stanza = Stanza.id_stanza
WHERE id_stanza = 2;

-- Operazione 6: stampare tutte le prenotazioni di una stanza
SELECT prenotazione_stanza.numero_prenotazione_stanza,prenotazione_stanza.data_inizio, prenotazione_stanza.data_fine, prenotazione_stanza.utente
FROM Prenotazione_stanza JOIN Stanza on Prenotazione_stanza.stanza = Stanza.id_stanza
WHERE id_stanza = 1;

-- Creazione di una vista contenente tutti i proprietari che sono anche superhost
CREATE VIEW Superhost AS 
SELECT * 
FROM Proprietario 
WHERE Esperienza >= 10 AND Tasso_Risposta >= 90 AND five_stars_review >= 80 AND Impegno < 15;

-- Elimina la lingua 'Cinese' 
DELETE FROM lingua
WHERE lingua.nome = 'Cinese';

-- Operazione di verifica dei requisiti iniziali e relativi vincoli di integrità referenziale: quando un cliente si cancella dal servizio, le sue recensioni e le risposte ricevute relativamente ad esse rimangono memorizzate mentre i suoi dati personali vengono cancellati.
-- Supponiamo di eliminare solamente il seguente utente ('Umberto11@gmail.com'), il quale non ha ricevuto nessuna "Risposta_stanza_pubblica" nella nostra base di dati
DELETE FROM Utente WHERE Email = 'Umberto11@gmail.com';

-- Verifichiamo che tutti i vincoli di integrità referenziale (chiavi esterne) siano effettivamente funzionanti
SELECT Prenotazione_stanza.numero_prenotazione_stanza, recensione_stanza.id_recensione_stanza, recensione_cliente_stanza.Id_recensione_cliente_stanza, Risposta_cliente_stanza.Id_risposta_cliente_stanza, Risposta_stanza_privata.Id_risposta_stanza_privata
FROM Prenotazione_stanza JOIN Recensione_cliente_stanza ON Prenotazione_stanza.numero_prenotazione_stanza = Recensione_cliente_stanza.prenotazione_stanza 
							JOIN Risposta_cliente_stanza ON recensione_cliente_stanza.Id_recensione_cliente_stanza = Risposta_cliente_stanza.recensione_cliente_stanza
								JOIN Recensione_stanza ON Prenotazione_stanza.numero_prenotazione_stanza = Recensione_stanza.prenotazione_stanza
										JOIN Risposta_stanza_privata ON Recensione_stanza.id_recensione_stanza = Risposta_stanza_privata.recensione_stanza					
WHERE Prenotazione_stanza.Utente IS NULL;

-- Operazione di aggiornamento della chiave primaria ('Email') di una ennupla di un "Utente" verificando la sua modifica anche nella tabella di "Proprietario" grazie ai vincoli di integrità referenziale presenti tra "Proprietario" e "Utente" (in questo specifico è stato scelto un utente che era anche proprietario)
UPDATE utente
SET Email = 'emiliopizzuto99@gmail.com'
WHERE Email = 'emilipizzuto99@gmail.com';

-- Prenotazione per verificare che la data di fine prenotazione deve essere >= della data di inizio prenotazione; Lo stiamo verificando con questa inserzione
INSERT INTO Prenotazione_alloggio Values (DEFAULT,'24/07/2021','21/01/2020',4,'Madosca@gmail.com');

-- Eliminiamo un proprietario (da utente, così verifico anche che si cancelli sia da utente sia da proprietario), in questo modo, secondo i vincoli di integrità referenziale da noi posti, verranno cancellate tutte le stanze e tutti gli alloggi da lui posseduti nella base di dati
-- Verranno cancellati l'alloggio con id "1", di cui è proprietario e, di conseguenza, le stanze con id "5" e "6" appartenenti al medesimo alloggio
DELETE FROM Utente WHERE Email = 'emiliopizzuto99@gmail.com'; 

