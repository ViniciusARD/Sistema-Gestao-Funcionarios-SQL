create table Departamento(
    codigo integer primary key,
    nome varchar(25)   
);

create table Cidade(
    codigo integer primary key,
    nome varchar(25)
);

create table Cargo(
    codigo integer primary key,
    nome varchar(25),
    salario_base numeric(10,2)
);

create table Funcionario(
    codigo integer primary key,
    nome varchar(25),
    telefone numeric(15),
    cod_depto numeric(15),
    salario numeric(10,2),
    cod_cidade numeric(15),
    cod_cargo numeric(15),
    constraint fk_departamento foreign key (codigo)
    references Departamento(codigo),
    constraint fk_cidade foreign key (codigo)
    references Cidade(codigo),
    constraint fk_cargo foreign key (codigo)
    references Cargo(codigo)
);

--Ex 02--

insert into departamento values (1, 'Almoxarifado');
insert into departamento values (2, 'Engenheiro');
insert into departamento values (3, 'Compras');
insert into departamento values (4, 'Maquinas');
insert into departamento values (5, 'Mecanica');

insert into cidade values (1, 'Jambeiro');
insert into cidade values (2, 'Igarata');
insert into cidade values (3, 'Jacarei');
insert into cidade values (4, 'Pedras');
insert into cidade values (5, 'Mogi');

insert into cargo values (1, 'Pedreiro', 1500.00);
insert into cargo values (2, 'Limpeza', 1200.00);
insert into cargo values (3, 'Organizacao', 1700.00);
insert into cargo values (4, 'Repositor', 4500.00);
insert into cargo values (5, 'Mecanica', 400.00);

insert into Funcionario values (1, 'Guilherme', 12981452299, 1, 1000.00, 1, 1);
insert into Funcionario  values (2, 'Joao', 12981452244, 2, 700.00, 2, 2);
insert into Funcionario  values (3, 'Pedro', 12981452222, 3, 2000.00, 3, 3);
insert into Funcionario  values (4, 'Mateus', 12981452278, 4, 700.00, 4, 4);
insert into Funcionario  values (5, 'Joao', 12981452219, 5, 980.00, 5, 5);

--Ex 03--

update Funcionario
set Salario = salario * 1,1;

--Ex 04--

select *
from Funcionario
where salario > 1000.00;

--Ex 05--

select count (*) 
from funcionario 
where salario <500;

--Ex 06--

select avg (salario) 
from funcionario;

--Ex 07--

select avg (salario) 
from funcionario 
where salario < 1000;

--Ex 08--

select max (salario)
from funcionario;

--Ex 09--

select min (salario)
from funcionario;

--Ex 10--

select count (*)
from funcionario;

--Ex 11--

select sum (salario)
from funcionario;

--Ex 12--

select d.nome, sum (salario) as salario
from departamento d, funcionario f
where d.codigo = f.cod_depto
group by d.nome;

--Ex 13--

select nome
from funcionario
order by nome ;

--Ex 14--

select nome
from funcionario
order by nome desc;

--Ex 15--

select count (*)
from funcionario
where salario > 200;

--Ex 16--

select count (*)
from funcionario
where salario > 200
and cod_depto = 1;

--Ex 17--

select nome, salario
from funcionario
where salario > (select avg (salario) from funcionario);



