use master;
drop database Lojainfo2
go

create database Lojainfo2 
go 

use Lojainfo2

GO

create table tb_clientes(
	id int primary key not null identity(1,1),
	nome varchar(50)
);

go

create table clientesDatados (
 idComData int primary key not null identity(1,1),
 id  int,
 nome varchar(50),
 data date
 )
 
 go

CREATE TRIGGER trgAfterDate on tb_clientes
FOR INSERT
AS
declare @cliid int;
declare @clinome varchar(100);


declare @audit_action varchar(100);

select @cliid=i.id from inserted i;
select @clinome=i.nome from inserted i;


insert into clientesDatados(id,nome,data)
values (@cliid,@clinome,GETDATE());

select * from tb_clientes;

GO

select * from clientesDatados;

GO

insert into tb_clientes values
('Gabriel');

go
