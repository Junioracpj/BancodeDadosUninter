create database aula;
use aula;

create table usuario( codigo int(3) not null auto_increment, login varchar(30) not null, senha varchar(12) not null, primary key(codigo));
show tables;

create table cidade(codigo int(3) not null auto_increment, nome varchar(45) not null, primary key(codigo));
show tables;

/* Criando usuario de nivel gerencia*/
create user gerencia@localhost identified by '123';

/*Dando permissao de selecao para o usuario na tabela indicada*/
grant select on aula.cidade to gerencia@localhost;

/*Dando todas as permissoes para o usuario na tabela indicada*/
grant all privileges on aula.cidade to gerencia@localhost;

/*Dando todas as permissoes para o usuario no database aula*/
grant all privileges on aula.* to gerencia@localhost;

/*Retirando os direitos do usuario indicado*/
revoke all privileges on aula.* from gerencia@localhost;

/*Excluindo o usuario*/
drop user gerencia@localhost;

/*****************/

create user chefe@localhost identified by '456';
grant insert on aula.usuario to chefe@localhost;

use aula;
select * from usuario;

revoke insert on aula.usuario from chefe@localhost

drop user chefe@localhost;


