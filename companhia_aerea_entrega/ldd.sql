PRAGMA FOREIGN_KEYS=ON;

.mode columns
.headers on
.nullvalue NULL

DROP TABLE IF EXISTS Pais;
CREATE TABLE Pais (
	idPais NUMBER PRIMARY KEY,
	nome TEXT
	);

DROP TABLE IF EXISTS Localidade;
CREATE TABLE Localidade (
	idLocalidade NUMBER PRIMARY KEY,
	idPais NUMBER,
	nome TEXT,
	FOREIGN KEY(idPais) REFERENCES Pais(idPais)
	);

DROP TABLE IF EXISTS CodigoPostal;
CREATE TABLE CodigoPostal (
	idCodigoPostal NUMBER PRIMARY KEY,
	idLocalidade NUMBER,
	codigo TEXT,
	FOREIGN KEY(idLocalidade) REFERENCES Localidade(idLocalidade)
	);

DROP TABLE IF EXISTS Comprador;
CREATE TABLE Comprador (
	idComprador NUMBER PRIMARY KEY,
	nome TEXT,
	numeroCartao NUMBER,
	contato NUMBER,
	idPais NUMBER,
	FOREIGN KEY(idPais) REFERENCES Pais(idPais)
	);

DROP TABLE IF EXISTS Reserva;
CREATE TABLE Reserva (
	idReserva NUMBER PRIMARY KEY,
	preco NUMBER,
	idComprador NUMBER,
	FOREIGN KEY(idComprador) REFERENCES Comprador(idComprador)
	);

DROP TABLE IF EXISTS Aeroporto;
CREATE TABLE Aeroporto (
	idAeroporto NUMBER PRIMARY KEY,
	cidade TEXT,
	nome TEXT,
	codigoIATA TEXT,
	idPais NUMBER,
	FOREIGN KEY(idPais) REFERENCES Pais(idPais)
	);

DROP TABLE IF EXISTS Trajeto;
CREATE TABLE Trajeto (
	idTrajeto NUMBER PRIMARY KEY,
	idAeroportoOrigem NUMBER,
	idAeroportoChegada NUMBER,
	codigoTrajeto TEXT,
	distancia NUMBER,
	FOREIGN KEY(idAeroportoOrigem) REFERENCES Aeroporto(idAeroporto),
	FOREIGN KEY(idAeroportoChegada) REFERENCES Aeroporto(idAeroporto)
	);

DROP TABLE IF EXISTS Voo;
CREATE TABLE Voo (
	idVoo NUMBER PRIMARY KEY,
	idTrajeto NUMBER,
	dataPartida DATE,
	dataChegada DATE,
	lotacao NUMBER,
	FOREIGN KEY(idTrajeto) REFERENCES Trajeto(idTrajeto)
	);

DROP TABLE IF EXISTS Passageiro;
CREATE TABLE Passageiro (
	idPassageiro NUMBER PRIMARY KEY,
	nome TEXT,
	cartaoCidadao NUMBER,
	dataNascimento DATE,
	morada TEXT,
	idCodigoPostal NUMBER,
	FOREIGN KEY(idCodigoPostal) REFERENCES CodigoPostal(idCodigoPostal)
	);

DROP TABLE IF EXISTS PassageiroNacionalidade;
CREATE TABLE PassageiroNacionalidade (
	idPassageiro NUMBER NOT NULL,
	idPais NUMBER NOT NULL,
	FOREIGN KEY(idPassageiro) REFERENCES Passageiro(idPassageiro),
	FOREIGN KEY(idPais) REFERENCES Pais(idPais),
	CONSTRAINT idPassageiroNacionalidade PRIMARY KEY (idPassageiro, idPais)
	);

DROP TABLE IF EXISTS Classe;
CREATE TABLE Classe (
	idClasse NUMBER PRIMARY KEY,
	nome TEXT
	);

DROP TABLE IF EXISTS Mala;
CREATE TABLE Mala (
	idMala NUMBER NOT NULL,
	idVoo NUMBER NOT NULL,
	idPassageiro NUMBER NOT NULL,
	peso NUMBER,
	dimensaoX NUMBER,
	dimensaoY NUMBER,
	dimensaoZ NUMBER,
	FOREIGN KEY(idVoo) REFERENCES Voo(idVoo),
	FOREIGN KEY(idPassageiro) REFERENCES Passageiro(idPassageiro),
	CONSTRAINT idMalaVooPassageiro PRIMARY KEY (idMala, idVoo, idPassageiro)
	);

DROP TABLE IF EXISTS Animal;
CREATE TABLE Animal (
	idAnimal NUMBER NOT NULL,
	idVoo NUMBER NOT NULL,
	idPassageiro NUMBER NOT NULL,
	peso NUMBER,
	FOREIGN KEY(idVoo) REFERENCES Voo(idVoo),
	FOREIGN KEY(idPassageiro) REFERENCES Passageiro(idPassageiro),
	CONSTRAINT idAnimalVooPassageiro PRIMARY KEY (idAnimal, idVoo, idPassageiro)
	);

DROP TABLE IF EXISTS Refeicao;
CREATE TABLE Refeicao (
	idRefeicao NUMBER PRIMARY KEY,
	nome TEXT,
	tipo TEXT
	);

DROP TABLE IF EXISTS Detalhes;
CREATE TABLE Detalhes (
	idVoo NUMBER NOT NULL,
	idPassageiro NUMBER NOT NULL,
	lugar TEXT,
	boardingPass TEXT,
	idClasse NUMBER,
	FOREIGN KEY(idVoo) REFERENCES Voo(idVoo),
	FOREIGN KEY(idPassageiro) REFERENCES Passageiro(idPassageiro),
	FOREIGN KEY(idClasse) REFERENCES Classe(idClasse),
	CONSTRAINT idDetalhes PRIMARY KEY (idVoo, idPassageiro)
	);

DROP TABLE IF EXISTS ReservaPassageiro;
CREATE TABLE ReservaPassageiro (
	idPassageiro NUMBER NOT NULL,
	idReserva NUMBER NOT NULL,
	FOREIGN KEY(idPassageiro) REFERENCES Passageiro(idPassageiro),
	FOREIGN KEY(idReserva) REFERENCES Reserva(idReserva),
	CONSTRAINT idReservaPassageiro PRIMARY KEY (idPassageiro, idReserva)
	);

DROP TABLE IF EXISTS ReservaVoo;
CREATE TABLE ReservaVoo (
	idVoo NUMBER NOT NULL,
	idReserva NUMBER NOT NULL,
	FOREIGN KEY(idVoo) REFERENCES Voo(idVoo),
	FOREIGN KEY(idReserva) REFERENCES Reserva(idReserva),
	CONSTRAINT idReservaVoo PRIMARY KEY (idVoo, idReserva)
	);

DROP TABLE IF EXISTS DetalhesRefeicao;
CREATE TABLE DetalhesRefeicao (
	idRefeicao NUMBER NOT NULL,
	idVoo NUMBER NOT NULL,
	idPassageiro NUMBER NOT NULL,
	FOREIGN KEY(idRefeicao) REFERENCES Refeicao(idRefeicao),
	FOREIGN KEY(idVoo) REFERENCES Voo(idVoo),
	FOREIGN KEY(idPassageiro) REFERENCES Passageiro(idPassageiro),
	CONSTRAINT idVooPassageiroRefeicao PRIMARY KEY (idVoo, idPassageiro, idRefeicao)
	);
