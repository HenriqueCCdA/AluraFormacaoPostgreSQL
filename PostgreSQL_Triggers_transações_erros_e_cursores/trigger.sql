DROP TABLE instrutor;
CREATE TABLE instrutor(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	salario DECIMAL(10, 2)
);

INSERT INTO instrutor (nome, salario) VALUES ('Vinicius Dias'    , 100.00);
INSERT INTO instrutor (nome, salario) VALUES ('Diogo Mascarenhas', 200.00);
INSERT INTO instrutor (nome, salario) VALUES ('Nico Steppat'     , 300.00);
INSERT INTO instrutor (nome, salario) VALUES ('Juliana'          , 400.00);
INSERT INTO instrutor (nome, salario) VALUES ('Priscila'         , 500.00);



CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES academico.categoria(id)
);

CREATE TABLE aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES academico.aluno(id),
	curso_id INTEGER NOT NULL REFERENCES academico.curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

CREATE OR REPLACE FUNCTION cria_curso(nome_curso VARCHAR, nome_categoria VARCHAR) RETURNS void AS $$
	DECLARE
		id_categoria INTEGER;
	BEGIN
		SELECT id INTO id_categoria FROM categoria WHERE nome = nome_categoria;
		
		IF NOT FOUND THEN
			INSERT INTO categoria (nome) VALUES(nome_categoria) RETURNING id INTO id_categoria;			
		END IF;
		
		INSERT INTO curso (nome, categoria_id) VALUES (nome_curso, id_categoria);
	END;
$$ LANGUAGE plpgsql;

SELECT cria_curso('PHP', 'Programação');
SELECT cria_curso('Java', 'Programação');
SELECT * FROM curso;
SELECT * FROM categoria;

CREATE TABLE log_instrutores(
	id SERIAL PRIMARY KEY,
	informacao VARCHAR(255),
	momento_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP FUNCTION cria_instrutor;
CREATE OR REPLACE FUNCTION cria_instrutor() RETURNS TRIGGER AS $$
	DECLARE
		media_salarial DECIMAL;
		instrutores_recebem_menos INTEGER;
		total_instrutores INTEGER;
		salario DECIMAL;
		percentual DECIMAL;
	BEGIN			
		SELECT AVG(instrutor.salario) INTO media_salarial FROM instrutor WHERE id <> NEW.id;
		
		IF NEW.salario > media_salarial THEN
			INSERT INTO log_instrutores (informacao) VALUES (NEW.nome || ' recebe acima da média');
			RETURN NULL;
		END IF;
		
		FOR salario IN SELECT instrutor.salario FROM instrutor WHERE id <> NEW.id LOOP
			total_instrutores := total_instrutores;
			IF NEW.salario > salario THEN
				instrutores_recebem_menos := instrutores_recebem_menos + 1;
			END IF;
		END LOOP;
		
		percentual = instrutores_recebem_menos::DECIMAL / total_instrutores::DECIMAL * 100;
		
		INSERT INTO log_instrutores (informacao)
			VALUES (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores');			
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

DROP TRIGGER cria_log_intrutores ON instrutor;
CREATE TRIGGER cria_log_intrutores BEFORE INSERT ON instrutor
	FOR EACH ROW EXECUTE FUNCTION cria_instrutor();
	
SELECT * FROM instrutor;
SELECT * FROM log_instrutores;

INSERT INTO instrutor(nome, salario) VALUES ('Outra pessoa de novo', 300);