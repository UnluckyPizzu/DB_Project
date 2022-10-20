INSERT INTO Utente Values ('emilipizzuto99@gmail.com','19/06/1999','Emilio','Pizzuto','true','Trecate',8,'Giovanni dalle bande nere',28069);
INSERT INTO Utente Values ('beatricebeltr@gmail.com','27/03/1920','Beatrice','Beltrami','true','Cavaglià',40,'Casa Moretta',13811) ;
INSERT INTO Utente Values ('GengisKhan@gmail.com','05/08/1945','Marco','Ascia','false','Galliate',3,'Amore',28066) ;
INSERT INTO Utente Values ('Umberto11@gmail.com','13/03/1945','Umberto','Ripetente','false','Galliate',7,'Amore',28066);
INSERT INTO Utente Values ('Fortnite@hotmail.it','04/06/1976','Francesco','Fornara','true','Novara',8,'Amici del mulino',28100);
INSERT INTO Utente Values ('Albyalby@hotmail.it','23/09/1994','Alberto','Romeo','true','Torino',5,'Corso Francia',10122);
INSERT INTO Utente Values ('Chungus@gmail.com','27/05/1973','Andrea','Crisci','false','Novara',3,'Solitudine',28100);
INSERT INTO Utente Values ('Massandre@hotmail.it','30/01/1967','Andrea','Massaro','true','Novara',4,'Monte Bianco',28100);
INSERT INTO Utente Values ('Projectpacca@hotmail.it','21/05/1976','Stefano','Crotti','false','Trecate',7,'Roma',28069);
INSERT INTO Utente Values ('Madosca@gmail.com','11/01/1964','Massimo','Pizzuto','true','Trecate',8,'Giovanni dalle bande nere',28069);

INSERT INTO Proprietario Values (DEFAULT,22,100,90,10,'emilipizzuto99@gmail.com');
INSERT INTO Proprietario Values (DEFAULT,8,98,15,10,'Fortnite@hotmail.it');
INSERT INTO Proprietario Values (DEFAULT,25,99,81,13,'beatricebeltr@gmail.com');
INSERT INTO Proprietario Values (DEFAULT,12,89,16,8,'GengisKhan@gmail.com');

INSERT INTO Lingua Values (DEFAULT,'Inglese');
INSERT INTO Lingua Values (DEFAULT,'Francese');
INSERT INTO Lingua Values (DEFAULT,'Spagnolo');
INSERT INTO Lingua Values (DEFAULT,'Italiano');
INSERT INTO Lingua Values (DEFAULT,'Russo');
INSERT INTO Lingua Values (DEFAULT,'Tedesco');
INSERT INTO Lingua Values (DEFAULT,'Cinese');
INSERT INTO Lingua Values (DEFAULT,'Polacco');
INSERT INTO Lingua Values (DEFAULT,'Arabo');
INSERT INTO Lingua Values (DEFAULT,'Portoghese');

INSERT INTO Tipo_letto Values (DEFAULT,'Letto singolo');
INSERT INTO Tipo_letto Values (DEFAULT,'Letto matrimoniale'); 
INSERT INTO Tipo_letto Values (DEFAULT,'Letto singolo, Letto matrimoniale');

INSERT INTO Alloggio Values (DEFAULT,'Splendida casa sull albero','Vista eccezionale',2,3,3,2,120,30,20,100,'Flessibili','Villa','Privata',1,'Trecate',6,'Bambini dei fiori',3,1,28069,'12:00:00','15:00:00');
INSERT INTO Alloggio Values (DEFAULT,'Porto della risaia','Perfetto clima familiare',3,5,5,4,250,60,40,130,'Rigida','Villa','Privata',2,'Cavaglià',5,'Sentiero dei caduti',3,3,13811,'10:00:00','16:00:00');
INSERT INTO Alloggio Values (DEFAULT,'Studio in centro','Riservato',1,2,1,1,50,20,10,30,'Moderati','Stanza','Intero',1,'Galliate',3,'Madre della notte',1,2,28066,'10:00:00','13:00:00');
INSERT INTO Alloggio Values (DEFAULT,'Vintage house','Casa antica dentro al castello',5,7,7,5,1500,300,250,700,'Rigida','Villa','Privata',2,'Cavaglià',5,'Dei reali',3,3,13811,'11:00:00','10:00:00');
INSERT INTO Alloggio Values (DEFAULT,'Stanza romantica','Perfetta stanza per un week-end di fuoco',1,2,2,1,300,40,80,130,'Moderati','Stanza','Intero',1,'Galliate',3,'Degli condomini',2,4,28066,'09:45:00','14:20:00');

INSERT INTO Stanza Values (DEFAULT,1,300,2,40,80,130,'Moderati','Perfetta stanza per un week-end di fuoco','Stanza romantica',5,2);
INSERT INTO Stanza Values (DEFAULT,3, 400,2,100,80,150,'Rigida','Stanza matrimoniale nella sala ducale','Vintage moment',4,2);
INSERT INTO Stanza Values (DEFAULT,1, 400,2,90,60,100,'Rigida','Stanza per due persone separate nella sala del principe','Vintage moment',4,1);
INSERT INTO Stanza Values (DEFAULT,2, 250,3,70,50,70,'Flessibile','Stanza per due persone e 1 un letto separato','Family moment',2,3);
INSERT INTO Stanza Values (DEFAULT,2,200,2,80,50,70,'Flessibile','Stanza per due persone su casa sull albero','High level experience',1,1);
INSERT INTO Stanza Values (DEFAULT,1,250,2,120,60,80,'Moderati','Stanza matrimoniale sull albero','High level experience',1,2);

INSERT INTO Prenotazione_stanza Values (DEFAULT,'23/10/2017','30/10/2017',3,'Madosca@gmail.com');
INSERT INTO Prenotazione_stanza Values (DEFAULT,'21/06/2018','21/07/2018',2,'Umberto11@gmail.com');
INSERT INTO Prenotazione_stanza Values (DEFAULT,'12/03/2016','15/03/2016',2,'Projectpacca@hotmail.it');
INSERT INTO Prenotazione_stanza Values (DEFAULT,'18/01/2020','02/02/2020',1,'Chungus@gmail.com');
INSERT INTO Prenotazione_stanza Values (DEFAULT,'07/05/2010','07/07/2010',1,'Chungus@gmail.com');

INSERT INTO Prenotazione_alloggio Values (DEFAULT,'14/07/2014','30/08/2014',2,'Massandre@hotmail.it');
INSERT INTO Prenotazione_alloggio Values (DEFAULT,'20/05/2008','21/01/2009',4,'Albyalby@hotmail.it');
INSERT INTO Prenotazione_alloggio Values (DEFAULT,'10/04/2013','15/06/2013',2,'Umberto11@gmail.com');
INSERT INTO Prenotazione_alloggio Values (DEFAULT,'15/06/2020','16/06/2020',3,'Fortnite@hotmail.it');
INSERT INTO Prenotazione_alloggio Values (DEFAULT,'23/03/2014','28/04/2014',1,'Fortnite@hotmail.it');

INSERT INTO Servizio Values (DEFAULT,'Internet');
INSERT INTO Servizio Values (DEFAULT,'Ascensore');
INSERT INTO Servizio Values (DEFAULT,'Family friendly');
INSERT INTO Servizio Values (DEFAULT,'Piscina');
INSERT INTO Servizio Values (DEFAULT,'Camino');
INSERT INTO Servizio Values (DEFAULT,'Barbecue');
INSERT INTO Servizio Values (DEFAULT,'Shampoo');
INSERT INTO Servizio Values (DEFAULT,'Colazione');
INSERT INTO Servizio Values (DEFAULT,'Forno');
INSERT INTO Servizio Values (DEFAULT,'Bicicletta');

INSERT INTO Recensione_cliente_stanza Values (DEFAULT,2,'La casa era lasciata in condizione pessime',2);
INSERT INTO Recensione_cliente_stanza Values (DEFAULT,4,'La casa era lasciata in condizione buone',5);
INSERT INTO Recensione_cliente_stanza Values (DEFAULT,5,'La casa era lasciata in condizione ottime',3);
INSERT INTO Recensione_cliente_stanza Values (DEFAULT,2,'La casa era lasciata in condizione pessime',1);
INSERT INTO Recensione_cliente_stanza Values (DEFAULT,3,'La casa era lasciata in condizione accettabile',4);

INSERT INTO Recensione_cliente_alloggio Values (DEFAULT,3,'La casa era lasciata in condizione mediocre',3);
INSERT INTO Recensione_cliente_alloggio Values (DEFAULT,1,'La casa era lasciata in condizione orribile, mai più in caa mia',2);
INSERT INTO Recensione_cliente_alloggio Values (DEFAULT,4,'La casa era lasciata in condizione buone',1);
INSERT INTO Recensione_cliente_alloggio Values (DEFAULT,2,'La casa era lasciata in condizione pessime',4);
INSERT INTO Recensione_cliente_alloggio Values (DEFAULT,3,'La casa era lasciata in condizione accettabile',5);

INSERT INTO Recensione_stanza Values (DEFAULT,4,'L appartamento è in una posizione (Website hidden by Airbnb) pieno centro ma anche vicino alla stazione treni....... Inoltre è spazioso ed elegante. Pulizia ottima.',2);
INSERT INTO Recensione_stanza Values (DEFAULT,5,'Un appartamentino accogliente e pulito, a pochi passi da qualsiasi punto d interesse di Galliate. Marco disponibile e reperibile in qualsiasi momento.',1);
INSERT INTO Recensione_stanza Values (DEFAULT,1,'Questa proprietà non corrisponde esattamente all’annuncio. Tanto per iniziare, il proprietario vive al piano di sotto con due bimbi piccoli, cosa che l’annuncio non menziona da nessuna parte.',3);
INSERT INTO Recensione_stanza Values (DEFAULT,2,'Sono probabilmente i letti peggiori in cui abbiamo mai dormito.',5);
INSERT INTO Recensione_stanza Values (DEFAULT,5,'Che bello! Bella casa, buonissima la colazione.',4);

INSERT INTO Recensione_alloggio Values (DEFAULT,3,'Accoglienza eccezionale. Molto confortevole.',1);
INSERT INTO Recensione_alloggio Values (DEFAULT,1,'Questa proprietà non corrisponde esattamente all’annuncio. Tanto per iniziare, il proprietario vive al piano di sotto con due bimbi piccoli, cosa che l’annuncio non menziona da nessuna parte.',3);
INSERT INTO Recensione_alloggio Values (DEFAULT,4,'Soggiorno stupendo con delle persone altrettanto speciali!!Casa accogliente, comodissima, curata.',5);
INSERT INTO Recensione_alloggio Values (DEFAULT,1,'A parte alcuni ospiti in cerca di una vacanza lontani dalla tecnologia, la maggior parte dei viaggiatori si aspettano una buona connessione in qualsiasi casa vacanze.',2);
INSERT INTO Recensione_alloggio Values (DEFAULT,5,'Un soggiorno unico. Super consigliato !',4);

INSERT INTO Parla Values (1,'Madosca@gmail.com');
INSERT INTO Parla Values (3,'beatricebeltr@gmail.com');
INSERT INTO Parla Values (6,'GengisKhan@gmail.com');
INSERT INTO Parla Values (1,'emilipizzuto99@gmail.com');
INSERT INTO Parla Values (2,'Albyalby@hotmail.it');
INSERT INTO Parla Values (7,'emilipizzuto99@gmail.com');
INSERT INTO Parla Values (9,'GengisKhan@gmail.com');
INSERT INTO Parla Values (10,'Fortnite@hotmail.it');
INSERT INTO Parla Values (3,'Massandre@hotmail.it');
INSERT INTO Parla Values (2,'beatricebeltr@gmail.com');
INSERT INTO Parla Values (1,'Projectpacca@hotmail.it');
INSERT INTO Parla Values (3,'Madosca@gmail.com');
INSERT INTO Parla Values (6,'Fortnite@hotmail.it');
INSERT INTO Parla Values (1,'Umberto11@gmail.com');
INSERT INTO Parla Values (2,'Umberto11@gmail.com');

INSERT INTO Servizio_stanza Values (1,3);
INSERT INTO Servizio_stanza Values (5,2);
INSERT INTO Servizio_stanza Values (2,3);
INSERT INTO Servizio_stanza Values (3,5);
INSERT INTO Servizio_stanza Values (1,4);
INSERT INTO Servizio_stanza Values (2,4);
INSERT INTO Servizio_stanza Values (9,2);
INSERT INTO Servizio_stanza Values (6,2);
INSERT INTO Servizio_stanza Values (6,5);
INSERT INTO Servizio_stanza Values (8,3);

INSERT INTO Servizio_alloggio Values (4,3);
INSERT INTO Servizio_alloggio Values (3,1);
INSERT INTO Servizio_alloggio Values (2,4);
INSERT INTO Servizio_alloggio Values (5,4);
INSERT INTO Servizio_alloggio Values (1,1);
INSERT INTO Servizio_alloggio Values (8,2);
INSERT INTO Servizio_alloggio Values (9,5);
INSERT INTO Servizio_alloggio Values (3,5);
INSERT INTO Servizio_alloggio Values (5,3);
INSERT INTO Servizio_alloggio Values (3,2);

INSERT INTO Risposta_alloggio_privata Values (DEFAULT,'Grazie mille',5);
INSERT INTO Risposta_alloggio_privata Values (DEFAULT,'Ci dispiace per l inconveniente',4);
INSERT INTO Risposta_alloggio_privata Values (DEFAULT,'Venite presto!',3);

INSERT INTO Risposta_alloggio_pubblica Values (DEFAULT,'Grazie mille',1);
INSERT INTO Risposta_alloggio_pubblica Values (DEFAULT,'Ci dispiace per l inconveniente',2);

INSERT INTO Risposta_cliente_alloggio Values (DEFAULT,'ok boomer',5);
INSERT INTO Risposta_cliente_alloggio Values (DEFAULT,'Grazie mille',3);
INSERT INTO Risposta_cliente_alloggio Values (DEFAULT,'Ma va a quel paese',2);

INSERT INTO Risposta_cliente_stanza Values (DEFAULT,'di nulla, era tutto fantastico e non volevo rovinare nulla',3);
INSERT INTO Risposta_cliente_stanza Values (DEFAULT,'Prossima volta ti rubo persino il lampadario',1);
INSERT INTO Risposta_cliente_stanza Values (DEFAULT,'scusate se era un pelino in disordine',5);

INSERT INTO Risposta_stanza_privata Values (DEFAULT,'Grazie mille',2);
INSERT INTO Risposta_stanza_privata Values (DEFAULT,'Mi dispiace se la descrizione non sembrava veritiera',3);
INSERT INTO Risposta_stanza_privata Values (DEFAULT,'Vi aspetto per la prossima volta',1);

INSERT INTO Risposta_stanza_pubblica Values (DEFAULT,'Avete dei consigli da darci?',5);
INSERT INTO Risposta_stanza_pubblica Values (DEFAULT,'la preghiamo di cancellare il commento e di darsi una calmata',4);
