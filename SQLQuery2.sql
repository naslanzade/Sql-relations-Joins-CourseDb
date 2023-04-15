create database Shop

use Shop


--1
create table Categories(
[Id] int primary key identity(1,1),
[Name] nvarchar(100)
);


create table Products(
[Id] int primary key identity(1,1),
[Name] nvarchar (100),
[Count] int,
[Price] decimal,
[CategoryId] int foreign key references Categories([Id])
);



select * from Categories

select * from Products


insert into Categories([Name])
values('Notebooks and computer equipment'),
      ('Mobile phones'),
	  ('Household appliances'),	
	  ('Game consoles and accessories')



insert into Products([Name],[Count],[Price],[CategoryId])
values('Asus',2,1999.99,1),
	   ('Macbook',4,3999.99,1),
	   ('Apple',4,1599.99,2),
	   ('Samsung',2,1300.65,2),
	   ('PlayStation',1,1199.99,4)


select cg.Name as 'Category', pr.Name from Categories cg
inner join Products pr
on cg.Id=pr.CategoryId

select cg.Name as 'Category', pr.Name from Categories cg
left join Products pr
on cg.Id=pr.CategoryId

select cg.Name as 'Category', pr.Name from Categories cg
right join Products pr
on cg.Id=pr.CategoryId

select cg.Name as 'Category', pr.Name from Categories cg
full outer join Products pr
on cg.Id=pr.CategoryId




--2

create table Roles(
[Id] int primary key identity(1,1),
[Name] nvarchar(100)
);


create table Users(
[Id] int primary key identity(1,1),
[FullName] nvarchar(100),
[Age] int
);

create table UserRoles(
[Id] int primary key identity(1,1),
[UserId] int foreign key references Users([Id]),
[RoleId] int foreign key references Roles([Id])
);


select * from Users
select * from Roles
select * from UserRoles


insert into Users([FullName],[Age])
values('Novrasta Aslanzade',25),
      ('Rasul Hasanov',19),
	  ('Musa Afandiyev',19),
	  ('Fatima Bayramova',20)

insert into Roles([Name])
values('Front-End Developer'),
       ('Back-End Developer'),
	   ('FullStack Developer'),
	   ('UX/UI Design')


insert into UserRoles([UserId],[RoleId])
values(1,1),
      (2,3),
	  (3,3)



select us.FullName as 'Full Name', ro.Name as 'Role' from Users us
inner join UserRoles ur
on us.Id=ur.UserId
inner join Roles ro
on ro.Id=ur.RoleId


select us.FullName as 'Full Name', ro.Name as 'Role' from Users us
left join UserRoles ur
on us.Id=ur.UserId
left join Roles ro
on ro.Id=ur.RoleId

select us.FullName as 'Full Name', ro.Name as 'Role' from Users us
right join UserRoles ur
on us.Id=ur.UserId
right join Roles ro
on ro.Id=ur.RoleId


select us.FullName as 'Full Name', ro.Name as 'Role' from Users us
full outer join UserRoles ur
on us.Id=ur.UserId
full outer join Roles ro
on ro.Id=ur.RoleId
