CREATE TABLE instrutor(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	salario DECIMAL(10, 2)
);

INSERT INTO instrutor (nome, salario) VALUES ('Vinicius Dias', 100);

CREATE FUNCTION dobro_do_salario(instrutor) RETURNS DECIMAL AS $$
	SELECT $1.salario * 2 AS dobro
$$ LANGUAGE SQL;

SELECT nome, dobro_do_salario(instrutor.*) AS desejo FROM instrutor;

CREATE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$
	SELECT 22 AS id, 'Nome falso' AS nome, 200.0 AS salario
$$ LANGUAGE SQL;

SELECT cria_instrutor_falso();

SELECT * FROM cria_instrutor_false();

INSERT INTO instrutor (nome, salario) VALUES ('Diogo Mascarenhas', 200);
INSERT INTO instrutor (nome, salario) VALUES ('Nico Steppat', 300);
INSERT INTO instrutor (nome, salario) VALUES ('Juliana', 400);
INSERT INTO instrutor (nome, salario) VALUES ('Priscila', 500);

CREATE FUNCTION instrutores_bem_pagos(valor_salario DECIMAL) RETURNS SETOF instrutor AS $$
	SELECT * FROM instrutor WHERE salario > valor_salario;
$$ LANGUAGE SQL;

SELECT * FROM instrutores_bem_pagos(300);

CREATE TABLE a (nome VARCHAR(255) NOT NULL);

CREATE OR REPLACE FUNCTION cria_a(nome VARCHAR) RETURNS void AS $$
	BEGIN
		INSERT INTO a (nome) VALUES('Patricia');
	END;
$$ LANGUAGE plpgsql;

SELECT cria_a('Vinicius Dias');

SELECT * FROM a;

CREATE OR REPLACE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$
	BEGIN
		RETURN ROW(22, 'Nome falso', 200.0)::instrutor; 
	END;
$$ LANGUAGE plpgsql;

SELECT cria_instrutor_falso();

SELECT * FROM cria_instrutor_false();


CREATE OR REPLACE FUNCTION cria_instrutor_falso2() RETURNS instrutor AS $$
	DECLARE
		retorno instrutor;
	BEGIN
		SELECT 22, 'Nome falso', 200.0 INTO retorno; 
		RETURN retorno;
	END;
$$ LANGUAGE plpgsql;

SELECT cria_instrutor_falso2();

SELECT id, salario FROM cria_instrutor_falso2();


CREATE OR REPLACE FUNCTION instrutores_bem_pagos2(valor_salario DECIMAL) RETURNS SETOF instrutor AS $$
	BEGIN
		RETURN QUERY SELECT * FROM instrutor WHERE salario > valor_salario;
	END;
$$ LANGUAGE plpgsql;

SELECT * FROM instrutores_bem_pagos2(300);
