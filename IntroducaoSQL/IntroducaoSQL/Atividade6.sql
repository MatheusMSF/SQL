/*Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço deste site de cursos onlines.

Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5
atributos relevantes dos tb_produto para se trabalhar com o serviço de um site de cursos
onlines(não esqueça de criar a foreign key de tb_categoria nesta tabela).*/

CREATE DATABASE db_cursoDaMinhaVida;

CREATE TABLE tb_categoria(
	id_cat BIGINT AUTO_INCREMENT,
    nome_cat VARCHAR(255),
    sincrono_cat BOOLEAN,
    
    PRIMARY KEY(id_cat));
    
CREATE TABLE tb_produto(
	id_pro BIGINT AUTO_INCREMENT,
    nome_pro VARCHAR(255),
    professor_pro VARCHAR(255),
    preco_pro decimal(5,2),
    descricao_pro VARCHAR(255),
    horas_pro INT,
    id_cat BIGINT,
    
    PRIMARY KEY(id_pro),
    FOREIGN KEY(id_cat) REFERENCES tb_categoria(id_cat));

-- Popule esta tabela Categoria com até 5 dados.
INSERT INTO tb_categoria(nome_cat,sincrono_cat) VALUES
("Português",true),
("Matemática",false),
("Java",true),
("HTML",true),
("Química",false);

-- Popule esta tabela Produto com até 8 dados.
INSERT INTO tb_produto(nome_pro,professor_pro,preco_pro,descricao_pro,horas_pro,id_cat) VALUES
("Programação Orientada a Objetos","Marcelo",45.00,"Aprenda POO de maneira fácil e simples",8,3),
("Operações Básicas","Jonas",20.00,"Aprenda adição, subtração, multiplicação e divisão",3,2),
("Concordâncias","Roberta",30.00,"Aprenda concordância verbal e nominal",5,1),
("Variáveis","Marcelo",20.00,"Aprenda as principais variáveis para se programar JAVA",4,3),
("Formulários","Arthur",25.00,"Aprenda como fazer formulários com HTML",4,4),
("Reações","Larissa",60.00,"Aprenda as reações químicas e físicas",6,5),
("Equação do Primeiro Grau","Jonas",25.00,"Aprenda equação do primeiro grau",4,2),
("Logaritmo","Jonas",60.00,"Aprenda logaritmo",5,2);

-- Faça um select que retorne os Produtos com o valor maior do que 50 reais.
SELECT * FROM tb_produto WHERE preco_pro > 50;

-- Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
SELECT * FROM tb_produto WHERE preco_pro BETWEEN 3 AND 60;

-- Faça um select utilizando LIKE buscando os Produtos com a letra C.
SELECT * FROM tb_produto WHERE nome_pro LIKE "%c%"; 

-- Faça um um select com Inner join entre tabela categoria e produto.
SELECT nome_pro as produto, preco_pro as "preço", professor_pro as professor, descricao_pro as "descrição",  
horas_pro as horas, tb_categoria.nome_cat as categoria, 
tb_categoria.sincrono_cat as "síncrono" FROM tb_produto 
INNER JOIN tb_categoria ON tb_produto.id_cat = tb_categoria.id_cat;

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são da categoria Java).*/
SELECT nome_pro as produto, preco_pro as "preço", professor_pro as professor, descricao_pro as "descrição",  
horas_pro as horas, tb_categoria.nome_cat as categoria, 
tb_categoria.sincrono_cat as "síncrono" FROM tb_produto 
INNER JOIN tb_categoria ON tb_produto.id_cat = tb_categoria.id_cat WHERE tb_categoria.id_cat = 2;

