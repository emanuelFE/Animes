/**
lojinha de animes
@Atutor Emanoel Felipe
@version 1.2
*/
-- Criar um novo banco de dados
create database Animes;

-- Verificar bancos de dados
show databases;

-- Selecionar o banco de dados
use Animes; 

create table clientes (
idcli int primary key auto_increment,
nome varchar (255) not null,
fone varchar (255) not null,
cpf varchar (255)unique,
email varchar (255),
marketing varchar(255) not null,
cep varchar (255),
endereco varchar (255),
numero varchar (255),
complemento varchar (255),
bairro varchar (255),
cidade varchar (255),
uf char(2)
);

describe clientes;

-- criando a tabela produto 

create table produtos(
codigo int primary key auto_increment,
barcode varchar (255),
produto varchar(255) not null,
descricao varchar(255) not null,
fabricante varchar(255) not null,
datacad timestamp default current_timestamp,
dataval date not null,
estoque int not null,
estoquemin int not null,
unidade varchar (255) not null,
localizacao varchar (255),
custo decimal (10,2) not null,
lucro decimal	(10,2),
venda decimal(10,2),
idfor int not null,
foreign key (idfor) references fornecedores(idfor)
);

-- adição dos produtos 

insert into produtos(barcode,produto,descricao,fabricante,dataval,
estoque,estoquemin,unidade,localizacao,custo,lucro,venda,idfor)
values
('12345678910','Bastão Magico','Bastão mágico','Dragonball z',
20240523,20,5,'UN','Prateleira 1',0.75,100,100.50,1);
 
insert into produtos(barcode,produto,descricao,fabricante,dataval,
estoque,estoquemin,unidade,localizacao,custo,lucro,venda,idfor)
values
('12345678910','Boneco do goku','Naruto SHipuden','Naruto',
20240523,20,5,'UN','Prateleira 1',10.75,100,150.50,1);
 
insert into produtos(barcode,produto,descricao,fabricante,dataval,
estoque,estoquemin,unidade,localizacao,custo,lucro,venda,idfor)
values
('12345678910','manto do Hokage','Naruto SHipuden','Naruto',
20240523,20,5,'UN','Prateleira 1',10.75,100,150.50,1);
 
 insert into produtos(barcode,produto,descricao,fabricante,dataval,
estoque,estoquemin,unidade,localizacao,custo,lucro,venda,idfor)
values
('12345678910','manto do Hokage da Sombras','Naruto SHipuden','Naruto',
20240523,20,5,'UN','Prateleira 1',10.75,100,150.50,1);
 
 insert into produtos(barcode,produto,descricao,fabricante,dataval,
estoque,estoquemin,unidade,localizacao,custo,lucro,venda,idfor)
values
('12345678910','Kunai do Minato','Naruto SHipuden','Naruto',
20240523,20,5,'UN','Prateleira 1',10.75,100,100.50,1);

insert into produtos(barcode,produto,descricao,fabricante,dataval,
estoque,estoquemin,unidade,localizacao,custo,lucro,venda,idfor)
values
('12345678910','kunai','Naruto SHipuden','Naruto',
20240523,20,5,'UN','Prateleira 1',10.75,100,50.50,1);
 
 insert into produtos(barcode,produto,descricao,fabricante,dataval,
estoque,estoquemin,unidade,localizacao,custo,lucro,venda,idfor)
values
('12345678910','Robão do modo Sabio','Naruto SHipuden','Naruto',
20240523,20,5,'UN','Prateleira 1',10.75,100,150.50,1);

delete from produtos where id=1; 

describe produtos;

select * from produtos;

-- criando a tabela do fornecedores 

create table fornecedores (
idfor int primary key auto_increment,
cnpj varchar(255) not null unique,
ie varchar(255) unique,
im varchar(255) unique,
razao varchar (255) not null, 
fantasia varchar (255) not null, 
site varchar (255),    
fone varchar (255) not null, 
contato varchar (255),  
email varchar (255),
cep varchar (255) not null, 
endereco varchar (255) not null, 
numero varchar (255) not null, 
complemento varchar (255),
bairro varchar (255) not null, 
cidade varchar (255) not null, 
uf char (2) not null, 
obs varchar (255)
);
describe fornecedores;

--  criando a tabela dos pedidos 

create table pedidos (
pedido  int primary key auto_increment,
dataped timestamp default current_timestamp,
total decimal(10,2),
idcli int not null,
foreign key(idcli) references clientes(idcli)
);
describe pedidos;

-- criando a tabela do usuario 

create table usuarios(
idusu int primary key auto_increment,
usuario varchar (255) not null,
login varchar (255) not null unique,
senha varchar (255) not null,
perfil varchar (255) not null
);
describe usuarios;

-- para inserir uma senha com criptografia usamos md5()
insert into usuarios(usuario,login,senha,perfil)
value('Administrador','admin',md5('admin'),'admin');

insert into usuarios(usuario,login,senha,perfil)
value('felipe','felipe',md5('123456'),'user');

select * from usuarios;

-- acessando o sitema pela tela de login 
select * from usuarios where login='admin' and senha='123456';

-- and ( função logica onde todas as condiçoes devem ser verdadeiras)
select * from usuarios where login='admin' and senha=md5('admin');

-- adição dos usuarios

insert into clientes (nome,fone,email)
value ('emanoel','95101-4239', 'emanoelfpsilva@gmail.com');

insert into clientes (nome,fone,email)
value ('gabriel','95101-4139', 'gabrielsilva@gmail.com');

insert into clientes (nome,fone,email)
value ('felipe','95101-4039', 'felipesilva@gmail.com');

insert into clientes (nome,fone,email)
value ('joao','95101-3339', 'joaosilva@gmail.com');

insert into clientes (nome,fone,email)
value ('kauan','95101-8339', 'kauansilva@gmail.com');

insert into clientes (nome,fone,email)
value ('kevinho','95101-4939', 'kevinhosilva@gmail.com');

describe produtos;






-- Invetario do (patrimônio)
-- sum () função de soma no banco de dados
select sum(estoque * custo) as total from produtos;

-- relatorio de reposiçao de estoque 1 
select * from produtos where estoque < estoquemin;

-- relatorio de reposiçao de estoque 2
-- date_format() função usada para formatar a data 
-- %d%m%Y dd/mm/aaaa | %d%m%Y dd/mm/aa 
select codigo as código,produto,
date_format(dataval,'%d%m%Y') as data_validade,
estoque,estoquemin as estoque_mínimo
from produtos where estoque < estoquemin;

-- relatorio de validade de produtos 1
select codigo as código,produto,
date_format(dataval,'%d%m%Y') as data_validade
from produtos;

-- relatorio de validade de produtos 2
-- datediff() calcular a diferencia em dias 
-- curdate() obtém a data atual 
select codigo as código,produto,
date_format(dataval,'%d%m%Y') as data_validade,
datediff(dataval,curdate()) as dias_restantes
from produtos;

