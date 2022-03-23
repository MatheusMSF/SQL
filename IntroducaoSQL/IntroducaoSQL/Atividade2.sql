/*Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço dessa pizzaria.

Crie uma tabela de tb_pizza e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço dessa pizzaria(não esqueça de
criar a foreign key de tb_categoria nesta tabela).*/

CREATE DATABASE db_pizzaria_legal;

CREATE TABLE tb_categoria(
	id_cat BIGINT AUTO_INCREMENT,
    nome_cat VARCHAR(255),
    cor_caixa_cat VARCHAR(255),
    massa_cat VARCHAR(255),
    
    PRIMARY KEY(id_cat));
    
CREATE TABLE tb_pizza(
	id_pi BIGINT AUTO_INCREMENT,
    nome_pi VARCHAR(255),
    sabor_pi VARCHAR(255),
    pedaco_pi int,
    preco_pi decimal(8,2),
    recheio_borda_pi VARCHAR(255),
    id_cat BIGINT,
    
    PRIMARY KEY(id_pi),
    FOREIGN KEY(id_cat) REFERENCES tb_categoria(id_cat));

-- Popule esta tabela Categoria com até 5 dados.
INSERT INTO tb_categoria(nome_cat,cor_caixa_cat,massa_cat) VALUES
("Doce","Preta","Pesada"),
("Salgada","Branca","Leve"),
("Vegetariana","Verde","Leve"),
("Frita","Amarela","Leve"),
("Fria","Rosa","Pesada");

-- Popule esta tabela pizza com até 8 dados.
INSERT INTO tb_pizza(nome_pi,sabor_pi,pedaco_pi,preco_pi,recheio_borda_pi,id_cat) VALUES
("Pizza de Calabresa","Calabresa",8,39.90,"Catupiry",2),
("Pizza de Calabresa Tamanho Família","Calabresa",10,49.00,"Catupiry",2),
("Pizza de Marguerita","Marguerita",8,34.00,"Catupiry",3),
("Pizza de Muçarela","Muçarela",8,37.90,"Catupiry",2),
("Pizza de Brigadeiro","Brigadeiro",6,55.00,"Chocolate",1),
("Pizza de Carne","Carne",8,20.50,"Nenhum",4),
("Pizza Fria de Chocolate","Chocolate",6,27.99,"Chocolate",5),
("Pizza de Brócolis","Brócolis",8,39.99,"Nenhum",3);

-- Faça um select que retorne os Produtos com o valor maior do que 45 reais.
SELECT * FROM tb_pizza WHERE preco_pi > 45;

-- Faça um select trazendo os Produtos com valor entre 29 e 60 reais.
SELECT * FROM tb_pizza WHERE preco_pi BETWEEN 29 AND 60;

-- Faça um select utilizando LIKE buscando os Produtos com a letra C.
SELECT * FROM tb_pizza WHERE nome_pi LIKE "%c%"; 

-- Faça um um select com Inner join entre tabela categoria e pizza.
SELECT nome_pi as pizza,sabor_pi as sabor,pedaco_pi as pedaco,
preco_pi as preco,recheio_borda_pi as borda, tb_categoria.nome_cat as categoria, 
tb_categoria.massa_cat as massa, tb_categoria.cor_caixa_cat as caixa  FROM tb_pizza 
INNER JOIN tb_categoria ON tb_pizza.id_cat = tb_categoria.id_cat;

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são pizza doce).*/
SELECT nome_pi as pizza,sabor_pi as sabor,pedaco_pi as pedaco,
preco_pi as preco,recheio_borda_pi as borda, tb_categoria.nome_cat as categoria, 
tb_categoria.massa_cat as massa, tb_categoria.cor_caixa_cat as caixa  FROM tb_pizza 
INNER JOIN tb_categoria ON tb_pizza.id_cat = tb_categoria.id_cat WHERE tb_categoria.id_cat = 1;

