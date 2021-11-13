CREATE SEQUENCE eu_criei;

SELECT NEXTVAL('eu_criei');
SELECT CURRVAL('eu_criei');

CREATE TEMPORARY TABLE auto(
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('eu_criei'),
	nome VARCHAR(30) NOT NULL
);

INSERT INTO auto (nome) VALUES ('Vinicius Dias');
INSERT INTO auto (id, nome) VALUES (4, 'Vinicius Dias');
INSERT INTO auto (nome) VALUES ('Outro nome');

SELECT * FROM auto;

CREATE TYPE classificacao AS ENUM ('LIVRE', '12 anos', '14 anos', '16 anos', '18 anos');

CREATE TEMPORARY TABLE filme(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	classificacao classificacao);
	
INSERT INTO filme (nome, classificacao) VALUES ('Um filme qualquer', 'LIVRE');
INSERT INTO filme (nome, classificacao) VALUES ('Um filme qualquer', 'Teste');

SELECT * FROM filme;