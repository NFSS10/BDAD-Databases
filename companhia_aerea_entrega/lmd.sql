	

PRAGMA FOREIGN_KEYS=ON;

.mode columns
.headers on
.nullvalue NULL

INSERT INTO Classe VALUES (0, "Turistica");
INSERT INTO Classe VALUES (1, "Primeira Classe");

INSERT INTO Refeicao VALUES (0, "Galinha", "Carne");
INSERT INTO Refeicao VALUES (1, "Bife", "Carne");
INSERT INTO Refeicao VALUES (2, "Bacalhau", "Peixe");
INSERT INTO Refeicao VALUES (3, "Salada", "Vegetariana");

INSERT INTO Pais VALUES ( 0, "Portugal");
INSERT INTO Pais VALUES ( 1, "Espanha");
INSERT INTO Pais VALUES ( 2, "Franca");
INSERT INTO Pais VALUES ( 3, "Belgica");
INSERT INTO Pais VALUES ( 4, "Reino Unido");
INSERT INTO Pais VALUES ( 5, "Brazil");
INSERT INTO Pais VALUES ( 6, "Russia");
INSERT INTO Pais VALUES ( 7, "Polonia");
INSERT INTO Pais VALUES ( 8, "Republica Checa");
INSERT INTO Pais VALUES ( 9, "Gana");
INSERT INTO Pais VALUES (10, "Estados Unidos");
INSERT INTO Pais VALUES (11, "Angola");

INSERT INTO Aeroporto VALUES ( 0, "Madrid", "Madrid-Barajas", "MAD", 1);
INSERT INTO Aeroporto VALUES ( 1, "Lisboa", "Portela", "LIS", 0);
INSERT INTO Aeroporto VALUES ( 2, "Barcelona", "Barcelona", "BCN", 1);
INSERT INTO Aeroporto VALUES ( 3, "Recife", "Int'l do Recife", "REC", 5);
INSERT INTO Aeroporto VALUES ( 4, "Moscovo", "Int'l Domodedovo", "DME", 6);
INSERT INTO Aeroporto VALUES ( 5, "Warsaw", "Frederic Chopin de Varsovia", "WAW", 7);
INSERT INTO Aeroporto VALUES ( 6, "Praga", "Int'l Ruzyne", "PRG", 8);
INSERT INTO Aeroporto VALUES ( 7, "Acra", "Int'l Kotoka", "ACC", 9);
INSERT INTO Aeroporto VALUES ( 8, "Santa Cruz", "Madeira", "FNC", 0);
INSERT INTO Aeroporto VALUES ( 9, "Lajes", "Base Aerea das Lajes", "TER", 0);
INSERT INTO Aeroporto VALUES (10, "Newark", "Int'l de Newark", "KEWR", 10);
INSERT INTO Aeroporto VALUES (11, "Miami", "Int'l de Miami", "KMIA", 10);
INSERT INTO Aeroporto VALUES (12, "Luanda", "Quatro de Fevereiro", "LAD", 11);
INSERT INTO Aeroporto VALUES (13, "Fortaleza", "Int'l de Fortaleza", "FOR", 5);
INSERT INTO Aeroporto VALUES (14, "Manchester", "Manchester", "MAN", 4);
INSERT INTO Aeroporto VALUES (15, "Oostende", "Ostend-Bruges Int'l", "OST", 3);
INSERT INTO Aeroporto VALUES (16, "Londres", "Londres Heathrow", "LHR", 4);
INSERT INTO Aeroporto VALUES (17, "Paris", "Paris-Orly", "ORY", 2);
INSERT INTO Aeroporto VALUES (18, "Porto", "Francisco Sa Carneiro", "OPO", 0);

INSERT INTO Trajeto VALUES ( 0,  0,  1, "TAP1017", 514);
INSERT INTO Trajeto VALUES ( 1,  1,  0, "TAP1018", 512);
INSERT INTO Trajeto VALUES ( 2,  2,  1, "TAP1045", 995);
INSERT INTO Trajeto VALUES ( 3,  1,  3, "TAP11"  , 5864);
INSERT INTO Trajeto VALUES ( 4,  1,  4, "TAP1232", 3918);
INSERT INTO Trajeto VALUES ( 5,  5,  1, "TAP1261", 2752);
INSERT INTO Trajeto VALUES ( 6,  6,  1, "TAP1305", 2231);
INSERT INTO Trajeto VALUES ( 7,  1,  7, "TAP1511", 3802);
INSERT INTO Trajeto VALUES ( 8,  8, 18, "TAP1714", 1192);
INSERT INTO Trajeto VALUES ( 9,  1,  9, "TAP1823", 1556);
INSERT INTO Trajeto VALUES (10,  1, 10, "TAP203" , 5439);
INSERT INTO Trajeto VALUES (11,  1, 12, "TAP287" , 5787);
INSERT INTO Trajeto VALUES (12,  1, 13, "TAP31"  , 5618);
INSERT INTO Trajeto VALUES (13, 15,  1, "TAP3383", 1670);
INSERT INTO Trajeto VALUES (14, 16, 16, "TAP367" , 1566);
INSERT INTO Trajeto VALUES (15,  1, 17, "TAP448" , 1439);
INSERT INTO Trajeto VALUES (16, 17,  1, "TAP449" , 1439);
INSERT INTO Trajeto VALUES (17, 17, 18, "TAP457" , 1201);
INSERT INTO Trajeto VALUES (18, 18, 17, "TAP458" , 1201);

INSERT INTO Voo VALUES (0,  12, "2016-04-25 14:34", "2016-04-25 17:38", 200);
INSERT INTO Voo VALUES (1,  4,  "2016-04-25 19:28", "2016-04-26 02:08", 200);
INSERT INTO Voo VALUES (2,  0,  "2016-04-25 19:20", "2016-04-25 19:15", 150);
INSERT INTO Voo VALUES (3,  3,  "2016-04-25 13:19", "2016-04-25 16:49", 320);
INSERT INTO Voo VALUES (4,  10, "2016-04-25 13:03", "2016-04-25 15:13", 250);
INSERT INTO Voo VALUES (5,  11, "2016-04-26 13:13", "2016-04-26 20:54", 140);
INSERT INTO Voo VALUES (6,  13, "2016-04-25 18:40", "2016-04-25 19:45", 200);
INSERT INTO Voo VALUES (7,  18, "2016-04-23 19:45", "2016-04-23 22:35", 220);
INSERT INTO Voo VALUES (8,  16, "2016-04-25 20:44", "2016-04-25 22:00", 220);
INSERT INTO Voo VALUES (9,  17, "2016-04-25 22:48", "2016-04-25 23:26", 200);
INSERT INTO Voo VALUES (10, 15, "2016-04-25 18:18", "2016-04-25 21:25", 210);
INSERT INTO Voo VALUES (11, 14, "2016-04-25 20:01", "2016-04-25 22:20", 217);
INSERT INTO Voo VALUES (12,  1, "2016-04-25 19:10", "2016-04-25 21:01", 200);
INSERT INTO Voo VALUES (13,  5, "2016-04-25 18:40", "2016-04-25 19:45", 200);
INSERT INTO Voo VALUES (14,  2, "2016-04-25 19:18", "2016-04-25 20:36", 150);
INSERT INTO Voo VALUES (15,  6, "2016-04-25 18:57", "2016-04-25 21:04", 190);
INSERT INTO Voo VALUES (16,  7, "2016-04-25 18:40", "2016-04-25 19:45", 200);
INSERT INTO Voo VALUES (17,  9, "2016-04-25 17:06", "2016-04-25 21:21", 203);
INSERT INTO Voo VALUES (18,  8, "2016-04-25 19:20", "2016-04-25 20:55", 196);



INSERT INTO Localidade VALUES (0, 0, "Soito");
INSERT INTO CodigoPostal VALUES (0, 0, "6320631");
INSERT INTO Comprador VALUES (0, "Joao Silva", 4485088038682341, 271123321, 0);
INSERT INTO Reserva VALUES (0, NULL, 0);
INSERT INTO ReservaVoo VALUES (0, 0);


INSERT INTO Passageiro VALUES (0, "Joao Silva", 12312312, "1980-01-01", "390, Estrada Municipal 538-1", 0);
INSERT INTO PassageiroNacionalidade VALUES (0, 0);
INSERT INTO ReservaPassageiro VALUES (0, 0);


INSERT INTO Detalhes VALUES (0, 0, "34A", "2 207 365 3958 3309 0", 0);
INSERT INTO Mala VALUES (0, 0, 0, 22, 40, 20, 10);
INSERT INTO Animal VALUES (0, 0, 0, 5);
INSERT INTO Animal VALUES (1, 0, 0, 7);
INSERT INTO DetalhesRefeicao VALUES (1, 0, 0);


INSERT INTO Localidade VALUES (1, 0, "Macieira de Sarnes");
INSERT INTO CodigoPostal VALUES (1, 1, "3700714");
INSERT INTO Comprador VALUES (1, "Ricardo Rodrigues", 4539675847475440, 234555123, 0);
INSERT INTO Reserva VALUES (1, NULL, 1);
INSERT INTO ReservaVoo VALUES (0, 1);
INSERT INTO ReservaVoo VALUES (1, 1);


INSERT INTO Passageiro VALUES (1, "Ricardo Rodrigues", 32132132, "1970-06-23", "47, Travessa 1o de Dezembro", 1);
INSERT INTO Passageiro VALUES (2, "Sara Costa", 23123123, "1975-09-05", "47, Travessia 1o de Dezembro", 1);
INSERT INTO Passageiro VALUES (3, "Carlos Rodrigues", 33322211, "1999-04-20", "47, Travessia 1o de Dezembro", 1);
INSERT INTO PassageiroNacionalidade VALUES (1, 0);
INSERT INTO PassageiroNacionalidade VALUES (2, 0);
INSERT INTO PassageiroNacionalidade VALUES (3, 0);
INSERT INTO ReservaPassageiro VALUES (1, 1);
INSERT INTO ReservaPassageiro VALUES (2, 1);
INSERT INTO ReservaPassageiro VALUES (3, 1);


INSERT INTO Detalhes VALUES (0, 1, "22A", "5 321 503 2103 0569 2", 0);
INSERT INTO Mala VALUES (1, 0, 1, 24, 60, 40, 20);
INSERT INTO Animal VALUES (2, 0, 1, 4);
INSERT INTO DetalhesRefeicao VALUES (0, 0, 1);

INSERT INTO Detalhes VALUES (0, 2, "22B", "5 321 503 2103 0569 3", 0);
INSERT INTO Mala VALUES (3, 0, 2, 13, 50, 30, 25);
INSERT INTO DetalhesRefeicao VALUES (3, 0, 2);

INSERT INTO Detalhes VALUES (0, 3, "22C", "5 321 503 2103 0569 4", 0);
INSERT INTO DetalhesRefeicao VALUES (0, 0, 3);


INSERT INTO Detalhes VALUES (1, 1, "36B", "8 842 038 7309 3050 5", 0);
INSERT INTO Mala VALUES (2, 1, 1, 24, 60, 40, 20);
INSERT INTO Animal VALUES (3, 1, 1, 4);
INSERT INTO DetalhesRefeicao VALUES (0, 1, 1);

INSERT INTO Detalhes VALUES (1, 2, "36A", "8 842 038 7309 3050 4", 0);
INSERT INTO Mala VALUES (4, 1, 2, 13, 50, 30, 25);
INSERT INTO DetalhesRefeicao VALUES (3, 1, 2);

INSERT INTO Detalhes VALUES (1, 3, "2A", "8 842 038 7309 3050 3", 1);
INSERT INTO DetalhesRefeicao VALUES (0, 1, 3);




INSERT INTO Localidade VALUES (2, 0, "PORTELA");
INSERT INTO Localidade VALUES (3, 0, "SACAVEM");
INSERT INTO CodigoPostal VALUES (2, 2, "2685181");
INSERT INTO CodigoPostal VALUES (3, 3, "2685894");
INSERT INTO Comprador VALUES (2, "Antonio Amorim", 4556024191973791, 210456456, 0);
INSERT INTO Reserva VALUES (2, NULL, 2);
INSERT INTO ReservaVoo VALUES (5, 2);
INSERT INTO ReservaVoo VALUES (6, 2);


INSERT INTO Passageiro VALUES (4, "Antonio Amorim", 88899911, "1967-06-07", "234, Impasse I", 3);
INSERT INTO PassageiroNacionalidade VALUES (4, 0);
INSERT INTO Passageiro VALUES (5, "Armando Vieira", 44477744, "1954-03-20", "832, Beco I", 2);
INSERT INTO PassageiroNacionalidade VALUES (5, 0);
INSERT INTO ReservaPassageiro VALUES (4, 2);
INSERT INTO ReservaPassageiro VALUES (5, 2);


INSERT INTO Detalhes VALUES (5, 4, "1A", "5 843 792 9732 2983 4", 1);
INSERT INTO Mala VALUES (5, 5, 4, 30, 40, 30, 20);
INSERT INTO DetalhesRefeicao VALUES (2, 5, 4);

INSERT INTO Detalhes VALUES (5, 5, "2A", "5 843 792 9732 2983 5", 1);
INSERT INTO Mala VALUES (6, 5, 5, 31, 40, 30, 20);
INSERT INTO DetalhesRefeicao VALUES (2, 5, 5);


INSERT INTO Detalhes VALUES (6, 4, "1A", "8 230 832 0482 3043 1", 1);
INSERT INTO Mala VALUES (7, 6, 4, 30, 40, 30, 20);
INSERT INTO DetalhesRefeicao VALUES (2, 6, 4);

INSERT INTO Detalhes VALUES (6, 5, "2A", "8 230 832 0482 3043 2", 1);
INSERT INTO Mala VALUES (8, 6, 5, 31, 40, 30, 20);
INSERT INTO DetalhesRefeicao VALUES (2, 6, 5);
