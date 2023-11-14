create database Escola;

use Escola;

create table Alunos(
    id_aluno int primary key auto_increment,
    nome varchar(255) not null,
    data_nascimento date not null,
    serie int not null
);

insert into Escola.Alunos(nome, data_nascimento, serie)
values('Gabriela', '2009-10-10', 9),
	  ('Beto','2011-08-15','9'),
      ('Alicia','2012-09-02','9');
      
select*from Escola.Alunos;
	  

create table Matriculas(
    id_matricula int primary key auto_increment,
    id_aluno int,
    foreign key (id_aluno) references Alunos(id_aluno),
    data_matricula date not null,
    statuss varchar(255) not null
);

insert into Escola.Matriculas(id_aluno,data_matricula,statuss)
values('1','2023-1-5','Indefinido'),
      ('2','2023-1-6','Indefinido');
      
      select*from Escola.Matriculas;


delimiter //
create trigger verificar_idade_aluno
before insert 
on Matriculas
for each row
begin
    declare idade_aluno int;

    -- Calcular a idade do aluno
    set idade_aluno = year(curdate()) - year((select data_nascimento from Alunos where id_aluno = NEW.id_aluno));

    if idade_aluno < 14 then
     signal sqlstate '45000' set message_text = 'O aluno não atende aos requisitos de idade para a série.';
     else
     signal sqlstate'45000' set message_text = 'O aluno atende aos requisitos de idade para a série.';
    end if;
end;
//
delimiter //

insert into Escola.Matriculas(id_aluno,data_matricula,statuss)
values('3','2023-02-05','indefinido');