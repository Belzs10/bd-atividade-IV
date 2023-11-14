create database LojaOnline;

use LojaOnline;


create table categorias(
    id_cat int primary key auto_increment,
    nome_cat varchar(255) not null,
    descricao varchar(255)
);


insert into  LojaOnline.categorias(nome_cat, descricao)
values('Eletrônicos', 'Produtos eletrônicos em geral'),
      ('Roupas', 'Roupas de diferentes estilos');

create table produtos(
    id_produto int primary key auto_increment,
    nome varchar(255) not null,
    preco_unitario decimal(10, 2) not null,
    id_cat int,
    foreign key (id_cat) references categorias(id_cat)
);

insert into produtos(nome, preco_unitario, id_cat)
values('Smartphone', 999.99, 1),
      ('Laptop', 1499.99, 1),
      ('Camiseta', 29.99, 2),
      ('Calça Jeans', 49.99, 2);
      
create view relatorio_produtos_categoria as
select c.nome_cat as nome_categoria,
       COUNT(p.id_produto) as quantidade_produtos
from categorias c
join produtos p 
on c.id_cat = p.id_cat
group by c.id_cat;

select*from relatorio_produtos_categoria;