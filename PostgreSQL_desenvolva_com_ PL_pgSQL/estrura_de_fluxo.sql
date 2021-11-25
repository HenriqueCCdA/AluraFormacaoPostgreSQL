CREATE FUNCTION salario_ok(instrutor instrutor) RETURNS VARCHAR AS $$ 
	BEGIN
		-- se o salário do instrutor for maior do que 200, está ok. Senão, pode aumentar
		IF instrutor.salario > 200 THEN
			RETURN 'Salário está ok';
		ELSE
			RETURN 'Salário pode aumentar';
		END IF;
	END;
$$ LANGUAGE plpgsql;

SELECT nome, salario_ok(instrutor) FROM instrutor;

CREATE FUNCTION salario_ok_v2(id_instrutor INTEGER) RETURNS VARCHAR AS $$ 
	DECLARE
		instrutor instrutor;
	BEGIN
		SELECT * FROM instrutor WHERE id = id_instrutor INTO instrutor;
		-- se o salário do instrutor for maior do que 200, está ok. Senão, pode aumentar
		IF instrutor.salario > 200 THEN
			RETURN 'Salário está ok';
		ELSE
			RETURN 'Salário pode aumentar';
		END IF;
	END;
$$ LANGUAGE plpgsql;

SELECT nome, salario_ok_v2(instrutor.id) FROM instrutor;

CREATE FUNCTION salario_ok_v3(id_instrutor INTEGER) RETURNS VARCHAR AS $$ 
	DECLARE
		instrutor instrutor;
	BEGIN
		SELECT * FROM instrutor WHERE id = id_instrutor INTO instrutor;
		-- se o salário do instrutor for maior do que 300, está ok. Se for 300 reais, então pode aumentar. Caso contrário, o salário está defasado.
		IF instrutor.salario > 300 THEN
			RETURN 'Salário está ok';
		ELSEIF instrutor.salario = 300 THEN
			RETURN 'Salário pode aumentar';
		ELSE
			RETURN 'Salário está defasado';
		END IF;
	END;
$$ LANGUAGE plpgsql;

SELECT nome, salario_ok_v3(instrutor.id) FROM instrutor;

CREATE OR REPLACE FUNCTION salario_ok_v4(id_instrutor INTEGER) RETURNS VARCHAR AS $$ 
	DECLARE
		instrutor instrutor;
	BEGIN
		SELECT * FROM instrutor WHERE id = id_instrutor INTO instrutor;
		-- se o salário do instrutor for maior do que 300, está ok. Se for 300 reais, então pode aumentar. Caso contrário, o salário está defasado.
		CASE instrutor.salario
			WHEN 100 THEN
				RETURN 'Salário muito baixo';
			WHEN 200 THEN
				RETURN 'Salário baixo';
			WHEN 300 THEN
				RETURN 'Salário ok';
			ELSE
				RETURN 'Salário ótimo';
		END CASE;
	END;
$$ LANGUAGE plpgsql;

SELECT nome, salario_ok_v4(instrutor.id) FROM instrutor;

CREATE OR REPLACE FUNCTION tabuada(numero INTEGER) RETURNS SETOF VARCHAR AS $$
	DECLARE 
		multiplicador INTEGER DEFAULT 1;
	BEGIN
		-- multiplicador que começa com 1, e vai até < 10
		-- numero * multiplicador
		LOOP
			RETURN NEXT numero || ' x ' || multiplicador || ' = ' || numero * multiplicador;			
			multiplicador := multiplicador + 1;			
			EXIT WHEN multiplicador = 10;
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

SELECT tabuada(9);


CREATE OR REPLACE FUNCTION tabuada_v2(numero INTEGER) RETURNS SETOF VARCHAR AS $$
	DECLARE 
		multiplicador INTEGER DEFAULT 1;
	BEGIN
		-- multiplicador que começa com 1, e vai até < 10
		-- numero * multiplicador
		WHILE multiplicador < 10 LOOP
			RETURN NEXT numero || ' x ' || multiplicador || ' = ' || numero * multiplicador;			
			multiplicador := multiplicador + 1;			
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

SELECT tabuada_v2(9);

CREATE OR REPLACE FUNCTION tabuada_v3(numero INTEGER) RETURNS SETOF VARCHAR AS $$
	BEGIN
		FOR multiplicador IN 1..9 LOOP
			RETURN NEXT numero || ' x ' || multiplicador || ' = ' || numero * multiplicador;									
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

SELECT tabuada_v3(9);

CREATE OR REPLACE FUNCTION instrutor_com_salario(OUT nome VARCHAR, OUT salario_ok VARCHAR) RETURNS SETOF record AS $$ 
	DECLARE
		instrutor instrutor;
	BEGIN
		FOR instrutor IN SELECT * FROM instrutor LOOP
			nome := instrutor.nome;
			salario_ok := salario_ok_v2(instrutor.id);
			RETURN NEXT;
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

SELECT * FROM instrutor_com_salario();