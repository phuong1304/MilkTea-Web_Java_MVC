create database MilkTeaShop

go
use MilkTeaShop
go

create table tblAccount(
	
	id int identity(1, 1) primary key,
	username varchar(20) unique not null,
	password varchar(30) not null,
	fullname nvarchar(50) not null,
	phone varchar(20) unique not null,
	address nvarchar(100),
	role varchar(5) default 'US',
	-- 0 - banned, 1 - active
	status bit default '1'

)

create table tblProduct(
	id int identity(1, 1) primary key,
	pname nvarchar(30) unique not null,
	description nvarchar(50), 
	price int default 0,
	imagePath varchar(100),
	-- 0 - out of stock, 1 - exist
	status bit default '1',
)


create table tblOrder(
	
	id int identity(1, 1) primary key,
	aid int foreign key references tblAccount(id),
	description nvarchar(300) not null,
	createDate date,
	total int not null,
	status int default 0,

)

go
insert into tblAccount(username, password, fullname, phone, role)
values('admin', 'admin', 'MilkTeaAdmin', '0833', 'AD')
go
select *
from tblAccount

select *
from tblProduct

select *
from tblOrder
