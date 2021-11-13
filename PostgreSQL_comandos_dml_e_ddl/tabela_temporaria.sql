CREATE TEMPORARY TABLE a (
	coluna VARCHAR(255) NOT NULL CHECK(coluna <> '')
);

INSERT INTO a VALUES('');
INSERT INTO a VALUES(NULL);
INSERT INTO a VALUES('Vinicius');

SELECT * FROM a;

CREATE TEMPORARY TABLE b (
	coluna1 VARCHAR(255) NOT NULL CHECK(coluna1 <> ''),
	coluna2 VARCHAR(255),
	UNIQUE (coluna1, coluna2)
);

INSERT INTO b VALUES('a', 'b');

-- Nao consegue inserir novamente
INSERT INTO b VALUES('a', 'b');

-- Precisa mudar ao menos uma das colunas
INSERT INTO b VALUES('a', 'z');

ALTER TABLE b RENAME TO teste;
ALTER TABLE teste RENAME coluna1 TO primeira_coluna; 
ALTER TABLE teste RENAME coluna2 TO segunda_coluna; 
SELECT * FROM teste;