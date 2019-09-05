-- Trajetos exitentes entre duas cidades com um maximo de 4 escalas entre elas
SELECT
	Origem.cidade AS Origem,
	Destino.cidade AS Destino,
	nEscalas,
	Origem.cidade AS Partida,
	Flights.Trajeto1,
	Escala1.cidade AS Escala1,
	Flights.Trajeto2,
	Escala2.cidade AS Escala2,
	Flights.Trajeto3,
	Escala3.cidade AS Escala3,
	Flights.Trajeto4,
	Escala4.cidade AS Escala4
FROM
	(
		SELECT
			Origem,
			Destino,
			nEscalas,
			Escala1,
			Trajeto1,
			Escala2,
			Trajeto2,
			Escala3,
			Trajeto3,
			Escala4,
			Trajeto4,
			min(distancia)
		FROM (
			SELECT
				L1.idAeroportoOrigem AS Origem,
				L1.idAeroportoChegada AS Destino,
				1 AS nEscalas,
				L1.codigoTrajeto AS Trajeto1,
				L1.idAeroportoChegada AS Escala1,
				NULL AS Trajeto2,
				NULL AS Escala2,
				NULL AS Trajeto3,
				NULL AS Escala3,
				NULL AS Trajeto4,
				NULL AS Escala4,
				L1.distancia AS distancia
			FROM Trajeto AS L1

			UNION

			SELECT
				L1.idAeroportoOrigem AS Origem,
				L2.idAeroportoChegada AS Destino,
				2 AS nEscalas,
				L1.codigoTrajeto AS Trajeto1,
				L1.idAeroportoChegada AS Escala1,
				L2.codigoTrajeto AS Trajeto2,
				L2.idAeroportoChegada AS Escala2,
				NULL AS Trajeto3,
				NULL AS Escala3,
				NULL AS Trajeto4,
				NULL AS Escala4,
				L1.distancia + L2.distancia AS distancia
			FROM
				Trajeto AS L1
				INNER JOIN Trajeto AS L2
					ON (L1.idAeroportoChegada == L2.idAeroportoOrigem)

			UNION

			SELECT
				L1.idAeroportoOrigem AS Origem,
				L3.idAeroportoChegada AS Destino,
				3 AS nEscalas,
				L1.codigoTrajeto AS Trajeto1,
				L1.idAeroportoChegada AS Escala1,
				L2.codigoTrajeto AS Trajeto2,
				L2.idAeroportoChegada AS Escala2,
				L3.codigoTrajeto AS Trajeto3,
				L3.idAeroportoChegada AS Escala3,
				NULL AS Trajeto4,
				NULL AS Escala4,
				L1.distancia + L2.distancia + L3.distancia AS distancia
			FROM
				Trajeto AS L1
				INNER JOIN Trajeto AS L2
					ON (L1.idAeroportoChegada == L2.idAeroportoOrigem)
				INNER JOIN Trajeto AS L3
					ON (L2.idAeroportoChegada == L3.idAeroportoOrigem)

			UNION

			SELECT
				L1.idAeroportoOrigem AS Origem,
				L4.idAeroportoChegada AS Destino,
				4 AS nEscalas,
				L1.codigoTrajeto AS Trajeto1,
				L1.idAeroportoChegada AS Escala1,
				L2.codigoTrajeto AS Trajeto2,
				L2.idAeroportoChegada AS Escala2,
				L3.codigoTrajeto AS Trajeto3,
				L3.idAeroportoChegada AS Escala3,
				L4.codigoTrajeto AS Trajeto4,
				L4.idAeroportoChegada AS Escala4,
				L1.distancia + L2.distancia + L3.distancia + L4.distancia AS distancia
			FROM
				Trajeto AS L1
				INNER JOIN Trajeto AS L2
					ON (L1.idAeroportoChegada == L2.idAeroportoOrigem)
				INNER JOIN Trajeto AS L3
					ON (L2.idAeroportoChegada == L3.idAeroportoOrigem)
				INNER JOIN Trajeto AS L4
					ON (L3.idAeroportoChegada == L4.idAeroportoOrigem)
		)
		WHERE distancia AND Origem != Destino
		GROUP BY Origem, Destino
		-- ORDER BY Escala4, Escala3, Escala2, Escala1
	) AS Flights
	LEFT OUTER JOIN (SELECT cidade, idAeroporto FROM Aeroporto) AS Origem
		ON (Flights.Origem == Origem.idAeroporto)
	LEFT OUTER JOIN (SELECT cidade, idAeroporto FROM Aeroporto) AS Destino
		ON (Flights.Destino == Destino.idAeroporto)
	LEFT OUTER JOIN (SELECT cidade, idAeroporto FROM Aeroporto) AS Escala1
		ON (Flights.Escala1 == Escala1.idAeroporto)
	LEFT OUTER JOIN (SELECT cidade, idAeroporto FROM Aeroporto) AS Escala2
		ON (Flights.Escala2 == Escala2.idAeroporto)
	LEFT OUTER JOIN (SELECT cidade, idAeroporto FROM Aeroporto) AS Escala3
		ON (Flights.Escala3 == Escala3.idAeroporto)
	LEFT OUTER JOIN (SELECT cidade, idAeroporto FROM Aeroporto) AS Escala4
		ON (Flights.Escala4 == Escala4.idAeroporto)
;


-- Informação de cada Voo de cada Passageiro
SELECT
	Passageiro.nome AS Nome,
	Reserva.idReserva AS Reserva,
	Reserva.preco AS preco,
	Trajeto.codigoTrajeto AS Trajeto,
	Voo.dataPartida AS dataPartida,
	AeroportoOrigem.codigoIATA AS O_IATA,
	AeroportoOrigem.nome AS AeroportoOrigem,
	AeroportoOrigem.cidade AS CidadeOrigem,
	PaisOrigem.nome AS PaisOrigem,
	Voo.dataChegada AS dataChegada,
	AeroportoChegada.codigoIATA AS D_IATA,
	AeroportoChegada.nome AS AeroportoDestino,
	AeroportoChegada.cidade AS CidadeDestino,
	PaisChegada.nome AS PaisChegada,
	Detalhes.boardingPass AS Bilhete,
	Detalhes.lugar AS Lugar,
	Classe.nome AS Classe,
	count(Mala.idMala) AS Malas,
	count(Animal.idAnimal) AS Animais
	FROM
		(SELECT idPassageiro, nome FROM Passageiro) AS Passageiro
		INNER JOIN ReservaPassageiro
			ON Passageiro.idPassageiro == ReservaPassageiro.idPassageiro
		INNER JOIN (SELECT idReserva, preco FROM Reserva) AS Reserva
			ON ReservaPassageiro.idReserva == Reserva.idReserva
		INNER JOIN ReservaVoo
			ON ReservaPassageiro.idReserva == ReservaVoo.idReserva
		INNER JOIN (SELECT idVoo, idTrajeto, dataPartida, dataChegada FROM Voo) AS Voo
			ON ReservaVoo.idVoo == Voo.idVoo
		INNER JOIN (SELECT idTrajeto, codigoTrajeto, idAeroportoOrigem, idAeroportoChegada FROM Trajeto) AS Trajeto
			ON Voo.idTrajeto == Trajeto.idTrajeto
		INNER JOIN Aeroporto AS AeroportoOrigem
			ON Trajeto.idAeroportoOrigem == AeroportoOrigem.idAeroporto
		INNER JOIN Pais AS PaisOrigem
			ON AeroportoOrigem.idPais == PaisOrigem.idPais
		INNER JOIN Aeroporto AS AeroportoChegada
			ON Trajeto.idAeroportoChegada == AeroportoChegada.idAeroporto
		INNER JOIN Pais AS PaisChegada
			ON AeroportoChegada.idPais == PaisChegada.idPais
		INNER JOIN Detalhes
			ON (Passageiro.idPassageiro == Detalhes.idPassageiro AND Voo.idVoo == Detalhes.idVoo)
		INNER JOIN Classe
			ON Detalhes.idClasse = Classe.idClasse
		LEFT OUTER JOIN (SELECT idVoo, idPassageiro, idMala FROM MALA) AS Mala
			ON (Passageiro.idPassageiro == Mala.idPassageiro AND Voo.idVoo == Mala.idVoo)
		LEFT OUTER JOIN (SELECT idVoo, idPassageiro, idAnimal FROM Animal) AS Animal
			ON (Passageiro.idPassageiro == Animal.idPassageiro AND Voo.idVoo == Animal.idVoo)

GROUP BY Passageiro.idPassageiro, Reserva.idReserva, Voo.idVoo
ORDER BY Passageiro.idPassageiro, Reserva.idReserva
;


-- Passageiros com mais distancia de Voo
SELECT Passageiro.idPassageiro AS id, nome, sum(distancia) AS distanciaTotal
FROM
	(SELECT idPassageiro, nome FROM Passageiro) AS Passageiro
	INNER JOIN (SELECT idPassageiro, idReserva FROM ReservaPassageiro) AS ReservaPassageiro
		ON (Passageiro.idPassageiro == ReservaPassageiro.idPassageiro)
	INNER JOIN (SELECT idReserva, idVoo FROM ReservaVoo) AS ReservaVoo
		ON (ReservaPassageiro.idReserva == ReservaVoo.idReserva)
	INNER JOIN (SELECT idVoo, idTrajeto FROM Voo) AS Voo
		ON (ReservaVoo.idVoo == Voo.idVoo)
	INNER JOin (SELECT idTrajeto, distancia FROM Trajeto) AS Trajeto
		ON (Voo.idTrajeto == Trajeto.idTrajeto)
GROUP BY Passageiro.idPassageiro
ORDER BY sum(distancia) DESC
;


-- Compradores que gastaram mais dinheiro
SELECT Comprador.idComprador AS id, nome, sum(preco) AS dinheiroGasto
FROM
	(SELECT idReserva, idComprador, preco FROM Reserva) AS Reserva
	INNER JOIN (SELECT idComprador, nome FROM Comprador) AS Comprador
		ON (Reserva.idComprador == Comprador.idComprador)
GROUP BY id
ORDER BY sum(preco) DESC
;


-- Morada para onde mandar Malas em caso de perdas
SELECT idMala, Passageiro.nome AS Proprietario, morada, codigo, Localidade.nome AS localidade, Pais.nome AS pais
FROM
	(SELECT idPassageiro, idMala FROM Mala) AS Mala
	INNER JOIN (SELECT idPassageiro, nome, morada, idCodigoPostal FROM Passageiro) AS Passageiro
		ON (Mala.idPassageiro == Passageiro.idPassageiro)
	INNER JOIN CodigoPostal
		ON (Passageiro.idCodigoPostal == CodigoPostal.idCodigoPostal)
	INNER JOIN Localidade
		ON (CodigoPostal.idLocalidade == Localidade.idLocalidade)
	INNER JOIN Pais
		ON (Localidade.idPais == Pais.idPais)
;

-- Calcula Pbase(i, d, p) = (35 + 0.08 dist(i)) * mDiaEspecial * mCheio(p) * mDias(d)
SELECT idVoo, codigoTrajeto, dataPartida, dataChegada, codigoTrajeto, distancia, ocupacaoPercentual,
	round((35 + 0.08 * distancia) * -- preço mínimo + por km
	0.4 * (4 - 3 * (1-ocupacaoPercentual)) *  -- mCheio
	(1+6.75 / diasRestantes / diasRestantes), 2) * -- mDias, assumindo que os bilhetes estão a ser comprados no dia 15 de abril de 2016
	-- mDiaEspecial
	CASE WHEN 
	strftime("%m-%d", "2016-01-01 12:00") = strftime("%m-%d", dataPartida) OR
	strftime("%m-%d", "2016-03-25 12:00") = strftime("%m-%d", dataPartida) OR
	strftime("%m-%d", "2016-03-27 12:00") = strftime("%m-%d", dataPartida) OR
	strftime("%m-%d", "2016-04-25 12:00") = strftime("%m-%d", dataPartida) OR
	strftime("%m-%d", "2016-05-01 12:00") = strftime("%m-%d", dataPartida) OR
	strftime("%m-%d", "2016-05-26 12:00") = strftime("%m-%d", dataPartida) OR
	strftime("%m-%d", "2016-06-10 12:00") = strftime("%m-%d", dataPartida) OR
	strftime("%m-%d", "2016-07-15 12:00") = strftime("%m-%d", dataPartida) OR
	strftime("%m-%d", "2016-10-05 12:00") = strftime("%m-%d", dataPartida) OR
	strftime("%m-%d", "2016-11-01 12:00") = strftime("%m-%d", dataPartida) OR
	strftime("%m-%d", "2016-12-01 12:00") = strftime("%m-%d", dataPartida) OR
	strftime("%m-%d", "2016-12-08 12:00") = strftime("%m-%d", dataPartida) OR
	strftime("%m-%d", "2016-12-25 12:00") = strftime("%m-%d", dataPartida)
	THEN
	1.5 ELSE 1.0 END
	AS Pbase
	FROM
		(SELECT Voo.*, distancia, codigoTrajeto,
		ocupados * 1.0 / lotacao AS ocupacaoPercentual,
		strftime("%s", dataPartida) / 60 / 60 / 24 - strftime("%s", "2016-04-15 12:40") / 60 / 60 / 24 AS diasRestantes
		FROM
			(SELECT Voo.*, count(idPassageiro) AS ocupados
			 FROM
				 Voo
				 LEFT OUTER JOIN Detalhes
					 ON Voo.idVoo == Detalhes.idVoo
			 GROUP BY Voo.idVoo)
				AS Voo
			INNER JOIN
				(SELECT idTrajeto, codigoTrajeto, distancia FROM Trajeto) AS Trajeto
					ON (Voo.idTrajeto == Trajeto.idTrajeto));

-- Query para ajudar no cálculo de Pmalas(i, j)
-- Diz para um (voo, passageiro), se tiver mala,
-- se esta é standard ou não standard e retorna o peso e dimensões dessa mesma mala
SELECT MalaStandard.idVoo, MalaStandard.idPassageiro, MalaStandard.idMala, 
CASE WHEN MalaStandard IS NULL THEN 
	CASE WHEN MalaNaoStandard IS NULL THEN 
		"Sem Mala"
	ELSE
		"Mala Nao Standard" 
	END
ELSE
	"Mala Standard" 
END 
AS tipoMala, 
MalaStandard.peso, MalaStandard.dimensaoX, MalaStandard.dimensaoY, MalaStandard.dimensaoZ
FROM
	(SELECT Voo.idVoo, Passageiro.idPassageiro, idMala, peso, dimensaoX, dimensaoY, dimensaoZ,
	CASE WHEN 
	min(dimensaoX, dimensaoY, dimensaoZ) <= 20 AND
	max(dimensaoX, dimensaoY, dimensaoZ) <=50 AND
	dimensaoX + dimensaoY + dimensaoZ - min(dimensaoX, dimensaoY, dimensaoZ) - max(dimensaoX, dimensaoY, dimensaoZ) <= 30 AND
	peso <= 23
	THEN 1 ELSE NULL END AS MalaStandard
	FROM Voo JOIN Passageiro JOIN Detalhes LEFT OUTER JOIN Mala
	ON Mala.idVoo == Voo.idVoo AND
	Mala.idPassageiro == Passageiro.idPassageiro
	WHERE
	Voo.idVoo == Detalhes.idVoo AND
	Passageiro.idPassageiro == Detalhes.idPassageiro
	GROUP BY Voo.idVoo, Passageiro.idPassageiro)
AS MalaStandard
INNER JOIN
	(SELECT Voo.idVoo, Passageiro.idPassageiro, idMala, peso, dimensaoX, dimensaoY, dimensaoZ,
	CASE WHEN
	min(dimensaoX, dimensaoY, dimensaoZ) <= 50 AND
	max(dimensaoX, dimensaoY, dimensaoZ) <= 75 AND
	dimensaoX + dimensaoY + dimensaoZ - min(dimensaoX, dimensaoY, dimensaoZ) - max(dimensaoX, dimensaoY, dimensaoZ) <= 150 AND
	peso <= 32
	THEN 1 ELSE NULL END AS MalaNaoStandard
	FROM Voo JOIN Passageiro JOIN Detalhes LEFT OUTER JOIN Mala
	ON Mala.idVoo == Voo.idVoo AND
	Mala.idPassageiro == Passageiro.idPassageiro
	WHERE
	Voo.idVoo == Detalhes.idVoo AND
	Passageiro.idPassageiro == Detalhes.idPassageiro
	GROUP BY Voo.idVoo, Passageiro.idPassageiro)
AS MalaNaoStandard
ON MalaStandard.idVoo == MalaNaoStandard.idVoo AND
MalaStandard.idPassageiro == MalaNaoStandard.idPassageiro;
