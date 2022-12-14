
create table Users(
	userid int primary key IDENTITY ,
	Username varchar(20),
	Passwordd varchar(10),
	Email varChar(50),
	Rolee varchar(70),
	phone_number varchar(20),
	
);

create table Lecturer(
	Lecturer_id int ,
	field varchar(25),
	primary key(Lecturer_id),
	foreign key(Lecturer_id) references Users(userid) ON UPDATE CASCADE ON DELETE CASCADE 
);

create table LecturerFields(
	Lecturer_id int,
	field varchar(20),
	constraint PK_LecturerFields primary key (Lecturer_id , field),
	foreign key(Lecturer_id) references Users(userid) ON UPDATE CASCADE ON DELETE CASCADE
);

create table Company(
	Company_id int,
	Company_Name varchar(20),
	Representative_name varchar(20) ,
	Representative_Email varchar(50),
	Locationn varchar(5),
	primary key(Company_id),
	foreign key (Company_id) references Users(userid) ON UPDATE CASCADE ON DELETE CASCADE
);

create table Employee(
	Staff_id int identity,
	Company_id int,
	Username varchar(20),
	Passwordd varchar(10),
	Email varchar(50),
	Field varchar(25),
	Phone varchar(20),
	primary key(Staff_id,Company_id),
	foreign key (Company_id) references Company on update cascade on delete cascade
);


create table External_Examiner(
	EE_id int,
	Schedule varchar(20),
	primary key(EE_id),
	foreign key(EE_id) references Users(userid) on update cascade on delete cascade
);

create table Teaching_Assistant(
	TA_id int,
	Schedule varchar(20),
	primary key(TA_id),
	foreign key(TA_id) references Users(userid) on update cascade on delete cascade
);

create table Coordinator(
	coordinator_id int,
	primary key(coordinator_id),
	foreign key(coordinator_id) references Users(userid) on update cascade on delete cascade
); 
create table Bachelor_Project(
	Code int ,
	Namee varchar(30),
	Submitted_Materials varchar(max),
	Descriptions varchar(200)
	primary key(Code),
);


create table BachelorSubmittedMaterials(
	Code int ,
	Material varchar(max),
	primary key(Code),
	foreign key(Code) references Bachelor_Project(Code) on update cascade on delete cascade
);


create table Academic(
	Academic_code int,
	L_id int ,
	TA_id int,
	EE_id int
	primary key(Academic_code),
	foreign key (Academic_code) references Bachelor_Project on update cascade on delete cascade,
    foreign key (L_id) references Lecturer on update cascade on delete cascade,
	foreign key (TA_id) references Teaching_Assistant ,
	foreign key (EE_id) references External_Examiner ,
);

create table Industrial(  
Industrial_code int primary key references Bachelor_Project on update cascade on delete cascade , 
C_id int ,
L_id int foreign key references Lecturer on update cascade on delete cascade  ,
E_id int,
foreign key (E_id ,C_id) references Employee (Staff_id ,Company_id)         
);



create table Faculty(
	Faculty_Code int,
	Namee varchar(20),
	Dean int,
	primary key(Faculty_Code),
	foreign key(Dean) references Lecturer on update cascade on delete cascade
);
create table Major(
	Major_Code int identity,
	Faculty_code int,
	Major_Name varchar(30),
	primary key(Major_Code),
	foreign key(Faculty_code) references Faculty on update cascade on delete cascade
);

create table Meeting(
	Meeting_ID int ,
	L_id int,
	STime time not null,
	ETime time not null,
	Duration as (DATEDIFF(MINUTE ,ETime , STime)),
	Datee date,
	Meeting_Point varchar(5),
	primary key(Meeting_ID),
	foreign key(Meeting_ID) references Lecturer on update cascade on delete cascade
);

create table MeetingToDoList(
	Meeting_ID int,
	ToDoList varchar(max),
	primary key(Meeting_ID),
	foreign key(Meeting_ID) references Meeting on update cascade on delete cascade,
);

create table MeetingAttendents(
Meeting_ID int ,
Attendant_id int ,
 PRIMARY KEY (Meeting_ID,Attendant_id),
foreign key (Meeting_ID) references Meeting (Meeting_ID) on update cascade on delete cascade ,
foreign key (Attendant_id) references Users (userid) 
);
create table Student(
	s_id int,
	first_name varchar(15) not null,
	last_name varchar(15) not null,
	Major_code int,
	Date_Of_Birth datetime NOT NULL,
	age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(Date_Of_Birth)),
	Adress varchar(100),
	Semester int,
	GPA decimal(3,2),
	TotalBachelorGrade decimal(4,2),
	Assigned_Project_code int,
	primary key(s_id),
	foreign key(s_id) references Users(userid) on update cascade on delete cascade,
	foreign key(Major_code) references Major(Major_Code) ,
	foreign key (Assigned_Project_code) references Bachelor_Project 
);

create table Thesis(
	s_id int ,
	Title varchar(50),
	Deadline datetime,
	PDF_doc varchar(100),
	Total_grade decimal(4,2),
	primary key(s_id,Title),
	foreign key(s_id) references Student on update cascade on delete cascade
);
create table Defense(
	s_id int ,
	Locationn varchar(5),
	Content varchar(1000),
	Timee time ,
	Datee datetime,
	Total_Grade decimal(4,2)
	primary key(s_id,Locationn),
	foreign key(s_id) references Student on update cascade on delete cascade
);

create table ProgressReport(
	s_id INT,
	Datee date,
	Content varchar(50),
	Grade decimal(4,2),
	UpdatingUser_id int,
	ComulativeProgressReportGrade decimal(4,2),
	primary key(s_id,Datee),
	foreign key(s_id)references Student ,
	foreign key(UpdatingUser_id)references Users(userid) on update cascade on delete cascade
);

create table GradeIndustrialPR(
C_id int foreign key references Company on update cascade on delete cascade, 
s_id int , 
Datee date  , 
Company_grade decimal(4,2),
Lecturer_grade decimal(4,2),
primary key (s_id , Datee),
foreign key (s_id , Datee) references ProgressReport (s_id , Datee) 
);

create table GradeAcademicPR(
L_id int foreign key references Lecturer on update cascade on delete cascade, 
s_id int , 
Datee date ,
Lecturer_grade decimal(4,2) ,
primary key (s_id, Datee),
foreign key (s_id , Datee) references ProgressReport (s_id , Datee) 
);
  
create table GradeAcademicThesis(
L_id int foreign key references Lecturer on update cascade on delete cascade,
EE_id int foreign key references External_Examiner  , 
s_id int , 
Title varchar(50) , 
EE_grade  decimal(4,2), 
Lecturer_grade  decimal(4,2) ,
primary key (s_id , Title),
foreign key (s_id , Title) references Thesis (s_id , Title)
);


create table GradeIndustrialThesis(
C_id int ,
E_id int , 
s_id int , 
Title varchar(50) , 
Company_grade decimal(4,2), 
Employee_grade decimal(4,2),
PRIMARY KEY (s_id , Title),
foreign key (s_id , Title )references Thesis (s_id , Title) ,
foreign key (E_id , C_id) references Employee (Staff_id,Company_id) on update cascade on delete cascade
);


 create table GradeAcademicDefense(
L_id int foreign key references Lecturer on update cascade on delete cascade  , 
EE_id int foreign key references External_Examiner , 
s_id int , 
Locationn varchar(5) , 
EE_grade decimal (4,2), 
Lecturer_grade decimal(4,2),
PRIMARY KEY (s_id , Locationn),
foreign key (s_id , Locationn) references Defense(s_id , Locationn) 
);

create table GradeIndustrialDefense(
C_id int , 
E_id int , 
s_id int , 
Locationn varchar(5), 
Company_grade decimal(4,2),
Employee_grade decimal(4,2),
PRIMARY KEY (s_id , Locationn),
foreign key (E_id , C_id) references Employee (Staff_id,Company_id) ,
foreign key (s_id , Locationn) references Defense (s_id , Locationn) on update cascade on delete cascade
);

create table LecturerRecommendEE(
	L_id int, 
	EE_id int ,
	PCode int,
	primary key(EE_id, PCode),
	foreign key(L_id) references Lecturer on update cascade on delete cascade,
	foreign key(EE_id) references External_Examiner ,
	foreign key(PCode) references Academic 
);



	create table StudentPreferences(
	s_id int,
	id int, 
	PCode int, 
	PreferenceNumber int,
	primary key(s_id, PCode),
	foreign key(s_id) references Student on update cascade on delete cascade,
	foreign key(PCode) references Bachelor_Project on update cascade on delete cascade
);

	create table MajorHasBachelorProject(
	Major_code int, 
	Project_code int,
	primary key(Major_code, Project_code),
	foreign key(Major_code) references Major on update cascade on delete cascade,
	foreign key(Project_code) references Bachelor_Project on update cascade on delete cascade
);



