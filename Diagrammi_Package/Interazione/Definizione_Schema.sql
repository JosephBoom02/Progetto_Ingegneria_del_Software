CREATE TABLE "UtenteRegistrato" (
	"ID"  integer  NOT NULL PRIMARY KEY,
	"USERNAME" varchar(30) UNIQUE,
	"TELEFONO" char(10) NOT NULL,
	"PASSWORD" varchar(30) NOT NULL,
	"NOME" varchar(100) NOT NULL,
	"COGNOME" varchar(100) NOT NULL
);

CREATE TABLE "Palestra" (
	"ID" integer NOT NULL PRIMARY KEY,
	"NOME" varchar(40) NOT NULL,
	"INDIRIZZO" varchar(100) NOT NULL,
	"DESCRIZIONE" varchar(MAX)
);

CREATE TABLE "GestorePalestra" (
	"IDUTENTE" integer NOT NULL FOREIGN KEY REFERENCES "UtenteRegistrato" ("ID")
	"IDPALESTRA" integer NOT NULL FOREIGN KEY REFERENCES "Palestra" ("ID")
	PRIMARY KEY ("IDUTENTE","IDPALESTRA")
);

CREATE TABLE "PersonalTrainer" (
	"ID" integer NOT NULL PRIMARY KEY,
	"NOME" varchar(30) NOT NULL,
	"COGNOME" varchar(30) NOT NULL,
	"DESCRIZIONE" varchar(MAX),
	"FOTO" VARBINARY(MAX) UNIQUE
);

CREATE TABLE "Palestre_PT" (
	"IDPALESTRA" integer NOT NULL FOREIGN KEY REFERENCES "Palestra" ("ID"),
	"IDPT" integer NOT NULL FOREIGN KEY REFERENCES "PersonalTrainer" ("ID"),
	PRIMARY KEY ("IDPALESTRA","IDPT")
);

CREATE TABLE "Abbonamento" (
	"ID" integer NOT NULL PRIMARY KEY,
	"NOME" varchar (50) NOT NULL,
	"DESCRIZIONE" varchar(MAX),
	"DURATA" varchar(15) NOT NULL,
	"COSTO" float NOT NULL,
	"IDPALESTRA" integer NOT NULL FOREIGN KEY REFERENCES "Palestra" ("ID")
);

CREATE TABLE "AbbonamentoUtente" (
	"IDUTENTE" integer NOT NULL FOREIGN KEY REFERENCES "UtenteRegistrato" ("ID"),
	"IDABBONAMENTO" integer NOT NULL FOREIGN KEY REFERENCES "Abbonamento" ("ID"),
	"DATAINIZIO" date NOT NULL,
	"DATAFINE" date NOT NULL,
	PRIMARY KEY ("IDUTENTE","IDABBONAMENTO"),
	CHECK ("DATAINIZIO" < "DATAFINE")
);

CREATE TABLE "MetodoPagamento" (
	"ID" integer NOT NULL PRIMARY KEY,
	"IDUTENTE" integer NOT NULL FOREIGN KEY REFERENCES "UtenteRegistrato" ("ID"),
	"TIPO" varchar(30) NOT NULL,
);

CREATE TABLE "Amministratore" (
	"ID" integer NOT NULL PRIMARY KEY,
	"USERNAME" varchar(40) NOT NULL UNIQUE,
	"PASSWORD" varchar(40) NOT NULL,
);

CREATE TABLE "EntryOperazione" (
		"ID" integer NOT NULL PRIMARY KEY,
		"DATAORA" timestamp NOT NULL UNIQUE,
		"OPERAZIONE" varchar(MAX) NOT NULL,
);

CREATE TABLE "EntryMessaggio" (
		"ID" integer NOT NULL PRIMARY KEY,
		"DATAORA" timestamp NOT NULL UNIQUE,
		"MESSAGGIO" varchar(MAX) NOT NULL,
);
