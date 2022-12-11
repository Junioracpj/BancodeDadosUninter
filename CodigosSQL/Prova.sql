/*Questao 01*/
use aula;
create table paises (Pais_id varchar(2), Pais_Nome varchar(40));
show tables;


/*Questao 02*/
delimiter $$
create procedure nome(id_nome char)
select concat( 'O Funcionario',FIRST_NAME,'',LAST_NAME,' foi contratado em: ', HIRE_DATE,'.') AS Result  
FROM Employees where EMPLOYEE_ID = id_nome;
$$


/*Questao 03*/
/*Item 01*/
alter table vendedor change comissao percentual_comissao decimal(2.2) not null;
/*Item 02*/
select nome, cidade, comissao from VENDEDOR where comissao > 0.11;


/*Questao 04*/
select FIRST_NAME, SALARY from Employees where SALARY > 5000 and SALARY < 10000 and DEPARTAMENT_ID = 60;


/*Questao 05*/
create table fabricantes(
codigo int not null,
nome varchar(60) not null, primary key(codigo));

create table produtos(
codigo int not null,
nome varchar(60),
preco int not null,
fabricante int not null, primary key(codigo));

insert into fabricantes(codigo, nome) values(1, 'Sony');
insert into fabricantes(codigo, nome) values(2, 'Creative Labs');
insert into fabricantes(codigo, nome) values(3, 'Hewlett-Packard');
insert into fabricantes(codigo, nome) values(4, 'Lomega');
insert into fabricantes(codigo, nome) values(5, 'Fujitsu');
insert into fabricantes(codigo, nome) values(6, 'Winchester');

insert into produtos(codigo, nome, preco, fabricante) values(1,'Hard Drive', 240,5);
insert into produtos(codigo, nome, preco, fabricante) values(2,'Memory', 120,6);
insert into produtos(codigo, nome, preco, fabricante) values(3,'Zip Drive', 150,4);
insert into produtos(codigo, nome, preco, fabricante) values(4,'Floppy Disk', 5,6);
insert into produtos(codigo, nome, preco, fabricante) values(5,'Monitor', 240,1);
insert into produtos(codigo, nome, preco, fabricante) values(6,'DVD drive', 180,2);
insert into produtos(codigo, nome, preco, fabricante) values(7,'CD drive', 90,2);
insert into produtos(codigo, nome, preco, fabricante) values(8,'Printer', 270,3);
insert into produtos(codigo, nome, preco, fabricante) values(9,'Toner', 66,3);
insert into produtos(codigo, nome, preco, fabricante) values(10,'DVD burner', 180,2);


select * from fabricantes;
select * from produtos;

select * from produtos  where preco >=60 and preco <= 120;
select avg(preco) as 'media' from produtos where fabricante = 2;
select fabricante, avg(preco) as 'media' from produtos group by fabricante;
select sum(preco) from produtos;
select fabricante, sum(preco) as 'total' from produtos group by fabricante;

/*Questao 06*/
 create table localizacao(codigo int not null auto_increment, primary key(codigo));
 alter table localizacao add regiao int;
 select * from localizacao;
 
 
 /*Questao 07*/
 select sum(SALARY) from funcionarios;
 
 
 /*Questao 08*/
 select DEPARTMENT_ID, sum(SALARY) as 'total' from employees group by DEPARTMENT_ID;
 