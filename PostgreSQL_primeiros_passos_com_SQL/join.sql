SELECT * FROM aluno;
SELECT * FROM curso;
SELECT * FROM aluno_curso;

SELECT *
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso 		 ON curso.id             = aluno_curso.curso_id;
	
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2, 2)

SELECT aluno.nome AS aluno,
	   curso.nome AS curso	
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso 		 ON curso.id             = aluno_curso.curso_id;
	
	
SELECT aluno.nome AS "Nome do aluno",
	   curso.nome AS "Nome do curso"	
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso 		 ON curso.id             = aluno_curso.curso_id;
	
INSERT INTO curso(id, nome) VALUES (3, 'CSS');

SELECT aluno.nome AS "Nome do aluno",
	   curso.nome AS "Nome do curso"	
	FROM aluno
    LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	LEFT JOIN curso 	  ON curso.id             = aluno_curso.curso_id;
	
SELECT aluno.nome AS "Nome do aluno",
	   curso.nome AS "Nome do curso"	
	FROM aluno
    RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	RIGHT JOIN curso 	  ON curso.id             = aluno_curso.curso_id;
	
SELECT aluno.nome AS "Nome do aluno",
	   curso.nome AS "Nome do curso"	
	FROM aluno
    FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	FULL JOIN curso 	  ON curso.id             = aluno_curso.curso_id;
	
SELECT aluno.nome AS "Nome do aluno",
	   curso.nome AS "Nome do curso"	
	FROM aluno
    CROSS JOIN curso;
	
INSERT INTO aluno (nome) VALUES ('João');

SELECT aluno.nome AS "Nome do aluno",
	   curso.nome AS "Nome do curso"	
	FROM aluno
    CROSS JOIN curso;