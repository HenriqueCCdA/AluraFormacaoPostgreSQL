CREATE TEMPORARY TABLE cursos_programacao(
	id_curso INTEGER PRIMARY KEY,
	nome_curso VARCHAR(255) NOT NULL
);

-- INSERT INTO cursos_programacao VALUES (4, 'PHP'), (5, 'Java'), (6, 'C++');


INSERT INTO cursos_programacao
SELECT academico.curso.id,
	   academico.curso.nome
	FROM academico.curso
	JOIN academico.categoria ON academico.categoria.id = academico.curso.categoria_id
   WHERE categoria_id =2;
   
SELECT * FROM cursos_programacao;

CREATE SCHEMA teste;

CREATE TABLE teste.cursos_programacao(
	id_curso INTEGER PRIMARY KEY,
	nome_curso VARCHAR(255) NOT NULL
);

-- INSERT INTO cursos_programacao VALUES (4, 'PHP'), (5, 'Java'), (6, 'C++');


INSERT INTO teste.cursos_programacao
SELECT academico.curso.id,
	   academico.curso.nome
	FROM academico.curso
	JOIN academico.categoria ON academico.categoria.id = academico.curso.categoria_id
   WHERE categoria_id =2;
   
SELECT * FROM teste.cursos_programacao;

SELECT * FROM academico.curso ORDER BY 1;

UPDATE academico.curso SET nome = 'PHP Básico' WHERE id = 4;
UPDATE academico.curso SET nome = 'Java Básico' WHERE id = 5;
UPDATE academico.curso SET nome = 'C++ Básico' WHERE id = 6;

UPDATE teste.cursos_programacao SET nome_curso = nome
	FROM academico.curso WHERE teste.cursos_programacao.id_curso = academico.curso.id
	AND academico.curso.id < 10;

