create database RecursosHumanos;

use RecursosHumanos;

create table funcionarios(
ID int primary key auto_increment,
nome varchar(255) not null,
data_admissão date not null
);

delimiter //

create trigger verificar_data_admissao
before insert
on funcionarios
for each row
begin
     if new.data_admissão < '2023-07-10' then
     signal sqlstate '45000' set message_text = 'A data de admissão deve ser maior que a data atual.';
     end if;
     end; 
     //
delimiter ;

insert into RecursosHumanos.funcionarios(nome,data_admissão) values
('nome','2023-05-15')
























-- IF - realiza um teste lógico, resultado é sempre um booleano

-- ELSE IF - nasce a partir de um IF inicial ou outro ELSE IF, realiza um teste lógico, resultado é sempre um booleano

-- ELSE - nasce a partir de um IF ou ELSE IF, não realiza um teste lógico, é executado quando todos os testes anteriores dão falso.