use master
go


drop database Lojainfo
go

create database Lojainfo 
go 

use Lojainfo
GO

create table tb_clientes(
       id_cliente int PRIMARY KEY IDENTITY(1,1),
       nome nvarchar(50) not null,
       endereco nvarchar(100),
       idade int NOT NULL,
       sexo char(1) NOT NULL,
       fone nvarchar(15),
       email nvarchar(70),
)
GO

create table tb_hardware(
       id_hardware int PRIMARY KEY IDENTITY(1,1),
       descricao nvarchar(50) not null,
       preco_unit decimal NOT NULL,
       qtde_atual int NOT NULL, --0 caso nao tenha no estoque
       qtde_minima int,
       img image DEFAULT NULL
)
GO

create table tb_vendas(
       id_venda int primary key IDENTITY(1,1),
       id_cliente int not null,
       data date not null,
       desconto decimal(2,2)
)
GO

create table tb_vendas_itens(
       id_item int PRIMARY KEY identity(1,1),
       id_venda int not null,
       id_hardware int not null,
       qtde_item int not null,
       pco_vda decimal(8,2) not null
)
GO

alter table tb_vendas
      ADD CONSTRAINT fk_vda_cli
      FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
      go 

alter table tb_vendas_itens
	ADD CONSTRAINT fk_vda_venda 
	FOREIGN KEY (id_venda) REFERENCES tb_vendas(id_venda)
	go
alter table tb_hardware
	ADD CONSTRAINT fk_vda_hardware
	FOREIGN KEY (id_hardware) REFERENCES tb_hardware(id_hardware)
	go
alter table tb_vendas_itens
	ADD CONSTRAINT fk_vda_hardware2
	FOREIGN KEY (id_hardware) REFERENCES tb_hardware(id_hardware)
	go
	
	INSERT INTO tb_clientes (nome, endereco, idade, sexo, fone, email)
VALUES ('Guilherme Teixeira', 'Rua Anita Garibald 12', '30', 'M', '(11)98827-4190', 'guilherme@icloud.com'),
	   ('Bernardo Amaral', 'Parque Anhangaba� 258', '19', 'M', '(11)92126-5337', 'bernardo.amaral@yahoo.com'),
	   ('Gabriela Ducati', 'Rua �lvaro Anes 236', '22', 'F', '(11)95429-5077', 'gabriela.ducati@yahoo.com'),
	   ('Mariana Gomes', 'Rua Anita Garibald 12', '52', 'F', '(11)94312-0800', 'mariana.gomes@icloud.com'),
	   ('Alice Machado', 'Rua Anita Cajado 21', '48', 'F', '(11)98468-8248', 'alice.machado@uol.com.br')
	   go
    
	   
	   INSERT INTO tb_hardware (descricao, preco_unit, qtde_atual, qtde_minima)
VALUES ('Placa de video', '150.00', '100', '1'),
	   ('Placa mae', '300.00', '400', '1'),
	   ('Memoria RAM', '700.00', '300', '2'),
	   ('HD', '500.00', '865', '1'),
	   ('Teclado', '150.00', '48', '1')
	   go
	   
	   INSERT INTO tb_vendas (id_cliente, data)
VALUES ('1', '12/08/2018'),
	   ('2', '10/10/2018'),
	   ('3', '21/7/2019'),
	   ('4', '08/05/2019'),
	   ('5', '14/12/2018')
	   go
	   
	  SELECT * FROM tb_vendas
	   
	   INSERT INTO tb_vendas_itens (id_venda, id_hardware, qtde_item, pco_vda)
VALUES ('8', '1','1', '12.00'),
       ('9', '2', '2', '25.00'),
	   ('10', '3', '3', '56.00'),
	   ('11', '4', '4', '80.00'),
	   ('12', '5', '5', '45.00')
	   
	   go
  
	   SELECT * FROM tb_clientes
	   SELECT * FROM tb_hardware
	   SELECT * FROM tb_vendas
	   SELECT * FROM tb_vendas_itens