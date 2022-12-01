show databases;

use aula;
show tables;

select * from cidade;
select * from usuario;

/*Inserindo e manipulando os dados apos receber todas as permissoes para a tabela cidade*/
insert into cidade(nome) values ('irati');
insert into cidade(nome) values ('Ponta grossa');
update cidade set nome='Ponta Grossa' where codigo=2;
delete from cidade where codigo=1;

describe usuario;

/*adcionando dados a tabela*/
insert into usuario(senha, login) values ('3456', 'joaquim');
insert into usuario(senha, login) values ('888', 'joao');

/*Realizando modificacoes nos dados*/
update usuario set senha = '1234' where codigo = 2;

describe cidade;

/*Criando um index para a tabela indicada*/
create index cod_cidade on cidade(codigo);
create index cod_usuario on usuario(codigo);

/*Criando um index ja na criacao da tabela*/
create table resumo_cadastro (id int(4) not null auto_increment, nome varchar(45) not null, sexo char(1) not null, primary key (id), index cadastro(id));
describe resumo_cadastro;
















