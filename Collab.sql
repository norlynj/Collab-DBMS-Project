create database collab;
use collab;

create table student(
id varchar(10) primary key,
name varchar(25) not null,
email varchar(20) unique
);

create table role(
id int primary key,
name varchar(20),
description varchar(100)
);

create table label(
id varchar(10) primary key,
tag varchar(20) unique not null
);


create table assign_label(
student_id varchar(10) primary key,
label_id varchar(10),
foreign key (student_id) references student(id),
foreign key (label_id) references label(id)
);

create table task(
id varchar(10) primary key,
title varchar(25) not null,
description varchar(50) unique
);

create table status(
id varchar(10) primary key,
deadline date not null,
state varchar(20) default '' 
	check(state='to-do' or state='in progress' or 
		state='for review' or state='testing' or state='passed'),
overdue varchar(10) default ''
);


create table comment(
id varchar(10) primary key,
note varchar(50) default ''
);

create table assign_role(
student_id varchar(10) primary key,
role_id int,
foreign key (student_id) references student(id),
foreign key (role_id) references role(id)
);

create table assign_task(
student_id varchar(10),
task_id varchar(10) primary key,
foreign key (student_id) references student(id),
foreign key (task_id) references task(id)
);

create table task_label(
task_id varchar(10) primary key,
label_id varchar(10),
foreign key (task_id) references task(id),
foreign key (label_id) references label(id)
);

create table task_status(
task_id varchar(10) primary key,
status_id varchar(10),
foreign key (task_id) references task(id),
foreign key (status_id) references status(id)
);

create table task_comment(
task_id varchar(10) primary key,
comment_id varchar(10),
student_id varchar(10),
foreign key (task_id) references task(id),
foreign key (comment_id) references comment(id),
foreign key (student_id) references student(id)
);
