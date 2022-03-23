/*Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço deste ecommerce.

Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço de uma loja de produtos (não
esqueça de criar a foreign key de tb_categoria nesta tabela).*/

CREATE DATABASE db_construindo_a_nossa_vida;

CREATE TABLE tb_categoria(
	id_cat BIGINT AUTO_INCREMENT,
    nome_cat VARCHAR(255),
    descricao_cat VARCHAR(255),
    frete_cat BOOLEAN,
    
    PRIMARY KEY(id_cat));
    
CREATE TABLE tb_produto(
	id_pro BIGINT AUTO_INCREMENT,
    nome_pro VARCHAR(255),
    preco_pro decimal(8,2),
    estrelas_pro INT,
    estoque_pro INT,
    fabricante_pro VARCHAR(255),
    id_cat BIGINT,
    
    PRIMARY KEY(id_pro),
    FOREIGN KEY(id_cat) REFERENCES tb_categoria(id_cat));

-- Popule esta tabela Categoria com até 5 dados.
INSERT INTO tb_categoria(nome_cat,descricao_cat,frete_cat) VALUES
("Telhas,Calhas e Rufos","O necessário para cobrir o teto da sua casa",true),
("Blocos e Tijolos","O necessário para construir a sua casa",true),
("Hidráulica","Monte seu sistema hidráulico ^^",false),
("Pisos","Pise nesses lindos pisos",true),
("Luz","Produtos para a iluminação",false);

-- Popule esta tabela Produto com até 8 dados.
INSERT INTO tb_produto(nome_pro,preco_pro,estrelas_pro,estoque_pro,fabricante_pro,id_cat) VALUES
("Cano pvc",10.00,3,50,"Rioma",3),
("Telha vermelha",20.00,4,50,"Cobertura de Casa",1),
("Piso xadrez",70.00,4,30,"Com Chão",4),
("Piso de flores",70.00,4,40,"Com Chão",4),
("Lâmpada",15.10,4,80,"Iluminions",5),
("Tijolo vermelho",10.20,3,50,"Duro como pedra",2),
("Fio elétrico",180.00,1,100,"Iluminions",5),
("Ralos",9.30,5,25,"Rioma",3);

-- Faça um select que retorne os Produtos com o valor maior do que 50 reais.
SELECT * FROM tb_produto WHERE preco_pro > 50;

-- Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
SELECT * FROM tb_produto WHERE preco_pro BETWEEN 3 AND 60;

-- Faça um select utilizando LIKE buscando os Produtos com a letra C.
SELECT * FROM tb_produto WHERE nome_pro LIKE "%c%"; 

-- Faça um um select com Inner join entre tabela categoria e produto.
SELECT nome_pro as produto, preco_pro as preco, estrelas_pro as estrelas, estoque_pro as estoque,  
fabricante_pro as fabricante, tb_categoria.nome_cat as categoria, 
tb_categoria.descricao_cat as "Descricao Categoria", tb_categoria.frete_cat as Frete FROM tb_produto 
INNER JOIN tb_categoria ON tb_produto.id_cat = tb_categoria.id_cat;

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são da categoria hidráulica).*/
SELECT nome_pro as produto, preco_pro as preco, estrelas_pro as estrelas, estoque_pro as estoque,  
fabricante_pro as fabricante, tb_categoria.nome_cat as categoria, 
tb_categoria.descricao_cat as "Descricao Categoria", tb_categoria.frete_cat as Frete FROM tb_produto 
INNER JOIN tb_categoria ON tb_produto.id_cat = tb_categoria.id_cat WHERE tb_categoria.id_cat = 4;

