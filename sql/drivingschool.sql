
create database  if not exists drivingschool;
#show databases;
use drivingschool;

drop table if exists user;
create table if not exists user(
username varchar(20) primary key,
password varchar(20) not null
);

#drop table if exists studentinfo;
create table if not exists studentinfo(
sno int(8) primary key,
sname varchar(20)  not null,
sex enum('男','女') not null,
age int(3),
identify varchar(18) not null unique,
tel varchar(15) not null,
car_type varchar(4) not null,
stime date not null,
ltime date not null,
scondition enum('学习','结业','退学') not null,
s_text text
);

drop table if exists healthinfo;
create table if not exists healthifo(
id int primary key auto_increment,
sno int(8) unique not null,
sname varchar(20) not null,
health enum('健康','不健康'),
constraint health_fk foreign key(sno)
references studentinfo(sno)
);

#drop table if exists courseinfo;
create table if not exists courseinfo(
cno int(4) primary key,
cname varchar(20) not null unique,
before_course int(4) not null default 0
);


drop table if exists gradeinfo;
create table if not exists gradeinfo(
id int(8) primary key,
sno int(8) not null,
cno int(4) not null,
test_time date,
times int(3) default 1,
grade float default 0,
constraint grade_sno_fk foreign key(sno)
references studentinfo(sno),
constraint grade_cno_fk foreign key(cno)
references courseinfo(cno)
);


drop table if exists licenseinfo;
create table if not exists licenseinfo(
sno int(8) primary key,
sname varchar(20) not null,
lno varchar(18) not null unique,
constraint license_fk foreign key(sno)
references studentinfo(sno)
);

#create  index   index_stu_name  on studentinfo(sname);
#create view if not exists grade_view
#as select g.id,g.sno,s.sname,c.cname,g.test_time,g.grade
#from studentinfo s,courseinfo c,gradeinfo g
#where g.sno=s.sno and g.cno=c.cno;
delimiter &&
#create trigger license_stu after insert
#	on licenseinfo for each row
#	begin 
#		update studentinfo set scondition='结业'
#		where sno=new.sno;
#	end
#	&&
#delimiter ;

#delimiter &&
#create trigger delete_stuu after delete
#	on studentinfo for each row
#	begin 
#		delete from gradeinfo where sno=old.sno;
#		delete from healthinfo where sno=old.sno;
#		delete from licenseinfo where sno=old.sno;
#	end
#	&&
#delimiter ;
show tables;