-- CÓDIGOS DOS DESAFIOS

ALTER TABLE alunos                  -- Desafio 01
ADD telefone VARCHAR(20);

ALTER TABLE matriculas              -- Desafio 02
MODIFY COLUMN curso VARCHAR(150);

ALTER TABLE matriculas              -- Desafio 03
ADD FOREIGN KEY (aluno_id) REFERENCES alunos(id);

SELECT a.id, a.nome, m.curso, m.data_matricula FROM alunos a
JOIN matriculas m ON a.id = m.aluno_id;

CREATE VIEW alunos_matriculados AS  -- Desafio 04
SELECT a.id, a.nome, m.curso, m.data_matricula FROM alunos a
JOIN matriculas m ON a.id = m.aluno_id;

-- CÓDIGOS DAS VALIDAÇÕES

DROP TABLE alunos;                  -- Validação 01
-- Retorno: ERROR 3730 (HY000): Cannot drop table 'alunos' referenced by
-- a foreign key constraint 'matriculas_ibfk_1' on table 'matriculas'.

INSERT INTO alunos(id, nome, telefone) VALUES (4, 'Lucas Ferreira', null);
INSERT INTO alunos(id, nome, telefone) VALUES (5, 'Rose Nascimento', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
-- Retorno: ERROR 1406 (22001): Data -- Validação 02
-- too long for column 'telefone' at row 1

SELECT * FROM alunos_matriculados;   -- Validação 03
-- Retorno: tudo certo

