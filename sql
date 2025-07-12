CREATE DATABASE db_faculdade;

USE db_faculdade;

CREATE TABLE tbl_cursos (
		id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        nome_curso VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_disciplinas( 
		id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		nome_disciplina VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_disciplina_cursos (
		id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        fk_id_curso INT NOT NULL,
        fk_id_disciplina INT NOT NULL,
        
		FOREIGN KEY (fk_id_curso) 
        REFERENCES tbl_cursos (id),
        
        FOREIGN KEY (fk_id_disciplina)
        REFERENCES tbl_disciplinas (id)
);

CREATE TABLE tbl_professores (
		id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        nome_professor VARCHAR(100) NOT NULL,
        cpf VARCHAR (25) NOT NULL,
        data_de_nascimento DATE NOT NULL, 
        telefone VARCHAR (45) NOT NULL,
        email VARCHAR(350) NOT NULL
);

CREATE TABLE tbl_turmas (
		id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        numero_turma VARCHAR(50) NOT NULL,
        fk_id_disciplina INT NOT NULL, 
        fk_id_professor INT NOT NULL,
        
        FOREIGN KEY (fk_id_disciplina)
        REFERENCES tbl_disciplinas (id),

		FOREIGN KEY (fk_id_professor)
        REFERENCES tbl_professores (id)
);

CREATE TABLE tbl_alunos (
		id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        nome_aluno VARCHAR (100) NOT NULL,
        cpf VARCHAR(45) NOT NULL,
        data_de_nascimento DATE NOT NULL, 
        telefone VARCHAR(45) NOT NULL,
        email VARCHAR(350) NOT NULL
);

CREATE TABLE tbl_matricula (
		id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        data_matricula DATE NOT NULL,
        status VARCHAR(10) NOT NULL,
        fk_id_turma INT NOT NULL,
        fk_id_aluno INT NOT NULL, 

		FOREIGN KEY (fk_id_turma)
        REFERENCES tbl_turmas (id),
        
		FOREIGN KEY (fk_id_aluno)
        REFERENCES tbl_alunos (id)
);

CREATE TABLE tbl_aluno_turmas (
		id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        nota INT NOT NULL,
        fk_id_turma INT NOT NULL,
        fk_id_aluno INT NOT NULL,
        
        FOREIGN KEY (fk_id_turma)
        REFERENCES tbl_turmas (id),
        
        FOREIGN KEY (fk_id_aluno)
        REFERENCES tbl_alunos (id)
);

show tables;

INSERT INTO tbl_cursos (nome_curso) VALUES 
('Administração'),
('Análise e Desenvolvimento de Sistemas');
SELECT * FROM tbl_cursos;

INSERT INTO tbl_disciplinas (nome_disciplina) VALUES 
('Banco de Dados'),
('Lógica matemática'),
('Lógica de Programação');
SELECT * FROM tbl_disciplinas;

INSERT INTO tbl_alunos (nome_aluno, cpf, data_de_nascimento, telefone, email)
VALUES ('João Pedro', '999.999.999-99', '2004-08-20', '11988887777', 'joao.pedro@email.com');
SELECT * FROM tbl_alunos;

INSERT INTO tbl_professores (nome_professor, cpf, data_de_nascimento, telefone, email)
VALUES ('Marcos Silva', '123.456.789-00', '1980-05-10', '11999990000', 'marcos.silva@faculdade.edu');
SELECT * FROM tbl_professores;

INSERT INTO tbl_turmas (numero_turma, fk_id_disciplina, fk_id_professor)
VALUES ('TADS2025-A', 1, 1);
SELECT * FROM tbl_turmas;

INSERT INTO tbl_aluno_turmas (nota, fk_id_turma, fk_id_aluno)
VALUES (8, 1, 1);
SELECT * FROM tbl_aluno_turmas;

#notas alunos
SELECT 
    tbl_disciplinas.nome_disciplina AS materia,
    tbl_alunos.nome_aluno AS aluno,
    tbl_aluno_turmas.nota
FROM tbl_aluno_turmas
INNER JOIN tbl_alunos 
    ON tbl_aluno_turmas.fk_id_aluno = tbl_alunos.id
INNER JOIN tbl_turmas 
    ON tbl_aluno_turmas.fk_id_turma = tbl_turmas.id
INNER JOIN tbl_disciplinas 
    ON tbl_turmas.fk_id_disciplina = tbl_disciplinas.id;

