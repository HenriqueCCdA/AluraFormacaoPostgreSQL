SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * FROM curso;

DELETE FROM aluno WHERE id = 1;

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso(
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	FOREIGN KEY (aluno_id) REFERENCES aluno (id) ON DELETE CASCADE,
	FOREIGN KEY (curso_id) REFERENCES curso (id)
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,3);

SELECT * FROM aluno_curso;

SELECT aluno.nome AS "Nome do aluno",
	   curso.nome AS "Nome do curso"	
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso 		 ON curso.id             = aluno_curso.curso_id;
	
UPDATE aluno SET id = 10 WHERE id = 2;	


CREATE TABLE aluno_curso(
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	FOREIGN KEY (aluno_id) REFERENCES aluno (id) 
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY (curso_id) REFERENCES curso (id)
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);

SELECT 
	   aluno.id AS aluno_id,
	   aluno.nome AS "Nome do aluno",
	   curso.id AS curso_id,
	   curso.nome AS "Nome do curso"	
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso 		 ON curso.id             = aluno_curso.curso_id;
	
UPDATE aluno SET id = 10 WHERE id = 2;	