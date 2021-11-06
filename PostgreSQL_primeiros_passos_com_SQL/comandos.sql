CREATE TABLE aluno (
	id SERIAL,
	nome VARCHAR(255),
	cpf CHAR(11),
	observacao TEXT,
	idade INTEGER,
	dinheiro NUMERIC(10,2),
	altura REAL,
	ativo BOOLEAN,
	data_nascimento DATE,
	hora_aula TIME,
	matriculado_em TIMESTAMP
);

SELECT * FROM aluno;

INSERT INTO aluno (
	nome, 
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em
) 
VALUES (
	'Diogo', 
	'12345678901',
	'Lorem ipsum dolor sit amet. Eum consequatur laboriosam qui voluptatem maxime sit neque laudantium in recusandae voluptas At delectus sunt id omnis delectus quo sunt exercitationem. Vel corporis provident et nihil aliquid et omnis cupiditate et nemo nobis! Qui recusandae corporis aut dolorem nobis et velit optio in dolor voluptatibus!',
	35,
	100.50,
	1.81,
	TRUE,
	'1984-08-27',
	'17:30:00',
	'2020-02-08 12:32:45'
);

UPDATE aluno 
 SET nome = 'Nico', 
	cpf = '10987654321',
	observacao = 'Teste',
	idade = 38,
	dinheiro = 15.23,
	altura = 1.90,
	ativo = FALSE,
	data_nascimento = '1980-01-15',
	hora_aula = '13:00:00',
	matriculado_em = '2021-01-02 15:00:00'
WHERE id = 1;

DELETE
	FROM aluno
	WHERE nome = 'Nico';
	
INSERT INTO aluno (
	nome, 
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em
) 
VALUES (
	'Diogo', 
	'12345678901',
	'Lorem ipsum dolor sit amet. Eum consequatur laboriosam qui voluptatem maxime sit neque laudantium in recusandae voluptas At delectus sunt id omnis delectus quo sunt exercitationem. Vel corporis provident et nihil aliquid et omnis cupiditate et nemo nobis! Qui recusandae corporis aut dolorem nobis et velit optio in dolor voluptatibus!',
	35,
	100.50,
	1.81,
	TRUE,
	'1984-08-27',
	'17:30:00',
	'2020-02-08 12:32:45'
);
	
SELECT * FROM aluno;

SELECT nome AS "Nome do aluno", 
	   idade, 
	   matriculado_em AS quando_se_matriculou
	FROM aluno;
	
INSERT INTO aluno (nome) VALUES ('Vinicius Dias');
INSERT INTO aluno (nome) VALUES ('Nico Steppat');
INSERT INTO aluno (nome) VALUES ('João Roberto');
INSERT INTO aluno (nome) VALUES ('Diego');

SELECT * FROM aluno
WHERE nome LIKE 'Di_go'
;

SELECT * FROM aluno
WHERE nome NOT LIKE 'Di_go'
;

SELECT * FROM aluno
WHERE nome LIKE 'D%';

	
SELECT * FROM aluno
WHERE nome LIKE '%s';

SELECT * FROM aluno
WHERE nome LIKE '% %';
	
SELECT * FROM aluno
WHERE nome LIKE '%i%a%';
	
SELECT * FROM aluno
WHERE cpf IS NULL;

SELECT * FROM aluno WHERE cpf IS NOT NULL;	

SELECT * FROM aluno WHERE idade = 35;

SELECT * FROM aluno WHERE idade <> 36;

SELECT * FROM aluno WHERE idade >= 35;

SELECT * FROM aluno WHERE idade <= 35;

SELECT * FROM aluno WHERE idade BETWEEN 10 and 35;

SELECT * FROM aluno WHERE ativo = false;

SELECT * FROM aluno WHERE ativo IS NULL;