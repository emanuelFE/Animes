/**
lojinha de animes
@Atutor Emanoel
@version 1.0
*/
-- Criar um novo banco de dados
create database lojinhaanimes;

-- Verificar bancos de dados
show databases;

-- Selecionar o banco de dados
use lojinhaanimes; 

-- timestamp default current_timestamp, (data e hora automatico)
-- date (tipo de dados relaciondados a data)
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
drop table produtos;
describe produtos;

insert into produtos(barcode,produto,descricao,fabricante,dataval,
estoque,estoquemin,unidade,localizacao,custo,lucro,venda,idfor)
values
('12345678910','Caneta BIC Azul','Caneta bic ponta fina azul','BIC',
20240523,20,5,'UN','Prateleira 2',0.75,100,1.50,1);
 
insert into produtos(barcode,produto,descricao,fabricante,dataval,
estoque,estoquemin,unidade,localizacao,custo,lucro,venda,idfor)
values
('12345678910','manto da akatsuki','Naruto SHipuden','Naruto',
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

-- descrever a tabela  
describe produtos;

select * from produtos;

/* relatorio */

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



-- seleçao de todos os registros da tabela dos produtos
select * from produtos;

-- seleçao de um registro ( produto) especifico
select * from produtos where codigo=3;

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
value('emanoel','emanoel',md5('123456'),'user');

select * from usuarios;

-- acessando o sitema pela tela de login 
select * from usuarios where login='admin' and senha='123456';

-- and ( função logica onde todas as condiçoes devem ser verdadeiras)
select * from usuarios where login='admin' and senha=md5('admin');

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

-- adicionando uma coluna (campo) a tabela clientes 
alter table clientes add column nascimento varchar(255);

alter table produtos modify column barcode varchar(255) unique;

delete from produtos where id=1; 


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

update produtos set produto='caneta preta'where id=1;

-- foregin key (FK) chave estrangeira que cria o relacionamento
-- do tipo 1-N com a tabela clientes
-- FK(pedidos)________PK(clientes)
-- Observação: usar o mesmo nome e tipo de dados nas chaves (PK e FK)
create table pedidos (
pedido  int primary key auto_increment,
dataped timestamp default current_timestamp,
total decimal(10,2),
idcli int not null,
foreign key(idcli) references clientes(idcli)
);

select * from clientes;
insert into clientes(nome,fone,marketing)
values('emanoel silva','99999999','não');

-- abertura de pedido 
insert into pedidos(idcli) values(1);

-- verificar o pedidos
select * from pedidos where pedido;

-- verificar pedidos juntos com o nome do cliente
-- inner join(unir informações de 2 ou mais tabelas)
-- IMPORTANTE! Indica as Chaves Fk e PK
select * from pedidos inner join clientes on pedidos.idcli = clientes.idcli;

-- verificar pedido junto com o nome do cliente ( relatorio simplificado)
-- %H:%i exibir tambem o horario formatado
select pedidos.pedido,date_format(pedidos.dataped,'%d/%m/%Y - %H:%i') as data_ped,clientes.nome as cliente,clientes.fone
from pedidos inner join clientes on pedidos.idcli = clientes.idcli;

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


insert into fornecedores
(cnpj,razao,fantasia,fone,cep,endereco,numero,bairro,cidade,uf)
values ('17.127.927/0001-99','Panini Comercio e Industria Grafica Ltda','Panini',
'9999-1234','03307-000','Rua Tuiuti','2769','Tatuapé','São Paulo','SP');


select * from fornecedores;

-- Tabela de apoio para criar um Relacionamento do tipo M-M
-- (muitos para muitos) neste caso não criamos a chave primária
create table carrinho(
pedido int not null,
codigo int not null,
quantidade int not null,
foreign key (pedido) references pedidos (pedido),
foreign key (codigo) references produtos (codigo)
);
select * from produtos;

insert into carrinho values (1,6,2);
insert into carrinho values (1,8,1);


select * from pedidos;

select * from carrinho;

-- Exibir  o carrinho 
select pedidos.pedido,
carrinho.codigo as código,
produtos.produto,
carrinho.quantidade,
produtos.venda,
produtos.venda * carrinho.quantidade as sub_total
from (carrinho inner join pedidos on carrinho.pedido =
pedidos.pedido)
inner join produtos on carrinho.codigo = produtos.codigo;

-- total do pedido ( carrinho) "fechamento"
select sum(produtos .venda * carrinho .quantidade) as total
from carrinho inner join produtos 
on carrinho.codigo = produtos.codigo;

-- atualização do estoque
update carrinho
inner join produtos
on carrinho.codigo = produtos.codigo
set produtos.estoque = produtos.estoque - carrinho.quantidade
where carrinho.quantidade > 0;