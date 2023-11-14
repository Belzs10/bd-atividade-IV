create database Fatura;

use Fatura;

create table clientes (
    id_cliente int primary key auto_increment,
    nome varchar(255) not null,
    endereco varchar(255) not null,
    cidade varchar(255) not null
);

insert into Fatura.clientes(nome, endereco, cidade)
values 
    ('Alice', 'Rua A, 123', 'Curitiba'),
    ('Bob', 'Rua B, 456', 'Rio de Janeiro'),
    ('Charlie', 'Rua C, 789', 'Bahia');

create table pagamentos (
    id_pagamento int primary key auto_increment,
    id_cliente int,
    foreign key(id_cliente) references clientes(id_cliente),
    data_pagamento date not null,
    valor_pagamento decimal(10,2) not null
);


insert into Fatura.pagamentos(id_cliente, data_pagamento, valor_pagamento)
values
    (1, '2023-01-01', 500.00),
    (2, '2023-01-02', 300.50),
    (3, '2023-01-03', 150.75),
    (1, '2023-01-04', 200.00);

create view relatorio_pagamentos_cidade as
select c.cidade as nome_cidade,
       sum(p.valor_pagamento) as valor_total_pagamentos
from clientes c
join pagamentos p 
on c.id_cliente = p.id_cliente
group by c.cidade;


select * from relatorio_pagamentos_cidade;