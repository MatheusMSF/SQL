/*Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desse açougue.

Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço desse açougue(não esqueça de
criar a foreign key de tb_categoria nesta tabela).*/

CREATE DATABASE db_cidade_das_carnes;

CREATE TABLE tb_categoria(
	id_cat BIGINT AUTO_INCREMENT,
    nome_cat VARCHAR(255),
    colocacao_cat VARCHAR(255),
    
    PRIMARY KEY(id_cat));
    
CREATE TABLE tb_produto(
	id_pro BIGINT AUTO_INCREMENT,
    nome_pro VARCHAR(255),
    preco_pro decimal(8,2),
    peso_pro decimal(8.3),
    estoque_pro INT,
    fabricante_pro VARCHAR(255),
    id_cat BIGINT,
    
    PRIMARY KEY(id_pro),
    FOREIGN KEY(id_cat) REFERENCES tb_categoria(id_cat));

-- Popule esta tabela Categoria com até 5 dados.
INSERT INTO tb_categoria(nome_cat,colocacao_cat) VALUES
("Bovinos","Primeira"),
("Aves","Caipira"),
("Frutos do mar","Crustáceo"),
("Aves"," Galeto"),
("Bovinos","Segunda");

-- Popule esta tabela Produto com até 8 dados.
INSERT INTO tb_produto(nome_pro,preco_pro,peso_pro,estoque_pro,fabricante_pro,id_cat) VALUES
("Coxão mole",70.50,1,20,"BoiVimos",1),
("Contrafilé",80.00,1,20,"BoiVimos",1),
("Picanha",50.10,5,20,"BoiVimos",1),
("Frango",20.00,20,40,"PruPru",2),
("Frango",25.55,20,30,"PruPru",4),
("Caranguejo",45.60,1,15,"Mar Profundo",3),
("Coxão duro",30.20,1,10,"BoiVimos",5),
("Costela",40.55,1,15,"BoiVimos",5);

update tb_produto set preco_pro = 45.60 where id_pro = 6;

-- Faça um select que retorne os Produtos com o valor maior do que 50 reais.
SELECT * FROM tb_produto WHERE preco_pro > 50;

-- Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
SELECT * FROM tb_produto WHERE preco_pro BETWEEN 3 AND 60;

-- Faça um select utilizando LIKE buscando os Produtos com a letra C.
SELECT * FROM tb_produto WHERE nome_pro LIKE "%c%"; 

-- Faça um um select com Inner join entre tabela categoria e produto.
SELECT nome_pro as produto, preco_pro as preco, peso_pro as "peso(KG)", estoque_pro as estoque,  
fabricante_pro as fabricante, tb_categoria.nome_cat as categoria, 
tb_categoria.colocacao_cat as Colocacao FROM tb_produto 
INNER JOIN tb_categoria ON tb_produto.id_cat = tb_categoria.id_cat;

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são aves ou legumes).*/
SELECT nome_pro as produto, preco_pro as preco, peso_pro as "peso(KG)", estoque_pro as estoque,  
fabricante_pro as fabricante, tb_categoria.nome_cat as categoria, 
tb_categoria.colocacao_cat as Colocacao FROM tb_produto 
INNER JOIN tb_categoria ON tb_produto.id_cat = tb_categoria.id_cat WHERE tb_categoria.id_cat = 1;

