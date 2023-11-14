create database Estoquee;

use Estoquee;

create table Produtos(
id_produto int primary key auto_increment,
nome varchar(255) not null,
quant_estoque int not null
);

insert into Estoquee.Produtos(nome,quant_estoque)
values('Sandália','2');

create table Vendas(
id_vendas int primary key auto_increment,
data_venda datetime not null
);

insert into Estoquee.Vendas(data_venda)
values('2023-10-14 15:38:02');

create table item_venda(
id_item_venda int primary key auto_increment,
id_produto int,
foreign key (id_produto) references Produtos(id_produto),
id_vendas int,
foreign key (id_vendas) references Vendas(id_vendas),
quantidade int not null
);

delimiter //
create trigger verificar_quantidade_estoque
before insert on item_venda
for each row
begin
    declare estoque_atual int;

    -- Obter a quantidade em estoque do produto
    select quant_estoque into estoque_atual
    from Produtos
    where id_produto = NEW.id_produto;

    -- Verificar se a quantidade em estoque é suficiente
    if estoque_atual < NEW.quantidade then
        signal sqlstate '45000'
        set message_text = 'O produto está fora de estoque.';
    end if;
end;
//
delimiter //

insert into Estoquee.item_venda(id_produto,id_vendas,quantidade)
values('1','1','4');






-- DECLARE é usado para criar caixas (variáveis) que você pode usar para armazenar 
-- informações temporárias durante a execução do seu código SQL.