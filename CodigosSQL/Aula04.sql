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
select salario(1) as 'Salario';

select * from funcionario;

delimiter $$
create function func_sexo(p_sexo char)
returns int 
return (select count(*) from funcionario where sexo = p_sexo);
$$
select fun_sexo('M');

/*Apagando a funcao indicada*/
drop function soma;

create table backup(codigo int(3) not null auto_increment, nome varchar(40) not null, salario decimal(7,2) not null, primary key(codigo));

show tables;

/*Trabalhando com Triggers*/

delimiter $$
create trigger faz_backup before delete /*indica se a sequencia vai ser executada antes ou depois do gatilho*/ 
on funcionario /*Indica a tabela*/
for each row 
begin /* Inicio do codigo*/
insert into backup(nome, salario) values(old.nome, old.salario);
end
$$

/*Uma trigger é um codigo automatico, uma vez criado, sempre será executado*/

select * from backup;
select * from funcionario;
delete from funcionario where cod = 1;

delimiter $$
create function num_backup()
returns int
return (select count(*) from backup);
$$

select num_backup();

/*Utilizando if e else em codigo sql*/
delimiter $$
create procedure num_sexo(p_sexo char)
begin /*Necessario para abrir um bloco de programacao*/
if (p_sexo = 'M') then
select count(*) from funcionario where sexo = 'M';
elseif (p_sexo = 'F') then
select count(*) from funcionario where sexo = 'F';
end if;
end /*Fecha o bloco de programacao*/
$$

call num_sexo('M');

delimiter $$
create procedure ver_func(p_sexo char)
begin
if (p_sexo = 'M') then
select * from funcionario where sexo = 'M';
elseif(p_sexo = 'F') then
select * from funcionario where sexo = 'F';
end if;
end
$$

call ver_func('F');

/*Deletando a trigger indicada*/
drop trigger faz_backup;
