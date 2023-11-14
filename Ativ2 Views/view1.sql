create database Loja;

use Loja;

create table Clientes(
id_clientes int primary key auto_increment,
nome varchar(255) not null,
email varchar(255) not null unique,
telefone varchar(22) not null
);

insert into Loja.Clientes(nome,email,telefone)
values ('Danilo','danilo@email.com','(71)0000-9999');

create table Pedidos(
id_pedidos int primary key auto_increment,
id_clientes int,
foreign key(id_clientes) references Clientes(id_clientes),
data_pedido date not null,
valor_total text not null
);

insert into Loja.Pedidos(id_clientes,data_pedido,valor_total)
values ('1','2023-09-15','135.90');

create view relatorio_pedidos_cliente as
select
    c.nome as Cliente,
    COUNT(p.id_pedidos) as num_pedidos,
    SUM(p.valor_total) as valorTotal
from Clientes c
join Pedidos p 
on c.id_clientes = p.id_clientes
group by c.id_clientes;

select*from relatorio_pedidos_cliente;

-- drop view if exists relatorio_pedidos_cliente;




