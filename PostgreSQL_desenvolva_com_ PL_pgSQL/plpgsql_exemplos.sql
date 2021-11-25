CREATE SCHEMA plpgsql;

CREATE TABLE plpgsql.aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

CREATE TABLE plpgsql.categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE plpgsql.curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES academico.categoria(id)
);

CREATE TABLE plpgsql.aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES academico.aluno(id),
	curso_id INTEGER NOT NULL REFERENCES academico.curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

CREATE OR REPLACE FUNCTION cria_curso(nome_curso VARCHAR, nome_categoria VARCHAR) RETURNS void AS $$
	DECLARE
		id_categoria INTEGER;
	BEGIN
		SELECT id INTO id_categoria FROM plpgsql.categoria WHERE nome = nome_categoria;
		
		IF NOT FOUND THEN
			INSERT INTO plpgsql.categoria (nome) VALUES(nome_categoria) RETURNING id INTO id_categoria;			
		END IF;
		
		INSERT INTO plpgsql.curso (nome, categoria_id) VALUES (nome_curso, id_categoria);
	END;
$$ LANGUAGE plpgsql;

SELECT cria_curso('PHP', 'Programação');
SELECT cria_curso('Java', 'Programação');
SELECT * FROM plpgsql.curso;
SELECT * FROM plpgsql.categoria;

CREATE TABLE plpgsql.log_instrutores(
	id SERIAL PRIMARY KEY,
	informacao VARCHAR(255),
	momento_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
);

CREATE OR REPLACE FUNCTION cria_instrutor (nome_instrutor VARCHAR, salario_instrutor DECIMAL) RETURNS void AS $$
	DECLARE
		id_instrutor_inserido INTEGER;
		media_salarial DECIMAL;
		instrutores_recebem_menos INTEGER;
		total_instrutores INTEGER;
		salario DECIMAL;
		precentual DECIMAL;
	BEGIN
		INSERT INTO plpgsql.instrutor (nome, salario) VALUES (nome_instrutor, salario_instrutor) RETURNING id INTO id_instrutor_inserido;
		
		SELECT AVG(instrutor.salario) INTO media_salarial FROM plpgsql.instrutor WHERE id <> id_instrutor_inserido;
		
		IF salario_instrutor > media_salarial THEN
			INSERT INTO log_instrutores (informacao) VALUES (nome_instrutor || 'recebe acima da média');
		END IF;
		
		FOR salario IN SELECT instrutor.salario FROM plpgsql.instrutor WHERE id <> id_instrutor_inserido LOOP
			total_instrutores := total_instrutores;
			IF salario_instrutor > salario THEN
				instrutores_recebem_menos := instrutores_recebem_menos + 1;
			END IF;
		END LOOP;
		
		precentual = instrutores_recebem_menos::DECIMAL / total_instrutores::DECIMAL * 100;
		
		INSERT INTO log_instrutores (informacao)
			VALUES (nome_instrutores || ' recebe mais do que ' || percentual || '% da grade de instrutores');
	END;
$$ LANGUAGE plpgsql;