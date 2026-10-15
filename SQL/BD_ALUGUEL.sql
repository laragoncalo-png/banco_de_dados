CREATE DATABASE IF NOT EXISTS BD_ALUGUEL;
USE BD_ALUGUEL;

CREATE TABLE IF NOT EXISTS CLIENTE(
	CLI_ID   INT AUTO_INCREMENT PRIMARY KEY,
    CLI_NOME VARCHAR(50) NOT NULL,
    CLI_CPF  VARCHAR(11) NOT NULL,
    CLI_EMAIL VARCHAR(50) NOT NULL,
    CLI_TELEFONE VARCHAR(9) NOT NULL
);

ALTER TABLE CLIENTE
MODIFY COLUMN CLI_CPF VARCHAR(11) NOT NULL UNIQUE;

CREATE TABLE IF NOT EXISTS PRODUTO(
	PRO_ID INT AUTO_INCREMENT PRIMARY KEY,
    PRO_NOME VARCHAR(50) NOT NULL,
    PRO_DESCRICAO VARCHAR(200),
    PRO_PRECO DOUBLE NOT NULL,
    PRO_QTD_DISPONIVEL INT NOT NULL
);

CREATE TABLE IF NOT EXISTS ALUGUEL(
	ALU_ID INT AUTO_INCREMENT PRIMARY KEY,
    ALU_DATA_ALUGUEL DATE NOT NULL,
    ALU_DATA_DEVOLUCAO DATE NOT NULL,
    ALU_VALOR_TOTAL DOUBLE NOT NULL,
    FK_CLI_ID INT,
    FOREIGN KEY (FK_CLI_ID) REFERENCES CLIENTE(CLI_ID)
);

CREATE TABLE IF NOT EXISTS ALUGUEL_PRODUTO(
	ALP_ID INT AUTO_INCREMENT PRIMARY KEY,
    FK_PRO_ID INT NOT NULL,
    FK_ALU_ID INT NOT NULL,
    FOREIGN KEY (FK_PRO_ID) REFERENCES PRODUTO(PRO_ID),
    FOREIGN KEY (FK_ALU_ID) REFERENCES ALUGUEL(ALU_ID)
);

INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Lara", "72807217028", "lara@email.com", "917330126");

INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Shannayah", "72807217028", "shannayah@email.com", "917330126");

INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Ana Silva", "12345678900", "ana.silva@email.com", "987654321");

INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Bruno Souza", "23456789011", "bruno.souza@email.com", "976543210");

INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Carla Mendes", "9147057411", "carla.mendes@email.com", "462449820");

INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Daniel Rocha", "45678901233", "daniel.rocha@email.com", "954321098");

INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Elaine Costa", "914705743", "elaine.costa@email.com", "462449820");

INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Felipe Lima", "914705743", "felipe.lima@email.com", "46610891850");

INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Giselle Martins", "914705743", "giselle.martins@email.com", "12366855877");

INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Henrique Alves", "914705743", "henrique.alves@email.com", "462449820");

INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Isabela Ferreira", "914705743", "isabela.ferreira@email.com", "462449820");

INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("João Oliveira", "914705743", "joao.oliveira@email.com", "462449820");

SELECT * FROM CLIENTE;

INSERT INTO PRODUTO (PRO_NOME,
					 PRO_PRECO,
                     PRO_QTD_DISPONIVEL)
VALUES                     ("Iphone 18 PRO MAX",
                             589.90,
                             100);
                             
INSERT INTO PRODUTO (PRO_NOME,
                     PRO_DESCRICAO,
					 PRO_PRECO,
                     PRO_QTD_DISPONIVEL)
VALUES                     ("Lancha Turbo",
							"Lancha para rio e mar",
                             2358.75,
                             5);
                             
INSERT INTO PRODUTO (PRO_NOME,
                     PRO_DESCRICAO,
					 PRO_PRECO,
                     PRO_QTD_DISPONIVEL)
VALUES                     ("Notebook Dell Inspiron",
							"Notebook com processador Intel Core i7, 16GB de RAM, 512GB SSD",
                             450,
                             10),
							("Smartphone Samsung Galaxy S21",
                             "Smartphone com tela de 6.2 polegadas, 128GB de armazenamento",
                             350,
                             15),
							("TV LG 55 4K" ,
							 "Smart TV com resolução 4K e HDR",
                             280,
                             8),
							("Drone DJI Phantom 4",
                             "Drone com câmera 4K e estabilização de imagem",
                             300,
                             55),
							("Câm. Canon EOSI T7",
                             "Câmera DSLR com lente 18-55mm, 24.1MP",
                             250,
                             2),
							("Câmera GoPro Hero 9",
                             "Câmera de ação com resolução 5K e resistência à água",
                             80,
                             60),
							("Tenda Eventos 5x5m",
                             "Tenda resistente à água e fácil de montar",
                             200,
                             4),
							("Microfone Shure SM58",
                             "Microfone para apresentações e shows",
                             40,
                             35),
							("Mesa de Som Behringer",
                             "Mesa de som com 16 canais e efeitos integrados",
                             500,
                             3),
							("Kit de lluminação Fotográfica",
                             "Kit com softbox, tripés e lâmpadas de LED",
                             100,
                             6);
                             
SELECT * FROM PRODUTO
SELECT PRO_NOME, PRO_DESCRICAO FROM PRODUTO;
SELECT 
    PRO_NOME, PRO_DESCRICAO, PRO_PRECO
FROM
    PRODUTO;
    
-- SELECIONAR APENAS OS PRODUTOS COM PRECO > 250
SELECT * 
FROM    PRODUTO
WHERE PRO_PRECO > 250;

-- SELECIONAR APENAS O PRODUTO DE ID = 3
SELECT *
FROM    PRODUTO
		PRO_ID,
        PRO_NOME
FROM    PRODUTO
WHERE PRO_ID = 3;

-- SELECIONAR TODOS OS PRODUTOS QUE CONTENHAM NOTEBOOK EM QUALQUER PARTE DO NOME
SELECT *
FROM   PRODUTO
WHERE PRO_NOME LIKE '%NOTEBOOK%';

-- ATUALIZAR A QUANTIDADE DE NOTEBOOK PARA 200
UPDATE PRODUTO
SET PRO_QTD_DISPONIVEL = 200
WHERE  PRO_ID = 3; -- UPDATE TEM QUE TER WHERE

-- ATUALIZAR A DESCRICAO PARA VAZIO
UPDATE PRODUTO
SET PRO_DESCRICAO = NULL
WHERE



INSERT INTO ALUGUEL (ALU_DATA_ALUGUEL,
					 ALU_DATA_DEVOLUCAO,
                     ALU_VALOR_TOTAL,
                     FK_CLI_ID)
			VALUES ("2026-10-08",
					"2026-10-15",
                    600.89,
                    2);
                    
SELECT * FROM ALUGUEL;

INSERT INTO ALUGUEL_PRODUTO(FK_PRO_ID, FK_ALU_ID)
VALUES (1,1);

SELECT * FROM ALUGUEL_PRODUTO;

