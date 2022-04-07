create database "8bits" ;
CREATE TABLE "cliente" (
  "codigo_cliente" serial not null,
  "nome" varchar(50) not null,
  "sobrenome" varchar(100) not null,
  "login" varchar(15) not null,
  "senha" varchar(8) not null,
  "email_cliente" varchar(30) not null,
  "cpf_cliente" int8 not null,
  "data_nascimento" date not null,
  "codigo_telefone" integer not null,
  "codigo_endereco" integer not null,
  PRIMARY KEY ("codigo_cliente")
);

CREATE TABLE "pedido" (
  "codigo_pedido" serial not null,
  "data_pedido" date not null,
  "codigo_cliente" integer not null,
  "codigo_item" integer not null,
  PRIMARY KEY ("codigo_pedido"),
  CONSTRAINT "FK_pedido.codigo_cliente"
    FOREIGN KEY ("codigo_cliente")
      REFERENCES "cliente"("codigo_cliente")
);

CREATE TABLE "telefone" (
  "codigo_telefone" serial not null,
  "telefone_principal" integer not null,
  "telefone_secundario" integer,
  PRIMARY KEY ("codigo_telefone")
);

CREATE TABLE "funcionario" (
  "codigo_funcionario" serial not null,
  "nome_funcionario" varchar(50) not null,
  "cpf_funcionario" int8 not null,
  "salario" decimal,
  PRIMARY KEY ("codigo_funcionario")
);

CREATE TABLE "categoria" (
  "codigo_categoria" serial not null,
  "nome_categoria" varchar(50)  not null,
  "codigo_produto" integer not null,
  PRIMARY KEY ("codigo_categoria")
);

CREATE TABLE "endereco_cliente" (
  "codigo_endereco" serial not null,
  "rua" varchar(200),
  "numero_casa" integer,
  "bairro" varchar(50),
  "cidade" varchar(50),
  "estado" varchar(50),
  "cep" integer,
  PRIMARY KEY ("codigo_endereco")
);

CREATE TABLE "item_compra" (
  "codigo_item" serial not null,
  "quantidade_comprada" integer not null,
  "codigo_produto" integer not null,
  PRIMARY KEY ("codigo_item")
);

CREATE TABLE "produto" (
  "codigo_produto" serial not null,
  "nome_produto" varchar(50) not null,
  "quantidade_estoque" integer not null,
  "data_fabricacao" date,
  "valor_unitario" decimal not null,
  "data_cadastro" date,
  "codigo_funcionario" integer not null,
  PRIMARY KEY ("codigo_produto")
 );

--modificação dos atributos
alter table produto add column codigo_categoria integer not null;
alter table categoria drop column codigo_produto; 
alter table pedido drop column codigo_item;
alter table item_compra add column codigo_pedido integer not null;
 
--definindo chaves estrangeiras
alter table produto add CONSTRAINT "FK_produto.codigo_funcionario" FOREIGN KEY ("codigo_funcionario")
 REFERENCES "funcionario"("codigo_funcionario"); 
alter table cliente add CONSTRAINT "FK_cliente.codigo_endereco" FOREIGN KEY ("codigo_endereco")
 REFERENCES "endereco_cliente"("codigo_endereco"); 

alter table produto add CONSTRAINT "FK_categoria.codigo_codigo_categoria" FOREIGN KEY ("codigo_categoria")
 REFERENCES "categoria"("codigo_categoria");

alter table item_compra add CONSTRAINT "FK_item_compra.codigo_produto" FOREIGN KEY ("codigo_produto")
 REFERENCES "produto"("codigo_produto"); 
alter table item_compra add CONSTRAINT "FK_item_compra.codigo_pedido" FOREIGN KEY ("codigo_pedido")
 REFERENCES "pedido"("codigo_pedido"); 

--inserindo dados dos funcionários
insert into "funcionario" (nome_funcionario, cpf_funcionario, salario) values('Thiago', 99988877700, 2000);
insert into "funcionario" (nome_funcionario, cpf_funcionario, salario) values('Andrea', 11122233366, 2500);
insert into "funcionario" (nome_funcionario, cpf_funcionario, salario) values('Vanessa',22233366655, 3000);
insert into "funcionario" (nome_funcionario, cpf_funcionario, salario) values('Ricardo',33344455566, 3500);
insert into "funcionario" (nome_funcionario, cpf_funcionario, salario) values('Ariane', 44455566699, 4000);
insert into "funcionario" (nome_funcionario, cpf_funcionario, salario) values('Douglas',55566699988, 4500);
insert into "funcionario" (nome_funcionario, cpf_funcionario, salario) values('Debora',55589699988, null);


--modificação dos atributos
alter table telefone rename to telefone_cliente;
alter table cliente add CONSTRAINT "FK_cliente.codigo_telefone" FOREIGN KEY ("codigo_telefone") REFERENCES "telefone_cliente"("codigo_telefone");
alter table telefone_cliente rename column telefone_principal to ddd_principal;
alter table telefone_cliente rename column telefone_secundario to telefone_principal;
alter table telefone_cliente add column ddd_secundario integer; 
alter table telefone_cliente add column telefone_secundario integer; 

alter table endereco_cliente drop column rua; 
alter table endereco_cliente drop column numero_casa; 
alter table endereco_cliente drop column bairro; 
alter table endereco_cliente drop column cidade; 
alter table endereco_cliente drop column estado;

alter table endereco_cliente add column rua varchar(30) not null;
alter table endereco_cliente add column numero integer not null;
alter table endereco_cliente add column complemento varchar(15);
alter table endereco_cliente add column bairro varchar(20) not null;
alter table endereco_cliente add column cidade varchar(20) not null;
alter table endereco_cliente add column estado varchar(2) not null;

--alteração dos tipos de dados
alter table cliente alter column cpf_cliente type char(11);
alter table telefone_cliente alter column telefone_principal type char(9); 
ALTER TABLE telefone_cliente ALTER COLUMN telefone_secundario TYPE char(9);
ALTER TABLE telefone_cliente ALTER COLUMN ddd_principal TYPE char(2); 
ALTER TABLE telefone_cliente ALTER COLUMN ddd_secundario TYPE char(2); 
alter table funcionario alter column cpf_funcionario type char(11);
alter table produto alter column valor_unitario type money;

--inserindo dados dos clientes
insert into telefone_cliente (ddd_principal, telefone_principal, ddd_secundario, telefone_secundario) 
values (21, 998889988, 21, 26435343);
insert into telefone_cliente (ddd_principal, telefone_principal, ddd_secundario, telefone_secundario) 
values (21, 998889989, 21, 26435344);
insert into telefone_cliente (ddd_principal, telefone_principal, ddd_secundario, telefone_secundario) 
values (21, 998889990, 21, 26435345);
insert into telefone_cliente (ddd_principal, telefone_principal, ddd_secundario, telefone_secundario) 
values (21, 998889991, 21, 26435346);
insert into telefone_cliente (ddd_principal, telefone_principal, ddd_secundario, telefone_secundario) 
values (22, 994589991, null, null);
insert into telefone_cliente (ddd_principal, telefone_principal, ddd_secundario, telefone_secundario) 
values (24, 998889771, null, null);

insert into endereco_cliente (cep, rua, numero, complemento, bairro, cidade, estado) 
values (25960550, 'Rua Rui Barbosa', 200, ' ' , 'Agriï¿½es', 'Teresï¿½polis', 'RJ');
insert into endereco_cliente (cep, rua, numero, complemento, bairro, cidade, estado) 
values (25960555, 'Av. Slooper', 1500, 'casa 01' , 'Alto', 'Teresï¿½polis', 'RJ');
insert into endereco_cliente (cep, rua, numero, complemento, bairro, cidade, estado) 
values (25960552, 'Rua Parana', 10, ' ', 'Centro', 'Teresï¿½polis', 'RJ');
insert into endereco_cliente (cep, rua, numero, complemento, bairro, cidade, estado) 
values (25960560, 'Av. Lucio Meira', 1830, 'ap. 502' , 'Barra', 'Teresï¿½polis', 'RJ');
insert into endereco_cliente (cep, rua, numero, complemento, bairro, cidade, estado) 
values (25960950, 'Av. Oliveira Botelho', 630, null , 'Alto', 'Petropolis', 'RJ');
insert into endereco_cliente (cep, rua, numero, complemento, bairro, cidade, estado) 
values (25970560, 'Rua das Flores', 30, null , 'Olaria', 'Nova Friburgo', 'RJ');

insert into cliente (nome, sobrenome, login, senha, email_cliente, cpf_cliente, data_nascimento, codigo_telefone, codigo_endereco) 
values ('Jose', 'Ferreira', 'jose', 'j12345' , 'jose@gmail.com', 07635687920, '1990-10-10', 1, 1);
insert into cliente (nome, sobrenome, login, senha, email_cliente, cpf_cliente, data_nascimento, codigo_telefone, codigo_endereco) 
values ('Maria', 'Antunes', 'maria', 'm12345' , 'mariae@gmail.com', 87635687920, '1991-9-20', 2, 2);
insert into cliente (nome, sobrenome, login, senha, email_cliente, cpf_cliente, data_nascimento, codigo_telefone, codigo_endereco) 
values ('Flavio', 'Malone', 'flavio', 'f12345' , 'flavio@gmail.com', 97635687920, '1977-01-5', 3, 3);
insert into cliente (nome, sobrenome, login, senha, email_cliente, cpf_cliente, data_nascimento, codigo_telefone, codigo_endereco) 
values ('Renata', 'Castro', 'renata', 'r12345' , 'renata@gmail.com', 94565687920, '1980-07-09', 4, 4);
insert into cliente (nome, sobrenome, login, senha, email_cliente, cpf_cliente, data_nascimento, codigo_telefone, codigo_endereco) 
values ('Ricardo', 'Gomes', 'ricardo', 'r12345' , 'ricardo@gmail.com', 94565667920, '1985-08-09', 5, 5);
insert into cliente (nome, sobrenome, login, senha, email_cliente, cpf_cliente, data_nascimento, codigo_telefone, codigo_endereco) 
values ('Carla', 'Souza', 'carla', 'c12345' , 'carla@gmail.com', 94566687920, '1986-10-8', 6, 6);


--inserindo dados das categorias
insert into "categoria" (nome_categoria) values('Jogos');
insert into "categoria" (nome_categoria) values('Console');
insert into "categoria" (nome_categoria) values('Acessórios');
insert into "categoria" (nome_categoria) values('livros');   
insert into "categoria" (nome_categoria) values('Camisetas'); 
insert into "categoria" (nome_categoria) values('Adesivos');

--inserindo dados dos produtos
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario, codigo_categoria)
values('Pc Serratec', 3,'2022-02-22',2499.99,'2022-04-02',6 , 2 );
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario, codigo_categoria)
values('Serra Station 8',4,'2022-02-02',5499.99,'2022-04-02',5, 2);
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario, codigo_categoria)
values('Super Lï¿½gica',2,'2022-02-10',3499.99,'2022-04-02',3, 2);
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario, codigo_categoria)
values('Nï¿½o Entendo Switch',5,'2022-02-10',2499.99,'2022-04-02',6, 2);
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario, codigo_categoria)
values('Serra Drive',1,'2022-02-10',1099.99,'2022-04-02',1, 2);

insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario, codigo_categoria)
values('Controle sem fio paçoquinha++', 10,'2021-04-03',180.99,'2022-04-03',2, 3);
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario, codigo_categoria)
values('Teclado de jogos variáveis infinitas', 15,'2021-01-10',149.99,'2022-04-03',1, 3);
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario, codigo_categoria)
values('Progdragão',20,'2021-05-10',59.99,'2022-04-03',3, 3);
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario, codigo_categoria)
values('Mouse Gamer limpa +rápido',17,'2021-06-15',99.99,'2022-04-03',4, 3);
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario, codigo_categoria)
values('Livro * No final tudo da certo *',25,'2020-01-22',49.99,'2022-04-03',5, 3);

insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario, codigo_categoria)
values('SerratecAdventure', 5,'2022-01-10',199.99,'2022-04-02',1, 1);
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario, codigo_categoria)
values('Zepa Conquest', 2,'2022-01-10',299.99,'2022-04-02',2, 1);
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario, codigo_categoria)
values('Limpa',20,'2022-01-10',79.99,'2022-04-02',3, 1);
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario, codigo_categoria)
values('Enquanto Infinity',16,'2022-01-10',99.99,'2022-04-02',4, 1);
insert into produto (nome_produto, quantidade_estoque, data_fabricacao, valor_unitario,data_cadastro,codigo_funcionario, codigo_categoria)
values('Save the Programmer',9,'2022-01-10',149.99,'2022-04-02',5, 1);

--inserindo dados dos pedidos
insert into pedido (data_pedido, codigo_cliente) values('2022-01-21', 1);
insert into pedido (data_pedido, codigo_cliente) values('2021-12-15', 2);
insert into pedido (data_pedido, codigo_cliente) values('2022-02-10', 3);
insert into pedido (data_pedido, codigo_cliente) values('2022-03-05', 4);
insert into pedido (data_pedido, codigo_cliente) values('2022-03-18', 1);
insert into pedido (data_pedido, codigo_cliente) values('2022-04-01', 2);

--inserindo dados das quantidades
insert into item_compra (quantidade_comprada, codigo_produto, codigo_pedido) values(3, 2, 1);
insert into item_compra (quantidade_comprada, codigo_produto, codigo_pedido) values(1, 5, 1);
insert into item_compra (quantidade_comprada, codigo_produto, codigo_pedido) values(4, 7, 1);
insert into item_compra (quantidade_comprada, codigo_produto, codigo_pedido) values(1, 15, 2);
insert into item_compra (quantidade_comprada, codigo_produto, codigo_pedido) values(2, 8, 2);
insert into item_compra (quantidade_comprada, codigo_produto, codigo_pedido) values(1, 6, 3);
insert into item_compra (quantidade_comprada, codigo_produto, codigo_pedido) values(3, 12, 4);
insert into item_compra (quantidade_comprada, codigo_produto, codigo_pedido) values(1, 9, 4);
insert into item_compra (quantidade_comprada, codigo_produto, codigo_pedido) values(1, 3, 4);
insert into item_compra (quantidade_comprada, codigo_produto, codigo_pedido) values(1, 10, 5);
insert into item_compra (quantidade_comprada, codigo_produto, codigo_pedido) values(1, 1, 6);




