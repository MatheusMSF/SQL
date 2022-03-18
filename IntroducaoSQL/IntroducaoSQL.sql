/*
Atividade de banco de dados relacional Mysql.

Atividade 1

Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema
trabalhará com as informações dos funcionaries desta empresa.*/
CREATE DATABASE db_servico_RH;

USE db_servico_RH;

/*Crie uma tabela de funcionaries e utilizando a habilidade de abstração e determine 5
atributos relevantes dos funcionaries para se trabalhar com o serviço deste RH.*/
CREATE TABLE funcionario(
	id_func BIGINT AUTO_INCREMENT,
    nome_func VARCHAR(255),
    nasc_func DATE,
    cpf_func CHAR(11),
    salario_func DECIMAL,
    
	primary key(id_func)
);

-- Popule esta tabela com até 5 dados.
INSERT INTO funcionario(nome_func,nasc_func,cpf_func,salario_func) VALUES 
("Arthur Marinho","2001-10-18","12345678911",5000.00),
("Rafaela dos Santos","1999-08-20","12345678922",5500.00),
("Lucas Oliveira","2005-10-20","12345678933",1900.00),
("Elouisa Samanta","2004-08-14","12345678944",1955.00),
("Renan Fonseca","1998-11-09","12345678955",2100.00);

-- Faça um select que retorne os funcionaries com o salário maior do que 2000.
SELECT id_func,nome_func,salario_func FROM funcionario WHERE salario_func > 2000;

-- Faça um select que retorne os funcionaries com o salário menor do que 2000.
SELECT id_func,nome_func,salario_func FROM funcionario WHERE salario_func < 2000;

-- Ao término atualize um dado desta tabela através de uma query de atualização.
UPDATE funcionario SET salario_func = 5700.00 WHERE id_func = 2;

/* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Atividade 2

Crie um banco de dados para um e commerce, onde o sistema trabalhará com as
informações dos produtos deste ecommerce.*/
CREATE DATABASE db_ecommerce;

USE db_ecommerce;

/*Crie uma tabela produtos e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos produtos para se trabalhar com o serviço deste ecommerce.*/
CREATE TABLE tb_produto(
	id_prod BIGINT AUTO_INCREMENT,
    nome_prod VARCHAR(255),
    preco_prod DECIMAL,
    estoque_prod INT,
    fornecedor_prod VARCHAR(255),
    
	primary key(id_prod)
);

-- Popule esta tabela com até 8 dados.
INSERT INTO tb_produto(nome_prod,preco_prod,estoque_prod,fornecedor_prod) VALUES 
("Tênis",50.00,500,"Meu Tênis"),
("Bola pesada de boliche",349.00,30,"BolasBO"),
("Pino de boliche",57.00,150,"BolasBO"),
("Bola leve de boliche",560.00,45,"Bomb"),
("Bola de boliche peso regular",324.00,80,"Bomb"),
("Peteca",25.00,50,"BolasBO"),
("Raquete de badminton",69.00,25,"Tete"),
("Rede de badminton",600.00,10,"Tete");

-- Faça um select que retorne os produtos com o valor maior do que 500.
SELECT * FROM tb_produto WHERE preco_prod > 500;

-- Faça um select que retorne os produtos com o valor menor do que 500.
SELECT * FROM tb_produto WHERE preco_prod < 500;

-- Ao término atualize um dado desta tabela através de uma query de atualização.
UPDATE tb_produto SET fornecedor_prod = "Bomb" WHERE id_prod = 2;


/* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Atividade 3

Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará com as
informações dos estudantes deste registro dessa escola.*/
CREATE DATABASE db_escola;

USE db_escola;

/*Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos estudantes para se trabalhar com o serviço dessa escola.*/
CREATE TABLE tb_estudante(
	id_estu BIGINT AUTO_INCREMENT,
    nome_estu VARCHAR(255),
    nasc_estu DATE,
    curso_estu VARCHAR(255),
	nota_estu real,
    
	primary key(id_estu)
);

-- Popule esta tabela com até 8 dados.
INSERT INTO tb_estudante(nome_estu,nasc_estu,curso_estu,nota_estu) VALUES 
("Igor Londres","2000-11-10","Informática",5),
("Vayne de Souza","2000-09-12","Informática",8),
("Renata Gina","2000-06-15","Informática",7.2),
("Jorge Fonseca","2001-11-08","Administração",8),
("Cristiano Silva","2001-10-11","Administração",5.7),
("Zé Antônio Oliveira","2002-01-02","Química",10),
("Maiara Rocha","2002-01-27","Química",6.8),
("Renato Grande","2002-07-02","Administração",9.8);

-- Faça um select que retorne o/as estudantes com a nota maior do que 7.
SELECT * FROM tb_estudante WHERE nota_estu > 7;

-- Faça um select que retorne o/as estudantes com a nota menor do que 7.
SELECT * FROM tb_estudante WHERE nota_estu < 7;

-- Ao término atualize um dado desta tabela através de uma query de atualização.
UPDATE tb_estudante SET curso_estu = "Química" WHERE id_estu = 4;
