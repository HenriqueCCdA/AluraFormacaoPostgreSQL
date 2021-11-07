-- Count - Retorna a quantidade de registos
-- SUM   - Retorna a soma dos registros
-- MAX   - Retorna o maior valor dos registros
-- MIN   - Retorna o meno valor dos registros
-- AVG   - Retorna a média dos registros

SELECT 
	COUNT(id), 
	SUM(id), 
	MAX(id), 
	MIN(id), 
	ROUND(AVG(id), 2)
	FROM funcionarios;
	
-- Lista apenas nomes distintos
SELECT DISTINCT 
	nome,
	sobrenome
	FROM funcionarios
	ORDER BY nome;
	
-- conta o numero de nome e sobrenome iguais
SELECT  
	nome,
	sobrenome,
	COUNT(id)	
	FROM funcionarios
	GROUP BY nome, sobrenome
	ORDER BY nome;
	
SELECT  
	nome,
	sobrenome,
	COUNT(id)	
	FROM funcionarios
	GROUP BY 1, 2
	ORDER BY nome;
	
SELECT curso.nome,
		COUNT(aluno.id)
	FROM aluno
	JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
	JOIN curso ON curso.id = aluno_curso.curso_id
	GROUP BY 1
	ORDER BY 1;
	
SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * FROM curso;

SELECT *
	FROM curso
	LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
	LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id;

SELECT curso.nome,
	COUNT(aluno.id)
	FROM curso
	LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
	LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
	GROUP BY 1
	HAVING COUNT(aluno.id) > 0;
	
SELECT nome,
		COUNT(id)
	FROM funcionarios
	GROUP BY nome
	HAVING COUNT(id) > 1;
	
SELECT nome,
		COUNT(id)
	FROM funcionarios
	GROUP BY nome
	HAVING COUNT(id) = 1;