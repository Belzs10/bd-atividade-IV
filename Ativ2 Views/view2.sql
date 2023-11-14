create database Armazem;

use Armazem;

create table produtos(
id_produto int primary key auto_increment,
nome varchar(255) not null,
preco_unitario text not null,
categoria varchar (255) not null
);

insert into Armazem.produtos(nome,preco_unitario,categoria)
values('Louça Rosa','110,80','Utensílios'),
      ('Blusa Azul','35.90','Vestuário'),
      ('Xícara da Vovó','67,99','Utensílios');

create table estoque(
id_produto int,
foreign key (id_produto) references produtos(id_produto),
quantidade int not null
);

insert into Armazem.estoque(id_produto,quantidade)
values('1','10'),
       ('2','50'),
       ('3','5');

create view estoque_critico as
select p.nome as Produto,
       e.quantidade as Em_estoque
from produtos p 
join estoque e 
on p.id_produto = e.id_produto
where e.quantidade < 20;

select*from estoque_critico;

