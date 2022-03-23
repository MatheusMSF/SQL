/*Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desta farmacia.

Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5
atributos relevantes dos tb_produto para se trabalhar com o serviço deste farmacia(não
esqueça de criar a foreign key de tb_categoria nesta tabela).*/

CREATE DATABASE db_farmacia_do_bem;

CREATE TABLE tb_categoria(
	id_cat BIGINT AUTO_INCREMENT,
    nome_cat VARCHAR(255),
    receita_cat BOOLEAN,
    contraindicar_cat BOOLEAN,
    
    PRIMARY KEY(id_cat));
    
CREATE TABLE tb_produto(
	id_pro BIGINT AUTO_INCREMENT,
    nome_pro VARCHAR(255),
    preco_pro decimal(8,2),
    unidade_pro INT,
    estoque_pro INT,
    fabricante_pro VARCHAR(255),
    id_cat BIGINT,
    
    PRIMARY KEY(id_pro),
    FOREIGN KEY(id_cat) REFERENCES tb_categoria(id_cat));

-- Popule esta tabela Categoria com até 5 dados.
INSERT INTO tb_categoria(nome_cat,receita_cat,contraindicar_cat) VALUES
("Remédios",true,true),
("Remédios Genéricos",true,true),
("Cosméticos",false,false),
("Vitaminas",false,true),
("Comidas",false,false);

-- Popule esta tabela Produto com até 8 dados.
INSERT INTO tb_produto(nome_pro,preco_pro,unidade_pro,estoque_pro,fabricante_pro,id_cat) VALUES
("DorFora",15.99,12,700,"Remédios Prontos",1),
("NáuseasFora",20.00,5,1000,"Remédios Prontos",1),
("Máquiagem",15.00,1,300,"Von",3),
("Sabonete",1.50,1,500,"Higiene Sax",3),
("Perfume",25.90,1,250,"Von",3),
("Vitamina D",14.20,20,300,"Remédios Prontos",4),
("Barra de Cereal",2.00,1,150,"Neees",5),
("DorFora Genérico",12.80,12,500,"Remédios Prontos",2);

-- Faça um select que retorne os Produtos com o valor maior do que 50 reais.
SELECT * FROM tb_produto WHERE preco_pro > 50;

-- Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
SELECT * FROM tb_produto WHERE preco_pro BETWEEN 3 AND 60;

-- Faça um select utilizando LIKE buscando os Produtos com a letra B.
SELECT * FROM tb_produto WHERE nome_pro LIKE "%b%"; 

-- Faça um um select com Inner join entre tabela categoria e produto.
SELECT nome_pro as produto, preco_pro as preco, unidade_pro as unidade, estoque_pro as estoque,  
fabricante_pro as fabricante, tb_categoria.nome_cat as categoria, tb_categoria.receita_cat as receita,
tb_categoria.contraindicar_cat as contraindicacao FROM tb_produto 
INNER JOIN tb_categoria ON tb_produto.id_cat = tb_categoria.id_cat;

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são cosméticos).*/
SELECT nome_pro as produto, preco_pro as preco, unidade_pro as unidade, estoque_pro as estoque,  
fabricante_pro as fabricante, tb_categoria.nome_cat as categoria, tb_categoria.receita_cat as receita,
tb_categoria.contraindicar_cat as contraindicacao FROM tb_produto 
INNER JOIN tb_categoria ON tb_produto.id_cat = tb_categoria.id_cat WHERE tb_categoria.id_cat = 3;

