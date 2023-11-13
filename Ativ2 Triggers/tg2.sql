create database Financas;

use Financas;

create table contas(
Id_conta int primary key auto_increment,
nome varchar(255) not null,
saldo decimal(10,2) not null
);

create table transacoes(
id_tran int primary key auto_increment,
Id_conta int,
foreign key (Id_conta) references contas(Id_conta),
tipo varchar(255) not null,
valor decimal(10,2) not null
);

insert into Financas.contas(nome, saldo)
values ('Anabel','340.20'),
       ('Beto','275.23');

select*from Financas.contas;

insert into Financas.transacoes(Id_conta, tipo, valor) 
values ('1', 'saída', '22.00'),
	   ('2','entrada', '35.00');
 
select*from Financas.transacoes;


-- Crie um trigger que, ao inserir uma nova transação na tabela "transacoes",
-- atualize automaticamente o saldo da conta correspondente na tabela "contas". 
-- Se o tipo da transação for "entrada", adicione o valor ao saldo. Se o tipo for "saída", subtraia o valor do saldo.


delimiter //
create trigger atualizar_saldo
after insert on transacoes
for each row
begin
    if NEW.tipo = 'entrada' then
        update contas
        set saldo = saldo + NEW.valor
        where Id_conta = NEW.Id_conta;
    elseif NEW.tipo = 'saída' then
        update contas
        set saldo = saldo - NEW.valor
        where Id_conta = NEW.Id_conta;
    end if;
end;
//
delimiter //

select*from Financas.contas;

