BEGIN;
DELETE FROM teste.cursos_programacao;
SELECT * FROM teste.cursos_programacao;
ROLLBACK;

BEGIN;
DELETE FROM teste.cursos_programacao WHERE id_curso = 5;
SELECT * FROM teste.cursos_programacao;
COMMIT;