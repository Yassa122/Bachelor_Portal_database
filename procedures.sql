go
 --point 1


CREATE PROCEDURE GENERATEPWD(@OUTMESSAGE VARCHAR(10) OUTPUT)  
AS   
BEGIN  
SET NOCOUNT ON  
declare @LENGTH INT,@CharPool varchar(26),@PoolLength varchar(26),@LoopCount  INT  
DECLARE @RandomString VARCHAR(10),@CHARPOOLINT VARCHAR(9)  
  
    
SET @CharPool = 'A!B@C!D#E@FG#H$IJ$K%LM%N*PQR%ST&U*V(W)X_YZ'  
DECLARE @TMPSTR VARCHAR(3)  

SET @PoolLength = DataLength(@CharPool)  
SET @LoopCount = 0  
SET @RandomString = ''  
  
    WHILE (@LoopCount<10)  
    BEGIN  
        SET @TMPSTR =   SUBSTRING(@Charpool, CONVERT(int, RAND() * @PoolLength), 1)           
        SELECT @RandomString  = @RandomString + CONVERT(VARCHAR(5), CONVERT(INT, RAND() * 10))  
        IF(DATALENGTH(@TMPSTR) > 0)  
        BEGIN   
            SELECT @RandomString = @RandomString + @TMPSTR    
            SELECT @LoopCount = @LoopCount + 1  
        END  
    END  
    SET @LOOPCOUNT = 0    
    SET @OUTMESSAGE=@RandomString  
END 


/*  1.a)  */
go

create proc UserRegister @usertype varchar(20), @userName varchar(20), @email varchar(50),
@first_name varchar(20), @last_name varchar(20), @birth_date datetime, @GPA decimal(3,2), 
@semester int, @address varchar(100), @faculty_code varchar(10), @major_code varchar(10), 
@company_name varchar(20), @representative_name varchar(20), @representative_email varchar(50),
@phone_number varchar(20), @country_of_residence varchar(20),
@userid int output,@passwordd varchar(10) output
as
exec GENERATEPWD @passwordd output 
INSERT into users (Username, Passwordd, Email ,phone_number)
VALUES (@userName, @passwordd, @email, @phone_number)

select @userid = userid from Users where @userName = UserName
begin
if (@usertype = 'Student') 
begin
insert into Student (s_id, first_name, last_name, Major_code, Date_Of_Birth,
age, Address, Semester, GPA, TotalBachelorGrade, Assigned_Project_code)
VALUES (@userid,@first_name, @last_name, @major_code, @birth_date, @address, 
@semester, @GPA, 0.0,@major_code)
END

if (@usertype = 'Company') 
begin
INSERT into Company (Company_id ,Company_Name, Representative_name ,Representative_Email, Locationn)
VALUES (@userid, @company_name, @Representative_name, @Representative_Email, @country_of_residence)
End

if (@usertype = 'Lecturer')
begin
insert into Lecturer (Lecturer_id )
VALUES (@userid)
end

if (@usertype = 'Teaching_Assistant') 
 begin
 insert into Teaching_Assistant (TA_id)
 VALUES (@userid)
 end
 
 if(@usertype = 'External_Examiner') 
 begin
insert into External_Examiner (EE_id)
 VALUES (@userid)
 end

 end

--2.a)
go
CREATE proc UserLogin @email varchar(50), @passwordd varchar(10), @success bit output, @userid int OUTPUT
 as

    IF NOT EXISTS (Select * From Users Where Email=@Email and Passwordd = @Passwordd)
           begin
		   SET @userid = -1
            SET @success = 1
			end
    IF EXISTS (Select * From Users Where Email=@Email and Passwordd = @Passwordd) --check/
         begin
		 SET @userid = User.userid
			SET @success = 0
			end


go
create proc ViewProfile @userid int
AS
Select * from users where Users.userid = @userid

--  2.c)  
go
create proc ViewBachelorProjects @ProjectType varchar(20), @userid int
AS
if (@ProjectType = Bachelor_Project.Namee and @userid = user.userid) select Description from Bachelor_Project where 
@ProjectType = Bachelor_Project.Namee and @userid = users.userid
 
if (@ProjectType is null and @userid = null) select Description from Bachelor_Project

if(@ProjectType is null and @userid != null) select Description from Bachelor_Project where @userid = users.userid


-- point 3


--//3.a//
go

CREATE PROC MakePreferencesLocalProject
	@s_id 						   	int,
	@bachelor_code 					varchar(10),
	@preference_number 				int

	as 
	begin
	
	  INSERT INTO StudentPreferences
			(
			s_id , 
			bachelor_code , 
			preference_number 
			)

	   values
	   (
	   @s_id,
	   @bachelor_code,
	   @preference_number
	   )
	   end 
	   
	   go
	--   //3.b//
	   CREATE PROC ViewMyThesis		
	   
	   @s_id					int, 
	   @title				varchar(50)
	   
	   as 
	 
	  if EXISTS (Select Assigned_Project_code 
           From Student s inner join Industrial i on s.Assigned_Project_code = i.Industrial_code)
			begin
			if GradeAcademicThesis.EE_grade is  Not NULL AND GradeAcademicTheiss.Lecturer_grade  is not null
				UPDATE Thesis set Total_Grade =GradeAcademicThesis.EE_grade+GradeAcademicThesis.Lecturer_grade/2 
				end
	  --UPDATE TOTALgRADE
	  SELECT @Total_grade = Total_grade 
	  FROM Thesis
      WHERE Total_grade = @Total_grade
	-- // 3.c//
	go

	 create proc SubmitMyThesis @s_id int, @title varchar(50), @PDF_Document varchar(1000)
	 as 
	   begin
	   insert into 
	Thesis(s_id,title,PDF_Document) values 
	(@s_id , @title, @PDF_Document)
	end 
	

	
	--3.d
	
	go
	create proc ViewMyProgressReports  @s_id int, @datee datetime
	as
	 if EXISTS (Select s_id, datee from ProgressReport )
		begin
		if @datee is null
		select *
		from ProgressReport
		order by datee desc;
		end
		if @datee is not null
		(select * from ProgressReport where @s_id = s_id and @datee = datee)
		

--	3.e 
go
create proc ViewMyDefense  @s_id int
			
			as
			if EXISTS (Select project From Student inner join Industrial on Assigned_Project_code = Industrial_code)
			begin
			if GradeAcademicDefense.EE_grade is  Not NULL AND GradeAcademicDefense.Lecturer_grade  is not null
				UPDATE Defense set Total_Grade =GradeAcademicDefense.EE_grade+GradeAcademicDefense.Lecturer_grade/2 
				
	   else 
	  
	 DECLARE @Total_Grade decimal(4,2)
SET @Total_Grade = Total_Grade
	  SELECT Total_Grade 
 FROM Defense
 
 WHERE @Total_Grade = Total_grade
	end
	--3.f
	go
	   create proc UpdateMyDefense
	   @s_id int, @Content varchar(1000)
	   as 
	   begin update Defense
	   set
	   Content=@Content
	  end


	  --3.g
	  go
		create proc ViewMyBachelorProjectGrade(
		 @s_id int)
		 
		 as 
		begin
		DECLARE @TotalBachelorGrade decimal(4,2);
SET @TotalBachelorGrade = TotalBachelorGrade;

DECLARE @age varchar(max);
SET @age = age;

		if (@TotalBachelorGrade is not null and @age is not null )
		
		select TotalBachelorGrade,age
		from Student
		where TotalBachelorGrade=0.3*Thesis.Total_grade+0.3*Defense.Total_grade+
0.4*ComulativeProgressReportGrade and Student.Age =@age

		 
		 end


		 --3.h
		 go
		 create proc ViewNotBookedMeetings 
@s_id int

as 
begin
select m.*
from Meeting m except(select m1.*
                      from meeting m1
                      inner join MeetingAttendents a on a.Meeting_ID = m1.Meeting_ID
                      where count(a.Attendant_id)>0)

end


	--   3.k*/
	go
	   create procedure StudentAddToDo
	   @meeting_id int, @to_do_list varchar(200)
	   as 
	   begin
	   insert into MeetingToDoList( 
	   meeting_id, to_do_list)
	   values 
	   (@meeting_id , @to_do_list )

	   end
	   go


create proc BookMeeting
@s_id int, 
@meeting_id int

as
begin
DECLARE @project_code int
select @project_code = (select s.Assigned_Project_code
                        from Student s
                        where s.s_id = @s_id)
Declare @lecturerID int
select @lecturerID = (select a.L_id
                      from Academic a
                      where a.Academic_code = @project_code)

if exists ( select m.* 
            from Meeting m
            where m.L_id = @lecturerID and m.Meeting_ID = @meeting_id)

            insert into  MeetingAttendents values(@meeting_id, @s_id) 


end 

go
create proc ViewMeeting
@meeting_id int, 
@s_id int

as 
begin
if(@meeting_id is null)
     select *
     from Meeting m
     inner join MeetingToDoList l on l.Meeting_ID = m.Meeting_ID 
     inner join MeetingAttendents a on a.Meeting_ID = m.Meeting_ID
     where a.Attendant_id = @s_id 

if(@meeting_id is not null)
select *
     from Meeting m
     inner join MeetingToDoList l on l.Meeting_ID = m.Meeting_ID 
     inner join MeetingAttendents a on a.Meeting_ID = m.Meeting_ID
     where a.Attendant_id = @s_id and a.Meeting_ID = @meeting_id
end
go
create procedure StudentAddToDo
@meeting_id int, 
@to_do_list varchar(200)
as 
begin
insert into MeetingToDoList(meeting_id, to_do_list) values (@meeting_id , @to_do_list )

end
go

	-- 4.a
	  
	  create proc AddEmployee  @Company_id int, @Email varchar(50), @Username varchar(20) , @Phone varchar(20),
@field varchar(25) ,@Passwordd varchar(10)

	as begin 
	insert into Employee(
	Company_id,
	Email,
	Username,
	Phone,
	field,
	Passwordd)
	values(
	@Company_id,
	@Email,
	@Username,
	@Phone,
	@field,
	@Passwordd)

	

	end
	--4.b
	go
	create proc CompanyCreateLocalProject 
@Company_ID int,@proj_code varchar(10), @title varchar(50), @description varchar(200), @major_code varchar(10)
as
begin
insert into Bachelor_Project (proj_code, title, description)
 VALUES (@proj_code , @title , @description)
insert into company(company_id) /*lecturer or academic ?*/
VALUES (@company_id)

insert into MajorHasBachelorProject(major_code)
VALUES (@major_code)

 
end
	go
	--4.d

create proc CompanyGradeThesis
@Company_id int, @s_id int, @thesis_title varchar(50), @Company_grade Decimal(4,2)

as
begin
 insert into CompanyGradeThesis values(null ,  @Company_id  , @s_id ,@thesis_title , @Company_grade  , null)
 end
 go
--4.e
Create proc CompanyGradedefense
@Company_id int, @s_id int, @defense_location varchar(5), @Company_grade Decimal
as
begin
 insert into CompanyGradedefense values(null ,  @Company_id  , @s_id  , @Company_grade  , null)
 end
--4.f
go
Create proc CompanyGradePR
@Company_id int, @s_id int, @datee datetime, @Company_grade decimal
as
begin
select totalbachelorgrade from student
 Where bachelor_projects = industrial

 insert into CompanyGradePR  values(null , @Company_id  , @s_id , @Company_grade,@date  , null )
end

--/5.a/
go

create proc LecturerCreateLocalProject @Lecturer_id int,
 @proj_code varchar(10), @title varchar(50), @description varchar(200), @major_code varchar(10)
as
begin

insert into Bachelor_Project (proj_code, title, description)
 VALUES (@proj_code , @title , @description)

insert into Lecturer (Lecturer_id) /*lecturer or academic ?*/
VALUES (@Lecturer_id)

insert into MajorHasBachelorProject(major_code)
VALUES (@major_code)

 
end

--5.b/
go

create proc LecturerCreateLocalProject @Lecturer_id int,
 @proj_code varchar(10), @title varchar(50), @description varchar(200), @major_code varchar(10)
as
begin

insert into Bachelor_Project (proj_code, title, description)
 VALUES(@proj_code , @title , @description)

insert into academic(L_id) 
VALUES (@Lecturer_id)

insert into MajorHasBachelorProject(major_code)
VALUES (@major_code)

 
end

--/5.c/

go
create proc CreateMeeting
@Lecturer_id int, @start_time time, @end_time time, @datee datetime, @meeting_point varchar(5)
as
begin
insert into Meeting (L_id, start_time, end_time, datee, meeting_point)
VALUES
(@Lecturer_id, @start_time, @end_time, @datee, @meeting_point)
end
go
--/5.d/
create proc LecturerAddToDo
@meeting_id int, @to_do_list varchar(200)
as
begin
insert into MeetingToDoList (meeting_id, ToDoList)
VALUES
(@meeting_id, @to_do_list)
end

--/5.e/
go
create proc ViewMeetingLecturer
@Lecturer_id int, @meeting_id int
as 
begin
if(@meeting_id is not null)
select meeting_id
from meeting
where meeting_id=@meeting_id and Lecturer_id=@Lecturer_id
end

if(@meeting_id is null)
begin
select meeting_id
from meeting
where Lecturer_id=@Lecturer_id
order by datee
end 


--/5.f/

go
create proc ViewEE 
as 
begin

SELECT *
from External_Examiner
WHERE ee_id 
not in (
SELECT EE_id
from academic
)
end

--/5g/
go
create proc RecommendEE 
@Lecturer_id int, 
@proj_code varchar(10), 
@EE_id int
as
if exists (select  PCode from LecturerRecommendEE where  PCode = @proj_code)
update LecturerRecommendEE set L_id = @Lecturer_id , EE_id = @EE_id where PCode = @proj_code
else insert into LecturerRecommendEE (L_id , EE_id  , PCode)
values (@Lecturer_id ,  @EE_id , @proj_code)


--/5h/
go
create proc SuperviseIndustrial
@Lecturer_id int, 
@proj_code varchar(10)

as
begin 
if exists ( select i.Industrial_code from Industrial i where i.Industrial_code = @proj_code)

insert into Industrial values(@proj_code , null , @Lecturer_id , null)
end

--/5I/
go
create proc LecGradeThesis @Lecturer_id int, @s_id int, @thesis_title varchar(50), @Lecturer_grade Decimal(4,2)
as 
if exists (select s_id from GradeAcademicThesis where @s_id = s_id)
begin
update GradeAcademicThesis 
set L_id = @Lecturer_id , Lecturer_grade = @Lecturer_grade where s_id = s_id and Title = @thesis_title
end
else insert into GradeAcademicThesis (L_id , s_id , Title , Lecturer_grade)
values (@Lecturer_id , @s_id , @thesis_title , @Lecturer_grade )

/* 5J*/
go
 create proc LecGradedefense 
@Lecturer_id int, 
@s_id int, 
@defense_location varchar(5), 
@Lecturer_grade Decimal(4,2)
as
if exists (select s_id from GradeAcademicDefense where @s_id = s_id)
update GradeAcademicDefense set Lecturer_grade = @Lecturer_grade , L_id = @Lecturer_id where s_id = s_id and @defense_location = [Location]
else insert into GradeAcademicDefense (L_id , s_id , Locationn , Lecturer_grade)
Values (@Lecturer_id , @s_id , @defense_location , @Lecturer_grade)

--/5k/
go
create proc LecCreatePR 
@Lecturer_id int, 
@s_id int, 
@datee datetime, 
@content varchar(1000)
as
INSERT into ProgressReport (UpdatingUser_id , s_id , datee , Content )
VALUES (@Lecturer_id , @s_id , @datee , @content)
GO

--/5l/
go
create proc LecGradePR 
@Lecturer_id int, 
@s_id int, 
@datee datetime, 
@lecturer_grade decimal(4,2)
as
if exists (select s_id from GradeAcademicPR where @s_id = s_id)
update GradeAcademicPR set Lecturer_grade = @lecturer_grade , L_id = @Lecturer_id where s_id = @s_id and datee = @datee
else insert into GradeAcademicPR (L_id , s_id , datee , Lecturer_grade)
values (@Lecturer_id , @s_id , @datee , @lecturer_grade)
GO

--/6a/

create proc TACreatePR
@TA_id int, 
@s_id int, 
@datee datetime,
@content varchar(1000)
as
insert into ProgressReport values(@s_id , @datee , @content , null)

--/6b/

go 
create proc TAAddToDo
@meeting_id int, 
@to_do_list varchar(200)
as
insert into MeetingToDoList values (@meeting_id , @to_do_list)

--/7a/
go

create proc EEGradeThesis
 @EE_id int, 
 @s_id int, 
 @thesis_title varchar(50), 
 @EE_grade Decimal(4,2)
 as
begin
 insert into GradeAcademicThesis values(null ,  @EE_id , @s_id ,@thesis_title , @EE_grade , null)
 end 

--/7b/

go
create proc EEGradedefense
 @EE_id int, 
 @s_id int, 
 @defense_location varchar(5), 
 @EE_grade Decimal(4,2)

 as
begin
insert into GradeAcademicDefense values(null , @EE_id , @s_id , @defense_location , @EE_grade , null)
end

--/8a/
go
create proc ViewUsers
@User_type varchar(20), 
@Userid int

as 
begin 

if(@User_type= null)
select *
from [User]

if(@User_type= 'Lecturer')
select *
from Lecturer

if(@User_type= 'Company')
select *
from Company

if(@User_type= 'Employee')
select *
from Employee

if(@User_type= 'External_Examiner')
select *
from External_Examiner


if(@User_type= 'Teaching_Assistant')
select *
from Teaching_Assistant

if(@User_type= 'Coordinator')
select *
from Coordinator

if(@User_type= 'Student')
select *
from Student

if(@User_type= 'Teaching_Assistant')
select *
from Teaching_Assistant

end

--/8b/
go
create proc AssignAllStudentsToLocalProject
as begin
 if exists ( select s.s_id
     from StudentPreferences s
     right outer join Academic a on s.PCode = a.Academic_code
     group by s.s_id)
	
 if exists (select s.s_id
     from StudentPreferences s
     right outer join Industrial i on s.PCode = i.Industrial_code
     group by s.s_id )
	 
	 end
--/8c/
go
 

create proc AssignTAs
@coordinator_id int,
@TA_id int,
@proj_code varchar(10)
as 
begin
if exists ( select c.coordinator_id 
            from Coordinator  
            where c.coordinator_id = @coordinator_id)

insert into Academic values(@proj_code , null , @TA_id , null)
end

--/8d/
go
create proc ViewRecommendation
@lecture_id int
as 
begin
if exists(select rec.L_id
           from LecturerRecommendEE rec 
           where rec.L_id =@lecture_id)

          select a.*
          from Academic a
          left outer join  rec on rec.PCode = a.Academic_code
          group by a.L_id
           
end
--/8e/
go
create proc AssignEE
@TA_id int,
@coordinator_id int, 
@EE_id int, 
@proj_code varchar(10)

as 
begin
if exists ( select c.coordinator_id 
            from Coordinator  
            where c.coordinator_id = @coordinator_id)
            if exists( select rec.*
               from LecturerRecommendEE rec
               where rec.EE_id = @EE_id and rec.PCode = @proj_code)
                     insert into Academic values(@proj_code , null , @TA_id , null)
end

--/8f/
go
create proc ScheduleDefense
@s_id int, 
@datee datetime, 
@Timee time, 
@locationn varchar(5)

as
begin 
insert into Defense values(@s_id , @locationn , null , @Timee ,@datee , null)
end

go
create proc EmployeeGradeThesis
@Employee_id int, @s_id int, @thesis_title varchar(50), @Employee_grade Decimal(4,2)


As 
begin
insert into companyGradeThesis(Employee_id,s_id,thesis_title,Employee_grade )
values(@Employee_id  , @s_id ,@thesis_title , @Employee_grade)
 end


go 
create proc EmployeeGradedefense
@Employee_id int,
@s_id int,
@defense_location varchar(5), @Employee_grade Decimal(4,2) 
As 
begin
insert into companyGradeThesis(Employee_id ,
s_id ,
defense_location , Employee_grade) 
  values(@Employee_id ,
@s_id ,
@defense_location , @Employee_grade
 )
 end
 go
create proc EmployeeCreatePR
@Employee_id int, 
@s_id int,
@datee datetime,
@content varchar(1000)

as
begin 
insert into ProgressReport values(@s_id , @datee , @content,null , @Employee_id,null)
end