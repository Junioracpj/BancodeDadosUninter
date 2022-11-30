create database sistema;
use sistema;

create table cad_cidade(codigo int(2) not null auto_increment, nome varchar(30) not null, uf varchar(2) not null, primary key(codigo));
show tables;

insert into cad_cidade(nome, uf) values('Curitiba', 'PR');
insert into cad_cidade(nome, uf) values('Rio de Janeiro', 'RJ');
insert into cad_cidade(nome, uf) values('Ponta Grossa', 'PR');
insert into cad_cidade(nome, uf) values('Sao Paulo', 'SP');
insert into cad_cidade(nome, uf) values('Ribeirao Preto', 'SP');

select * from cad_cidade;

describe cad_cidade;

alter table cad_cidade rename cidade;
select * from cidade;

select * from cidade where uf='SP';

create table funcionario( codigo int(3) not null auto_increment, nome varchar(30) not null, endereco varchar(40) not null, numero int(6) not null, salario decimal(6,2) not null, codigo_cidade int(2) not null, primary key(codigo));

alter table funcionario add sexo char(1);
describe funcionario;

insert into funcionario(nome, endereco, numero, salario, codigo_cidade, sexo) values('Pedro','Rua Flores', 30, 1500, 2, 'M');
insert into funcionario(nome, endereco, numero, salario, codigo_cidade, sexo) values('Maria','Avenida Brasil', 400, 1960.70, 1, 'F');
insert into funcionario(nome, endereco, numero, salario, codigo_cidade, sexo) values('Jose','Rua do Joao', 759, 3800, 4, 'F');
insert into funcionario(nome, endereco, numero, salario, codigo_cidade, sexo) values('Marco','Av Santa Rita', 2, 3450.50, 2, 'M');


select * from funcionario;

select nome, sexo from funcionario;

select * from funcionario where salario > 2000;

select * from funcionario where sexo='M' and salario < 1500;

select * from funcionario order by salario asc;

select * from funcionario where salario >= 2000 and salario <= 3000;

select * from funcionario where nome like 'M%';

select * from funcionario where nome like '%a%';

select * from funcionario where nome not like 'M%';

alter table funcionario add setor varchar(10);

describe funcionario;

update funcionario set setor='producao' where codigo >= 1;

select * from funcionario;

update funcionario set setor='gerente' where codigo=3;

delete from funcionario where codigo > 3;
delete from cidade where codigo > 5;
delete from cidade where uf='MS';

select * from cidade;
select * from funcionario;

select funcionario.nome, cidade.nome from funcionario join cidade on funcionario.codigo_cidade = cidade.codigo;

select avg(salario) from funcionario;

select sexo, avg(salario) as 'media' from funcionario group by sexo;

select sum(salario) from funcionario;

select count(*) as 'qtd cidade' from cidade;



