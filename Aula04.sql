show databases;
use aula;

create table funcionario(cod int(3) not null auto_increment, nome varchar(45) not null, sexo char(1) not null, salario decimal(6,2) not null, primary key(cod));

insert into funcionario values(null, 'Pedro', 'M', 7820);
insert into funcionario values(null, 'Maria', 'F', 9320);
insert into funcionario values(null, 'Joao', 'M', 2390.80);
insert into funcionario values(null, 'Marta', 'F', 3450.75);

select * from funcionario;

/*Criando procedure*/
delimiter $$
create procedure func_minimo(sal decimal)
select count(*) from funcionario where salario < sal;
$$
 /*Executando procedure*/
 call func_minimo(5000);
 
 delimiter $$
 create procedure func_salario(id smallint)
 select * from funcionario where cod = id;
 $$
 call func_salario(2);
 
 update funcionario set salario = (salario * 0.8) where cod = 2;
 
 delimiter $$
 create procedure aumento()
 update funcionario set salario = (salario *1.1) where cod > 0;
 $$
 call aumento();
 
 select * from funcionario;
 
 /*Excluindo uma procedure*/
drop procedure func_salario; 

/*Criando uma funcao*/
delimiter $$
create function soma(a int, b int)
returns int
return a + b ;
$$
/*Executando uma funcao*/
select soma(3, 4);

delimiter $$
create function salario( id smallint)
returns decimal(6,2)
return (select salario from funcionario where cod= id);
$$
select salario(1);

