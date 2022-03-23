CREATE DATABASE db_generation_game_online;

CREATE TABLE tb_classe(
	id_clas BIGINT AUTO_INCREMENT,
    nome_clas VARCHAR(255),
    arma_clas VARCHAR(255),
    habilidade_clas VARCHAR(255),
    
    PRIMARY KEY(id_clas));
    
CREATE TABLE tb_personagem(
	id_pers BIGINT AUTO_INCREMENT,
    nome_pers VARCHAR(255),
    vida_pers int,
    defesa_pers int,
    ataque_pers int,
    elemento_pers VARCHAR(255),
    id_clas BIGINT,
    
    PRIMARY KEY(id_pers),
    FOREIGN KEY(id_clas) REFERENCES tb_classe(id_clas));
    
INSERT INTO tb_classe(nome_clas,arma_clas,habilidade_clas) VALUES
("Arqueiro(a)","Arco","Flecha perfurante"),
("Mago(a)","Livro de feitiços","Bola de poder"),
("Guerreiro(a)","Espada longa","Corte pesado"),
("Tanque","Escudo","Barreira"),
("Suporte","Cajado","Cura");

INSERT INTO tb_personagem(nome_pers,vida_pers,defesa_pers,ataque_pers,elemento_pers,id_clas) VALUES
("Zhung",12000,5200,1000,"Fogo",4),
("Morder",3500,1200,7000,"Gelo",1),
("Ala",7500,3000,3500,"Ar",3),
("Solde",5000,1900,700,"Água",5),
("Marta",3700,1000,6500,"Gelo",1),
("Colme",4500,1500,5500,"Eletricidade",2),
("Samira",10000,5500,1000,"Terra",4),
("Bianca",4300,1500,6000,"Fogo",2);

SELECT nome_pers, ataque_pers FROM tb_personagem WHERE ataque_pers > 2000;

SELECT nome_pers, defesa_pers FROM tb_personagem WHERE defesa_pers BETWEEN 1000 AND 2000;

SELECT nome_pers FROM tb_personagem WHERE nome_pers LIKE "%c%"; 

SELECT nome_pers as nome,vida_pers as vida,defesa_pers as defesa,
ataque_pers as ataque,elemento_pers as elemento, nome_clas as classe FROM tb_personagem 
INNER JOIN tb_classe ON tb_personagem.id_clas = tb_classe.id_clas;

SELECT nome_pers as nome,vida_pers as vida,defesa_pers as defesa,
ataque_pers as ataque,elemento_pers as elemento, nome_clas as classe FROM tb_personagem 
INNER JOIN tb_classe ON tb_personagem.id_clas = tb_classe.id_clas WHERE tb_classe.id_clas = 1;

