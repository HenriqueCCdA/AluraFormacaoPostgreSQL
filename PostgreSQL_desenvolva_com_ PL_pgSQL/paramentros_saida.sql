CREATE TYPE dois_valores AS (soma INTEGER, produto INTEGER);

CREATE FUNCTION soma_e_produto (numero_1 INTEGER, numero_2 INTEGER, OUT soma INTEGER, OUT produto INTEGER) AS $$	
	SELECT numero_1 + numero_2 AS soma, numero_1 * numero_2 AS produto;
$$ LANGUAGE SQL;

CREATE FUNCTION soma_e_produto2 (numero_1 INTEGER, numero_2 INTEGER) RETURNS dois_valores AS $$	
	SELECT numero_1 + numero_2 AS soma, numero_1 * numero_2 AS produto;
$$ LANGUAGE SQL;

SELECT * FROM soma_e_produto(3, 3);

SELECT * FROM soma_e_produto2(3, 3);