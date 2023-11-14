create database Empresa;

use Empresa;

create table Funcionarios(
id_func int primary key auto_increment,
nome varchar(255) not null,
cargo varchar(255) not null,
salario decimal(10,2) not null
);

insert into Empresa.Funcionarios(nome,cargo,salario)
values ('A','Diretor','5980.30'),
	   ('B', 'Auxiliar','2450.90'),
       ('C','Gerente','3458.08');

create table Vendas(
id_venda int primary key auto_increment,
id_func int,
foreign key(id_func) references Funcionarios(id_func),
data_venda date not null,
valor_venda int not null
);

insert into Empresa.Vendas(id_func,data_venda,valor_venda)
values('2','2023-01-01','1500'),
      ('1','2023-01-05','9700'),
      ('3','2023-01-10','2900'),
      ('2','2023-01-09','3400');
      
create view relatorio_vendas_funcionario as
select f.nome as nome_funcionario,
       count(v.id_venda) as vendas,
	   sum(v.valor_venda) as total
from Funcionarios f 
join Vendas v
on f.id_func = v.id_func
group by f.id_func;       

select*from relatorio_vendas_funcionario;
       
       
       