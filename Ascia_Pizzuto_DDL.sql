CREATE DATABASE airbnb;

CREATE TABLE Utente(
Email VARCHAR(100) PRIMARY KEY,
Data_nascita DATE NOT NULL,
Nome VARCHAR(20) NOT NULL,
Cognome VARCHAR(20) NOT NULL,
Foto_profilo boolean NOT NULL,
Città VARCHAR(20) NOT NULL,
N_civico INTEGER NOT NULL DEFAULT 1,
Via VARCHAR(100) NOT NULL,
CAP INTEGER NOT NULL
);

CREATE SEQUENCE Id_lingua
INCREMENT BY 1
START WITH 1;

CREATE TABLE Lingua(
Id_lingua INTEGER DEFAULT nextval('Id_lingua') PRIMARY KEY,
Nome VARCHAR(20) NOT NULL
);

CREATE SEQUENCE Id_proprietario
INCREMENT BY 1
START WITH 1;

CREATE TABLE Proprietario(
Id_proprietario INTEGER DEFAULT nextval('Id_proprietario') PRIMARY KEY,
Esperienza INTEGER DEFAULT 0,
Tasso_risposta INTEGER DEFAULT 0,
Five_stars_review INTEGER DEFAULT 0,
Impegno INTEGER DEFAULT 0,
Email VARCHAR(100) NOT NULL REFERENCES Utente(Email) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE SEQUENCE Id_tipo_letto
INCREMENT BY 1
START WITH 1;

CREATE TABLE Tipo_letto(
Id_tipo_letto INTEGER DEFAULT nextval('Id_tipo_letto') PRIMARY KEY,
Nome VARCHAR(50) NOT NULL
);

CREATE SEQUENCE Id_alloggio
INCREMENT BY 1
START WITH 1;

CREATE TABLE Alloggio(
Id_alloggio INTEGER DEFAULT nextval('Id_alloggio') PRIMARY KEY,
Titolo VARCHAR(100) NOT NULL,
Descrizione VARCHAR(100),
Camere_letto INTEGER NOT NULL CHECK(Camere_letto>0),
N_stanze INTEGER NOT NULL CHECK(N_stanze>0 AND N_stanze >=  Camere_letto),
N_posti_letto INTEGER NOT NULL CHECK(N_posti_letto>0 AND N_posti_letto >=  Camere_letto ),
N_letti INTEGER NOT NULL CHECK(N_letti>0),
Costo_prenotazione INTEGER NOT NULL,
Ospiti_extra INTEGER NOT NULL,
Spese_pulizia INTEGER NOT NULL,
Cauzione INTEGER NOT NULL,
Termini_cancellazione VARCHAR(20) NOT NULL,
Tipo_alloggio VARCHAR(20) NOT NULL,
Tipologia_alloggio VARCHAR(20) NOT NULL,
Bagni INTEGER NOT NULL CHECK(Bagni>0),
Città VARCHAR(20) NOT NULL,
N_civico INTEGER NOT NULL DEFAULT 1,
Via VARCHAR(100) NOT NULL,
Tipo_letto INTEGER NOT NULL REFERENCES Tipo_letto(Id_tipo_letto) ON UPDATE CASCADE ON DELETE NO ACTION,
Proprietario INTEGER NOT NULL REFERENCES Proprietario(Id_proprietario) ON UPDATE CASCADE ON DELETE CASCADE,
CAP INTEGER NOT NULL,
Check_in TIME NOT NULL,
Check_out TIME NOT NULL
);

CREATE SEQUENCE Id_stanza
INCREMENT BY 1
START WITH 1;

CREATE TABLE Stanza(
Id_stanza INTEGER DEFAULT nextval('Id_stanza') PRIMARY KEY,
N_stanza INTEGER NOT NULL CHECK(N_stanza>0),
Costo_prenotazione INTEGER NOT NULL,
N_posti_letto INTEGER NOT NULL CHECK(N_posti_letto > 0),
Ospiti_extra INTEGER NOT NULL,
Spese_pulizia INTEGER NOT NULL,
Cauzione INTEGER NOT NULL,
Termini_cancellazione VARCHAR(20) NOT NULL,
Descrizione VARCHAR(100),
Titolo VARCHAR(100) NOT NULL,
Alloggio INTEGER NOT NULL REFERENCES Alloggio(Id_alloggio) ON UPDATE CASCADE ON DELETE CASCADE,
Tipo_letto INTEGER NOT NULL REFERENCES Tipo_letto(Id_tipo_letto) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE SEQUENCE Numero_prenotazione_stanza
INCREMENT BY 1
START WITH 1;

CREATE TABLE Prenotazione_stanza(
Numero_prenotazione_stanza INTEGER DEFAULT nextval('Numero_prenotazione_stanza') PRIMARY KEY,
Data_inizio DATE NOT NULL,
Data_fine DATE NOT NULL CHECK(Data_fine >= Data_inizio),
Stanza INTEGER NOT NULL REFERENCES Stanza(Id_stanza) ON UPDATE CASCADE ON DELETE CASCADE,
Utente VARCHAR(100) REFERENCES Utente(Email) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE SEQUENCE Numero_prenotazione_alloggio
INCREMENT BY 1
START WITH 1;

CREATE TABLE Prenotazione_alloggio(
Numero_prenotazione_alloggio INTEGER DEFAULT nextval('Numero_prenotazione_alloggio') PRIMARY KEY,
Data_inizio DATE NOT NULL ,
Data_fine DATE NOT NULL CHECK(Data_fine >= Data_inizio),
Alloggio INTEGER NOT NULL REFERENCES Alloggio(Id_Alloggio) ON UPDATE CASCADE ON DELETE CASCADE,
Utente VARCHAR(100) REFERENCES Utente(Email) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE SEQUENCE Id_servizio
INCREMENT BY 1
START WITH 1;

CREATE TABLE Servizio(
Id_servizio INTEGER DEFAULT nextval('Id_servizio') PRIMARY KEY,
Nome VARCHAR(20) NOT NULL
);

CREATE SEQUENCE Id_recensione_cliente_stanza
INCREMENT BY 1
START WITH 1;

CREATE TABLE Recensione_cliente_stanza(
Id_recensione_cliente_stanza INTEGER DEFAULT nextval('Id_recensione_cliente_stanza') PRIMARY KEY,
Valutazione INTEGER NOT NULL CHECK(Valutazione >= 1 AND Valutazione <= 5),
Commento VARCHAR(500),
Prenotazione_stanza INTEGER REFERENCES Prenotazione_stanza(Numero_prenotazione_stanza) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE SEQUENCE Id_risposta_cliente_stanza
INCREMENT BY 1
START WITH 1;

CREATE TABLE Risposta_cliente_stanza(
Id_risposta_cliente_stanza INTEGER DEFAULT nextval('Id_risposta_cliente_stanza') PRIMARY KEY,
Commento VARCHAR(500) NOT NULL,
Recensione_cliente_stanza INTEGER REFERENCES Recensione_cliente_stanza(Id_recensione_cliente_stanza) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE SEQUENCE Id_recensione_stanza
INCREMENT BY 1
START WITH 1;

CREATE TABLE Recensione_stanza(
Id_recensione_stanza INTEGER DEFAULT nextval('Id_recensione_stanza') PRIMARY KEY,
Valutazione INTEGER NOT NULL CHECK(Valutazione >= 1 AND Valutazione <= 5),
Commento VARCHAR(500),
Prenotazione_stanza INTEGER REFERENCES Prenotazione_stanza(Numero_prenotazione_stanza) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE SEQUENCE Id_risposta_stanza_pubblica
INCREMENT BY 1
START WITH 1;

CREATE TABLE Risposta_stanza_pubblica(
Id_risposta_stanza_pubblica INTEGER DEFAULT nextval('Id_risposta_stanza_pubblica') PRIMARY KEY,
Commento VARCHAR(500) NOT NULL,
Recensione_stanza INTEGER REFERENCES Recensione_stanza(Id_recensione_stanza) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE SEQUENCE Id_risposta_stanza_privata
INCREMENT BY 1
START WITH 1;

CREATE TABLE Risposta_stanza_privata(
Id_risposta_stanza_privata INTEGER DEFAULT nextval('Id_risposta_stanza_privata') PRIMARY KEY,
Commento VARCHAR(500) NOT NULL,
Recensione_stanza INTEGER REFERENCES Recensione_stanza(Id_recensione_stanza) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE SEQUENCE Id_recensione_cliente_alloggio
INCREMENT BY 1
START WITH 1;

CREATE TABLE Recensione_cliente_alloggio(
Id_recensione_cliente_alloggio INTEGER DEFAULT nextval('Id_recensione_cliente_alloggio') PRIMARY KEY,
Valutazione INTEGER NOT NULL CHECK(Valutazione >= 1 AND Valutazione <= 5),
Commento VARCHAR(500),
Prenotazione_alloggio INTEGER REFERENCES Prenotazione_alloggio(Numero_prenotazione_alloggio) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE SEQUENCE Id_risposta_cliente_alloggio
INCREMENT BY 1
START WITH 1;


CREATE TABLE Risposta_cliente_alloggio(
Id_risposta_cliente_alloggio INTEGER DEFAULT nextval('Id_risposta_cliente_alloggio') PRIMARY KEY,
Commento VARCHAR(500) NOT NULL,
Recensione_cliente_alloggio INTEGER REFERENCES Recensione_cliente_alloggio(Id_recensione_cliente_alloggio) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE SEQUENCE Id_recensione_alloggio
INCREMENT BY 1
START WITH 1;

CREATE TABLE Recensione_alloggio(
Id_recensione_alloggio INTEGER DEFAULT nextval('Id_recensione_alloggio') PRIMARY KEY,
Valutazione INTEGER NOT NULL CHECK(Valutazione >= 1 AND Valutazione <= 5),
Commento VARCHAR(500),
Prenotazione_alloggio INTEGER REFERENCES Prenotazione_alloggio(Numero_prenotazione_alloggio) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE SEQUENCE Id_risposta_alloggio_pubblica
INCREMENT BY 1
START WITH 1;

CREATE TABLE Risposta_alloggio_pubblica(
Id_risposta_alloggio_pubblica INTEGER DEFAULT nextval('Id_risposta_alloggio_pubblica') PRIMARY KEY,
Commento VARCHAR(500) NOT NULL,
Recensione_alloggio INTEGER REFERENCES Recensione_alloggio(Id_recensione_alloggio) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE SEQUENCE Id_risposta_alloggio_privata
INCREMENT BY 1
START WITH 1;

CREATE TABLE Risposta_alloggio_privata(
Id_risposta_alloggio_privata INTEGER DEFAULT nextval('Id_risposta_alloggio_privata') PRIMARY KEY,
Commento VARCHAR(500) NOT NULL,
Recensione_alloggio INTEGER REFERENCES Recensione_alloggio(Id_recensione_alloggio) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE Parla(
Lingua INTEGER NOT NULL REFERENCES Lingua(Id_lingua) ON UPDATE CASCADE ON DELETE CASCADE,
Utente VARCHAR(100) NOT NULL REFERENCES Utente(Email) ON UPDATE CASCADE ON DELETE CASCADE,
PRIMARY KEY(Lingua, Utente)
);

CREATE TABLE Servizio_stanza(
Servizio INTEGER NOT NULL REFERENCES Servizio(Id_servizio) ON UPDATE CASCADE ON DELETE CASCADE,
Stanza INTEGER NOT NULL REFERENCES Stanza(Id_stanza) ON UPDATE CASCADE ON DELETE CASCADE,
PRIMARY KEY(Servizio, Stanza)
);

CREATE TABLE Servizio_alloggio(
Servizio INTEGER NOT NULL REFERENCES Servizio(Id_servizio) ON UPDATE CASCADE ON DELETE CASCADE,
Alloggio INTEGER NOT NULL REFERENCES Alloggio(Id_alloggio) ON UPDATE CASCADE ON DELETE CASCADE,
PRIMARY KEY(Servizio, Alloggio)
);
