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

	
	INSERT INTO tb_clientes (nome, endereco, idade, sexo, fone, email)
VALUES ('Guilherme Teixeira', 'Rua Anita Garibald 12', '30', 'M', '(11)98827-4190', 'guilherme@icloud.com'),
	   ('Bernardo Amaral', 'Parque Anhangabaú 258', '19', 'M', '(11)92126-5337', 'bernardo.amaral@yahoo.com'),
	   ('Gabriela Ducati', 'Rua Álvaro Anes 236', '22', 'F', '(11)95429-5077', 'gabriela.ducati@yahoo.com'),
	   ('Mariana Gomes', 'Rua Anita Garibald 12', '52', 'F', '(11)94312-0800', 'mariana.gomes@icloud.com'),
	   ('Alice Machado', 'Rua Anita Cajado 21', '48', 'F', '(11)98468-8248', 'alice.machado@uol.com.br'),
	   ('Marcos Vinicius', 'Rua Everaldo Tavares 19', '17', 'M', '(11)98965-2356', 'marcos.vinicius@uol.com.br')
	   go
    
	   
	   INSERT INTO tb_hardware (descricao, preco_unit, qtde_atual, qtde_minima)
VALUES ('Placa de video', '150.00', '100', '1'),
	   ('Placa mae', '300.00', '400', '1'),
	   ('Memoria RAM', '700.00', '300', '2'),
	   ('HD', '500.00', '865', '1'),
	   ('Teclado', '150.00', '48', '1'),
	   ('Celular', '800.00', '20', '1')
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
VALUES ('1', '1','1', '12.00'),
       ('2', '2', '2', '25.00'),
	   ('3', '2', '3', '56.00'),
	   ('3', '4', '3', '80.00'),
	   ('4', '5', '5', '45.00')
	   
	   go
  alter table tb_vendas
      ADD CONSTRAINT fk_vda_cli
      FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
      go 
create table tb_vendas_canceladas(
       id_v_cancelada int unique identity(1,1),
       id_venda int not null)
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
alter table tb_vendas_canceladas
      ADD CONSTRAINT fk_vendas_canceladas
      FOREIGN KEY (id_venda) REFERENCES tb_vendas(id_venda)
      go
      
	   SELECT * FROM tb_clientes
	   SELECT * FROM tb_hardware
	   SELECT * FROM tb_vendas
	   SELECT * FROM tb_vendas_itens
	   
	   SELECT v.id_venda, c.nome as nome_cliente FROM tb_vendas as v
	   INNER JOIN tb_clientes as c
	   ON v.id_cliente = c.id_cliente
	   
	   SELECT * FROM tb_clientes as c
	   LEFT JOIN tb_vendas as v 
	   ON c.id_cliente = v.id_cliente
	   
	   
	   SELECT * FROM tb_hardware as v
	   LEFT JOIN tb_vendas_itens as vi
	   ON v.id_hardware = vi.id_hardware
	   WHERE vi.id_hardware is null
	   
	  -- P1 Nome do cliente que fez cada uma das compras/venda
	  -- P2 Nome dos clientes que não fizeram compras/vendas
	  -- P3 Produtos que não foram vendidos