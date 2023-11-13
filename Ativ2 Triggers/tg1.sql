create database Biblioteca;

use Biblioteca;

create table Livros(
  Id_L int auto_increment primary key,
  titulo varchar(255) not null,
  autor varchar(255) not null,
  quant_estoque int not null
);

create table Emprestimo(
  Id_E int auto_increment primary key,
  Id_L int,
  foreign key(Id_L) references Livros(Id_L),
  data_emprestimo datetime not null,
  data_devolucao datetime not null
);

insert into Biblioteca.Livros (titulo, autor, quant_estoque)
values 
  ('Livro dos livros', 'autor1', 6),
  ('Biblio', 'autor2', 8);

select * from Biblioteca.Livros;

insert into Biblioteca.Emprestimo (Id_L, data_emprestimo, data_devolucao)
values 
  (2, '2023-10-14 11:18:23', '2023-10-29 00:00:00'),
  (1, '2023-10-15 15:28:02', '2023-10-30 21:00:00');


select * from Biblioteca.Emprestimo;

delimiter //
create trigger atualizar_estoque
after insert on Emprestimo
for each row 
begin
     update Biblioteca.Livros
     set quant_estoque = quant_estoque - 1
     where Id_L = NEW.Id_L;
end;
//
delimiter //


select * from Biblioteca.Livros;

