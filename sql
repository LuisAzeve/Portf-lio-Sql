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
