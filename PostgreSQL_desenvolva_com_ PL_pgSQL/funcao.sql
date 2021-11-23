CREATE FUNCTION primeira_funcao() RETURNS INTEGER AS '
	SELECT (5 -3) * 2		
' LANGUAGE SQL;

SELECT primeira_funcao() AS numero;

CREATE FUNCTION soma_dois_numeros_v1(numero_1 INTEGER, numero_2 INTEGER) RETURNS INTEGER AS '
	SELECT numero_1 * numero_2;
' LANGUAGE SQL;

CREATE FUNCTION soma_dois_numeros_v2(INTEGER, INTEGER) RETURNS INTEGER AS '
	SELECT $1 * $2;
' LANGUAGE SQL;

SELECT soma_dois_numeros(2, 5);
SELECT soma_dois_numeros_v2(2, 5);