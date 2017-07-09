create database university_db
	character set utf8
	collate utf8_general_ci;

use university_db;

create table if not exists Faculties(
	id int auto_increment primary key not null,
    fac_name varchar(100) not null
)DEFAULT CHARSET = utf8;

create table if not exists Departments(
	id int auto_increment primary key not null,
    dep_name varchar(100) not null,
    fac_id int not null,
    constraint FK_FacultyDep foreign key(fac_id) references Faculties(id)
    on delete no action
    on update cascade
)DEFAULT CHARSET = utf8;

create table if not exists Subjects(
	id int auto_increment primary key not null,
    subj_name varchar(100) not null,
    dep_id int not null,
    constraint FK_DepSubj foreign key(dep_id) references Departments(id)
    on delete no action
    on update cascade
)DEFAULT CHARSET = utf8;

create table if not exists Groups(
	id int auto_increment primary key not null,
    group_name varchar(10) not null,
    dep_id int not null,
    constraint FK_DepGroup foreign key(dep_id) references Departments(id)
    on delete no action
    on update cascade
)DEFAULT CHARSET = utf8;

create table if not exists Users(
	id int auto_increment not null,
    login varchar(50) not null,
    pass varchar(50) not null,
    regkey varchar(100) not null,
    email varchar(70),
    last_name varchar(50) not null,
    first_name varchar(50) not null,
    middle_name varchar(50) not null,
    primary key(id)
)DEFAULT CHARSET = utf8;

create table if not exists Teachers(
	id int auto_increment primary key not null,
    user_id int unique not null,
	constraint FK_UserTeacher foreign key(user_id) references Users(id)
    on delete no action
    on update cascade
)DEFAULT CHARSET = utf8;

create table if not exists Students(
	id int auto_increment primary key not null,
    user_id int not null unique,
    group_id int not null,
    constraint FK_UserStudent foreign key(user_id) references Users(id)
    on delete no action
    on update cascade,
    constraint FK_GroupStudent foreign key(group_id) references Groups(id)
    on delete no action
    on update cascade
)DEFAULT CHARSET = utf8;


create table if not exists Teachers_Subjects(
	id int auto_increment primary key not null,
    teacher_id int not null,
    subj_id int not null,
    constraint FK_TeacherTSubj foreign key(teacher_id) references Teachers(id)
    on delete no action
    on update cascade,
    constraint FK_SubjectTSubj foreign key(teacher_id) references Subjects(id)
    on delete no action
    on update cascade
)DEFAULT CHARSET = utf8;

create table if not exists Tasks(
	id int auto_increment primary key not null,
    task_name varchar(100) not null,
    description text,
    start_time datetime not null,
    end_time datetime,
    estimated_time datetime,
    teacher_id int not null,
    group_id int not null,
    constraint FK_TeacherTask foreign key(teacher_id) references Teachers(id)
    on delete no action
    on update cascade,
    constraint FK_GroupTask foreign key(group_id) references Groups(id)
    on delete no action
    on update cascade
)DEFAULT CHARSET = utf8;

create table if not exists Documents(
	id int auto_increment primary key not null,
    path varchar(200) not null,
    user_id int not null,
    creation_time datetime not null,
    constraint FK_UserDoc foreign key(user_id) references Users(id)
    on delete no action
    on update cascade
)DEFAULT CHARSET = utf8;

create table if not exists Task_Doc(
	id int auto_increment primary key not null,
    task_id int not null,
    doc_id int not null,
    constraint FK_TaskTDoc foreign key(task_id) references Tasks(id)
    on delete no action
    on update cascade,
    constraint FK_DocTDoc foreign key(task_id) references Documents(id)
    on delete no action
    on update cascade
)DEFAULT CHARSET = utf8;