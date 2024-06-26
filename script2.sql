USE [master]
GO
/****** Object:  Database [OnlineExame]    Script Date: 1/10/2024 3:15:46 AM ******/
CREATE DATABASE [OnlineExame]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExamSystem_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\ExamSystem_Data.mdf' , SIZE = 20480KB , MAXSIZE = 204800KB , FILEGROWTH = 10240KB ), 
 FILEGROUP [QuestionsFileGroup] 
( NAME = N'ExamSystem_FG1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\ExamSystem.ndf' , SIZE = 20480KB , MAXSIZE = 204800KB , FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'ExamiSystem_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\ExamSystem_Log.ldf' , SIZE = 20480KB , MAXSIZE = 204800KB , FILEGROWTH = 10240KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OnlineExame] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineExame].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineExame] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineExame] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineExame] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineExame] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineExame] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineExame] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineExame] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineExame] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineExame] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineExame] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineExame] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineExame] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineExame] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineExame] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineExame] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineExame] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineExame] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineExame] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineExame] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineExame] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineExame] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineExame] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineExame] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineExame] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineExame] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineExame] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineExame] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineExame] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineExame] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineExame] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineExame', N'ON'
GO
ALTER DATABASE [OnlineExame] SET QUERY_STORE = ON
GO
ALTER DATABASE [OnlineExame] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OnlineExame]
GO
/****** Object:  Table [dbo].[branch]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branch](
	[branch_id] [int] NOT NULL,
	[branch_city] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[intake]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[intake](
	[intake_id] [int] NOT NULL,
	[intake_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[intake_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[track]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[track](
	[track_id] [int] NOT NULL,
	[track_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[track_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[st_id] [int] NOT NULL,
	[intake_id] [int] NULL,
	[track_id] [int] NULL,
	[name] [varchar](50) NOT NULL,
	[gender] [varchar](10) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[st_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_crs]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_crs](
	[stu_id] [int] NOT NULL,
	[crs_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[stu_id] ASC,
	[crs_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department_branch]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department_branch](
	[dept_id] [int] NOT NULL,
	[branch_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
 CONSTRAINT [dept_branch_pk] PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC,
	[branch_id] ASC,
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[studentinfo]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[studentinfo]
as
select distinct(s.name),s.st_id ,s.username,t.track_name , i.intake_name ,b.branch_city
from student s inner join track t on t.track_id =s.track_id 
inner join intake i on i.intake_id =s.intake_id  inner join  student_crs sc on sc.stu_id =s.st_id 
inner join department_branch db on db.student_id = s.st_id ,branch b
where s.track_id = t.track_id
and s.intake_id = i.intake_id
and s.st_id = db.student_id
and db.branch_id =b.branch_id
GO
/****** Object:  Table [dbo].[question]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[Qid] [int] NOT NULL,
	[Qtext] [varchar](max) NOT NULL,
	[Qtype] [varchar](20) NOT NULL,
	[correct_answer] [varchar](max) NOT NULL,
	[degree] [int] NOT NULL,
	[CrsId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Qid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_answers]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_answers](
	[student_id] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[student_answer] [varchar](255) NULL,
	[Iscorrect] [bit] NULL,
 CONSTRAINT [studentAns_pk] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC,
	[student_id] ASC,
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exam_question]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam_question](
	[exam_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
 CONSTRAINT [examQuestion_pk] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC,
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[CalculateTotalDegree]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[CalculateTotalDegree]()
RETURNS TABLE
AS
RETURN
(
    SELECT s.student_id,stu.name, SUM(q.degree) AS total_degree
    FROM [dbo].[student_answers] s
    JOIN exam_question e ON s.exam_id = e.exam_id AND s.question_id = e.question_id
    JOIN [dbo].[question] q ON s.question_id = q.Qid
	JOIN [dbo].[student] stu ON s.student_id = stu.st_id
    WHERE s.IsCorrect = 'true'
    GROUP BY s.student_id ,stu.name
);
GO
/****** Object:  View [dbo].[StudentTotalDegreeView]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[StudentTotalDegreeView] AS
SELECT *
FROM dbo.CalculateTotalDegree();
GO
/****** Object:  Table [dbo].[course]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[CrsId] [int] NOT NULL,
	[ins_ID] [int] NULL,
	[CrsName] [varchar](25) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[QpoolName] [varchar](100) NULL,
	[Max_degree] [int] NOT NULL,
	[Min_Degree] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CrsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[QpoolName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exam]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[exam_id] [int] NOT NULL,
	[course_id] [int] NULL,
	[ins_id] [int] NULL,
	[exam_type] [varchar](50) NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[total_time] [int] NULL,
	[exam_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[allowance_option]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[allowance_option](
	[examID] [int] NOT NULL,
	[allowance_option] [varchar](250) NOT NULL,
 CONSTRAINT [allowance_option_PK] PRIMARY KEY CLUSTERED 
(
	[examID] ASC,
	[allowance_option] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ExamquestionInfo]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[ExamquestionInfo]
AS
SELECT
    eq.exam_id,
    c.CrsName,
    e.start_time,
    e.end_time,
    e.exam_date,
    e.total_time,
    IIF(e.exam_type = 'general', 'Normal Exam', 'Corrective') AS 'Exam Status',
    ap.allowance_option
FROM
    exam_question eq
JOIN
    exam e ON eq.exam_id = e.exam_id
JOIN
    course c ON e.course_id = c.CrsId
LEFT JOIN
    student_answers sa ON eq.exam_id = sa.exam_id
LEFT JOIN
    allowance_option ap ON e.exam_id = ap.examID
GROUP BY
  eq.exam_id, c.CrsName, e.start_time, e.end_time, e.exam_date, e.exam_type, ap.allowance_option, e.total_time;
GO
/****** Object:  Table [dbo].[Class]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_instructor]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_instructor](
	[classId] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[InstructorID] [int] NOT NULL,
 CONSTRAINT [CourseInstructor_PK] PRIMARY KEY CLUSTERED 
(
	[classId] ASC,
	[CourseID] ASC,
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departement]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departement](
	[dept_id] [int] NOT NULL,
	[dept_name] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructor]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor](
	[ins_id] [int] NOT NULL,
	[Super_id] [int] NULL,
	[name] [varchar](25) NOT NULL,
	[userName] [varchar](25) NOT NULL,
	[password] [varchar](25) NOT NULL,
 CONSTRAINT [instructor_PK] PRIMARY KEY CLUSTERED 
(
	[ins_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mcq_choise]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mcq_choise](
	[Qid] [int] NOT NULL,
	[choise_text] [varchar](200) NOT NULL,
 CONSTRAINT [mcqchoise_pk] PRIMARY KEY CLUSTERED 
(
	[Qid] ASC,
	[choise_text] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_exam]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_exam](
	[exam_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[StartTime] [time](7) NULL,
	[Endtime] [time](7) NULL,
	[Date_Exam] [datetime] NULL,
 CONSTRAINT [Student_Exam_Pk] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC,
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[allowance_option]  WITH CHECK ADD  CONSTRAINT [allowance_option_FK] FOREIGN KEY([examID])
REFERENCES [dbo].[exam] ([exam_id])
GO
ALTER TABLE [dbo].[allowance_option] CHECK CONSTRAINT [allowance_option_FK]
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD  CONSTRAINT [course_instructor_FK] FOREIGN KEY([ins_ID])
REFERENCES [dbo].[instructor] ([ins_id])
GO
ALTER TABLE [dbo].[course] CHECK CONSTRAINT [course_instructor_FK]
GO
ALTER TABLE [dbo].[Course_instructor]  WITH CHECK ADD  CONSTRAINT [Course_ins_class_fk] FOREIGN KEY([classId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[Course_instructor] CHECK CONSTRAINT [Course_ins_class_fk]
GO
ALTER TABLE [dbo].[Course_instructor]  WITH CHECK ADD  CONSTRAINT [Course_ins_course_fk] FOREIGN KEY([CourseID])
REFERENCES [dbo].[course] ([CrsId])
GO
ALTER TABLE [dbo].[Course_instructor] CHECK CONSTRAINT [Course_ins_course_fk]
GO
ALTER TABLE [dbo].[Course_instructor]  WITH CHECK ADD  CONSTRAINT [Course_ins_ins_fk] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[instructor] ([ins_id])
GO
ALTER TABLE [dbo].[Course_instructor] CHECK CONSTRAINT [Course_ins_ins_fk]
GO
ALTER TABLE [dbo].[department_branch]  WITH CHECK ADD  CONSTRAINT [dept_branch_branch_fk] FOREIGN KEY([branch_id])
REFERENCES [dbo].[branch] ([branch_id])
GO
ALTER TABLE [dbo].[department_branch] CHECK CONSTRAINT [dept_branch_branch_fk]
GO
ALTER TABLE [dbo].[department_branch]  WITH CHECK ADD  CONSTRAINT [dept_branch_depart_fk] FOREIGN KEY([dept_id])
REFERENCES [dbo].[departement] ([dept_id])
GO
ALTER TABLE [dbo].[department_branch] CHECK CONSTRAINT [dept_branch_depart_fk]
GO
ALTER TABLE [dbo].[department_branch]  WITH CHECK ADD  CONSTRAINT [dept_branch_student_fk] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([st_id])
GO
ALTER TABLE [dbo].[department_branch] CHECK CONSTRAINT [dept_branch_student_fk]
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [exam_course_fk] FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([CrsId])
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [exam_course_fk]
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [exam_ins_fk] FOREIGN KEY([ins_id])
REFERENCES [dbo].[instructor] ([ins_id])
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [exam_ins_fk]
GO
ALTER TABLE [dbo].[exam_question]  WITH CHECK ADD  CONSTRAINT [examQuestion_exam_fk] FOREIGN KEY([exam_id])
REFERENCES [dbo].[exam] ([exam_id])
GO
ALTER TABLE [dbo].[exam_question] CHECK CONSTRAINT [examQuestion_exam_fk]
GO
ALTER TABLE [dbo].[exam_question]  WITH CHECK ADD  CONSTRAINT [examQuestion_fk] FOREIGN KEY([question_id])
REFERENCES [dbo].[question] ([Qid])
GO
ALTER TABLE [dbo].[exam_question] CHECK CONSTRAINT [examQuestion_fk]
GO
ALTER TABLE [dbo].[instructor]  WITH CHECK ADD  CONSTRAINT [instructor_FK] FOREIGN KEY([Super_id])
REFERENCES [dbo].[instructor] ([ins_id])
GO
ALTER TABLE [dbo].[instructor] CHECK CONSTRAINT [instructor_FK]
GO
ALTER TABLE [dbo].[mcq_choise]  WITH CHECK ADD  CONSTRAINT [mcqchoise_fk] FOREIGN KEY([Qid])
REFERENCES [dbo].[question] ([Qid])
GO
ALTER TABLE [dbo].[mcq_choise] CHECK CONSTRAINT [mcqchoise_fk]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [CrsId_FK] FOREIGN KEY([CrsId])
REFERENCES [dbo].[course] ([CrsId])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [CrsId_FK]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [student_intake_fk] FOREIGN KEY([intake_id])
REFERENCES [dbo].[intake] ([intake_id])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [student_intake_fk]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [student_track_fk] FOREIGN KEY([track_id])
REFERENCES [dbo].[track] ([track_id])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [student_track_fk]
GO
ALTER TABLE [dbo].[student_answers]  WITH CHECK ADD  CONSTRAINT [studentAnswer_exam_fk] FOREIGN KEY([exam_id])
REFERENCES [dbo].[exam] ([exam_id])
GO
ALTER TABLE [dbo].[student_answers] CHECK CONSTRAINT [studentAnswer_exam_fk]
GO
ALTER TABLE [dbo].[student_answers]  WITH CHECK ADD  CONSTRAINT [studentAnswer_question_fk] FOREIGN KEY([question_id])
REFERENCES [dbo].[question] ([Qid])
GO
ALTER TABLE [dbo].[student_answers] CHECK CONSTRAINT [studentAnswer_question_fk]
GO
ALTER TABLE [dbo].[student_answers]  WITH CHECK ADD  CONSTRAINT [studentAnswers_student_fk] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([st_id])
GO
ALTER TABLE [dbo].[student_answers] CHECK CONSTRAINT [studentAnswers_student_fk]
GO
ALTER TABLE [dbo].[student_crs]  WITH CHECK ADD FOREIGN KEY([crs_id])
REFERENCES [dbo].[course] ([CrsId])
GO
ALTER TABLE [dbo].[student_crs]  WITH CHECK ADD FOREIGN KEY([stu_id])
REFERENCES [dbo].[student] ([st_id])
GO
ALTER TABLE [dbo].[student_exam]  WITH CHECK ADD  CONSTRAINT [studentExam_Exam_fk] FOREIGN KEY([exam_id])
REFERENCES [dbo].[exam] ([exam_id])
GO
ALTER TABLE [dbo].[student_exam] CHECK CONSTRAINT [studentExam_Exam_fk]
GO
ALTER TABLE [dbo].[student_exam]  WITH CHECK ADD  CONSTRAINT [studentExam_student_fk] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([st_id])
GO
ALTER TABLE [dbo].[student_exam] CHECK CONSTRAINT [studentExam_student_fk]
GO
/****** Object:  StoredProcedure [dbo].[add_mcq_ques]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[add_mcq_ques] @Qid int , @choise_text varchar(200)
as 
begin try 
	insert into [dbo].[mcq_choise]
	values (@Qid,@choise_text)
end try 
begin catch
	select 'ERROR:Duplicated Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[addDeptBrnach]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[addDeptBrnach] @dept_id int, @branch_id int,@student_id int
as 
begin try
	insert into [dbo].[department_branch]
	values (@dept_id,@branch_id,@student_id)
end try
begin catch
	select 'ERROR:Duplicated Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[addExamQuestion]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[addExamQuestion] @exam_id int, @question_id int
as 
begin try
	insert into [dbo].[exam_question]
	values (@exam_id,@question_id)
end try
begin catch
	select 'ERROR:Duplicated Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[addExamSP]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[addExamSP] @exam_id int,@course_id int,@ins_id int,@exam_type varchar(50), @startTime datetime, @endTime datetime,@exam_date date
as
begin try
	declare @total_time int
	set @total_time= datediff(minute,@startTime,@endTime)
	insert into Exam
	values (@exam_id, @course_id, @ins_id,@exam_type,@startTime,@endTime,@total_time,@exam_date)
end try
begin catch
	select 'ERROR:Duplicated Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[addInstructorSP]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[addInstructorSP] @ins_id int, @name nvarchar(50), @username nvarchar(50), @password nvarchar(50), @superId int
as
begin try
	insert into [dbo].[instructor]
	values ( @ins_id, @superId, @name , @username , @password )
end try
begin catch
	select 'ERROR:Duplicated Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[addIntakeSP]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[addIntakeSP] @intake_Id int,@intake_name varchar(20)
as 
begin try
	insert into [dbo].[intake]
	values (@intake_Id,@intake_name)
end try
begin catch
	select 'ERROR:Duplicated Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[checkaddStudenttoExam]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create   proc [dbo].[checkaddStudenttoExam] @exam_id int , @st_id int , @ins_id int ,@starttime time , @endtime time ,@date_exam datetime
	 as 
	 begin   
	
	if exists (select c.CrsId, sc.stu_id from course c join exam e  
      on c.CrsId = e.course_id and e.exam_id =@exam_id 
	  join student_crs sc on c.CrsId = sc.crs_id and sc.stu_id=@st_id )
	begin
	exec [dbo].[insertinto_student_examinsert] @exam_id,@st_id,@starttime,@endtime ,@date_exam
	end 
	else begin 
	select 'Error instructor must be in the same course of student '
	end
	end 
GO
/****** Object:  StoredProcedure [dbo].[checkanswerofstudent]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkanswerofstudent] @st_id int,@question_id int , @exam_id int  
as
begin

UPDATE sa
SET sa.[IsCorrect] = CASE WHEN sa.[student_answer] = q.[correct_answer] THEN 1 ELSE 0 END
FROM [dbo].[student_answers] sa
INNER JOIN [dbo].[question] q ON sa.[question_id] = q.[Qid];

end
GO
/****** Object:  StoredProcedure [dbo].[delete_mcq_ques]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[delete_mcq_ques] @Qid int 
as 
begin try 
	delete from [dbo].[mcq_choise]
	where [Qid]=@Qid
end try
begin catch
	select 'ERROR:Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[deleteDeptBranch]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[deleteDeptBranch] @student_id int
as
begin try
	delete from [dbo].[department_branch]
	where [student_id]=@student_id
end try
begin catch
	select 'ERROR:Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[deleteExam]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[deleteExam] @exam_id int
as
begin try
	delete from [dbo].[exam]
	where [exam_id]=@exam_id
end try
begin catch
	select 'ERROR:Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[deleteExamQuestion]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[deleteExamQuestion] @exam_id int, @question_id int
as
begin try
	delete from [dbo].[exam_question]
	where [exam_id]=@exam_id and [question_id]=@question_id
end try
begin catch
	select 'ERROR:Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[DeleteFromAllowenceOptionsTable]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteFromAllowenceOptionsTable] @ExamID INT
AS
   begin try
	DELETE FROM [dbo].[allowance_option]
	WHERE [examID] = @ExamID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED'
   end catch
GO
/****** Object:  StoredProcedure [dbo].[DeleteFromCourseTable]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteFromCourseTable] @CrsID INT
AS
   begin try
	DELETE FROM Course
	WHERE CrsID = @CrsID
	  end try
   begin catch
	  select 'ERROR:NOT EXISTED Value '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[DeleteFromQuestions]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[DeleteFromQuestions] @QuesID INT
AS
   begin try
	DELETE FROM [dbo].[question]
	WHERE  [Qid]= @QuesID
	  end try
   begin catch
	  select 'ERROR:  NOT EXISTED Value '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[DeleteFromstudent]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   create proc [dbo].[DeleteFromstudent] @StID INT
AS
   begin try
	DELETE FROM [dbo].[student]
	WHERE  st_id = @StID
	  end try
   begin catch
	  select 'ERROR:  NOT EXISTED Value '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[deletefromStudentAnswer]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[deletefromStudentAnswer] @StID INT, @ExID INT, @QuesID INT
   as begin try
   delete from [dbo].[student_answers]  
   where student_id = @StID AND exam_id = @ExID AND question_id = @QuesID
   end try 
   begin catch
	  select 'ERROR:  NOT EXISTED Value '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[deletefromstudentcourse]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   create proc [dbo].[deletefromstudentcourse]  @StID INT, @CrsID INT
AS   
   begin try
	DELETE FROM student_crs
	WHERE stu_id = @StID AND crs_id = @CrsID
  end try
   begin catch
	  select 'ERROR:  NOT EXISTED Value '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[DeleteFromTableBranch]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteFromTableBranch] @BranID INT
AS
   begin try
	DELETE FROM [dbo].[branch]
	WHERE [branch_id] = @BranID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED'
   end catch
GO
/****** Object:  StoredProcedure [dbo].[DeleteFromTableClass]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteFromTableClass] @ClassID INT
AS
   begin try
	DELETE FROM [dbo].[Class]
	WHERE [ClassId] = @ClassID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED'
   end catch
GO
/****** Object:  StoredProcedure [dbo].[DeleteFromTableDepartement]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteFromTableDepartement] @DeptID INT
AS
   begin try
	DELETE FROM [dbo].[departement]
	WHERE [dept_id] = @DeptID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED'
   end catch
GO
/****** Object:  StoredProcedure [dbo].[deleteInstructorSP]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[deleteInstructorSP] @username nvarchar(50)
as
begin try
	delete from [dbo].[instructor] where  [userName]= @username;
end try 
begin catch
	select 'ERROR:Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[deletestudent_exam]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[deletestudent_exam]  @exam_id int , @StId int 
  as 
  begin try
   delete from [dbo].[student_exam] where exam_id =@exam_id and student_id=@StId
   end try 
   begin catch 
   select 'Error : NOT EXISTED Value'
   end catch
GO
/****** Object:  StoredProcedure [dbo].[deletetrack]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[deletetrack] @track_id int 
  as
  begin try 
  delete from [dbo].[track] where track_id =@track_id
    end try 
  begin catch
  select 'Error:NOT EXISTED Value '
  end catch 
GO
/****** Object:  StoredProcedure [dbo].[disolayTableAllowenceOptionsTable]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[disolayTableAllowenceOptionsTable] @ExamID INT
AS
   begin try
	select * FROM [dbo].[allowance_option]
	WHERE [examID] = @ExamID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED ID '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[disolayTableBranch]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[disolayTableBranch] @BranID INT
AS
   begin try
	select * FROM [dbo].[branch]
	WHERE [branch_id] = @BranID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED ID '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[disolayTableClass]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[disolayTableClass] @ClassID INT
AS
   begin try
	select * FROM [dbo].[Class]
	WHERE [ClassId] = @ClassID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED ID '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[disolayTableDepartement]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[disolayTableDepartement] @DeptID INT
AS
   begin try
	select * FROM [dbo].[departement]
	WHERE [dept_id] = @DeptID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED ID '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[ExamGeneration]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROC [dbo].[ExamGeneration] @CrsName VARCHAR(10), @NoOfTFQ INT, @NoOfMCQ INT ,@type varchar(50) , @starttime datetime , @endtime datetime
 AS
   begin try
	DECLARE @CrsID INT
	SELECT @CrsID = c.CrsId
	FROM [dbo].[course]c
	WHERE c.CrsName = @CrsName

    -- Assigning the value of ExamID according to UNIX_TIMESTAMP
	DECLARE @ExamID INT
	SELECT @ExamID = DATEDIFF(SECOND,'1970-01-01', GETUTCDATE())
	
	-- Assigning the value of the current date to @ExamDate variable
	DECLARE @ExamDate DATE
	SELECT @ExamDate = GETDATE()

	-- Assigning the value of the course's instructor to @InsID variable
	DECLARE @InsID INT
	SELECT @InsID =  I.ins_id
	from instructor i inner join course c on i.ins_id =c.ins_ID and c.CrsName = @CrsName
	--FROM  Course_instructor i where i.CourseID =@CrsID



	-- Checking if the course name is invalid 
	if not exists (select c.CrsName from Course c where c.CrsName=@CrsName)
		select 'ERROR:incorrect course name'
	else
		begin
			if ((@NoOfTFQ+@NoOfMCQ)>10)
				select 'ERROR:questions more than 10'
			else if ((@NoOfTFQ < 1) OR (@NoOfMCQ < 1))
			SELECT 'ERROR:at least one question must be entered for each type'

			else if (@starttime > @endtime)
			select 'Error you cannot enter start time greater than end time'
			else
				begin
					-- Inserting the required data inside Exam table
					execute [dbo].[addExamSP]  @ExamID,@CrsID,@InsID,@type, @starttime,@endtime,@ExamDate
	
					-- Inserting the IDs of TFQ into ExamQuestion table
					INSERT INTO  [dbo].[exam_question]
					SELECT TOP(@NoOfTFQ) @ExamID, q.Qid
					FROM Question q
					WHERE q.Qtype = 'TFQ' AND q.CrsId = @CrsID AND q.Qtext IS NOT NULL
					ORDER BY NEWID()

					-- Inserting the IDs of MCQ into ExamQuestion table
					INSERT INTO [dbo].[exam_question]
					SELECT TOP(@NoOfMCQ) @ExamID, q.Qid
					FROM Question q
					WHERE q.Qtype = 'MCQ' AND q.CrsId = @CrsID  AND q.Qtext IS NOT NULL
					ORDER BY NEWID()
				end
		end
	end try
	begin catch
		select 'ERROR:check your inputs'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[ExamGenerationManual]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE   PROC [dbo].[ExamGenerationManual] 
    @CrsName VARCHAR(10),
    @SelectedQuestionsCSV NVARCHAR(MAX),
    @type VARCHAR(50),
    @starttime DATETIME,
    @endtime DATETIME
AS
BEGIN TRY
    DECLARE @CrsID INT
    SELECT @CrsID = c.CrsId
    FROM [dbo].[course] c
    WHERE c.CrsName = @CrsName

    -- Assigning the value of ExamID according to UNIX_TIMESTAMP
    DECLARE @ExamID INT
    SELECT @ExamID = DATEDIFF(SECOND, '1970-01-01', GETUTCDATE())

    -- Assigning the value of the current date to @ExamDate variable
    DECLARE @ExamDate DATE
    SELECT @ExamDate = GETDATE()

    -- Assigning the value of the course's instructor to @InsID variable and get id of instructor of this course
    DECLARE @InsID INT
    SELECT @InsID = I.ins_id
    FROM instructor i
    INNER JOIN course c ON i.ins_id = c.ins_ID AND c.CrsName = @CrsName

    -- Checking if the course name is invalid 
    IF NOT EXISTS (SELECT c.CrsName FROM Course c WHERE c.CrsName = @CrsName)
        SELECT 'ERROR: incorrect course name'
    ELSE
        BEGIN
            IF ((LEN(@SelectedQuestionsCSV) - LEN(REPLACE(@SelectedQuestionsCSV, ',', '')) + 1) > 10)
                SELECT 'ERROR: questions more than 10'
            ELSE IF ((LEN(@SelectedQuestionsCSV) - LEN(REPLACE(@SelectedQuestionsCSV, ',', '')) + 1) < 1)
                SELECT 'ERROR: at least one question must be entered'

            ELSE IF (@starttime > @endtime)
                SELECT 'Error: you cannot enter start time greater than end time'
            ELSE
                BEGIN
                    -- Inserting the required data inside Exam table
                    EXEC [dbo].[addExamSP] @ExamID, @CrsID, @InsID, @type, @starttime, @endtime, @ExamDate

                    -- Inserting the IDs of selected questions into ExamQuestion table
                    INSERT INTO [dbo].[exam_question]  ([exam_id],[question_id] )
                    SELECT @ExamID, CAST(value AS INT)
                    FROM STRING_SPLIT(@SelectedQuestionsCSV, ',')
                END
        END
END TRY
BEGIN CATCH
    SELECT 'ERROR: check your inputs'
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[GetExamQuestions]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE   PROC [dbo].[GetExamQuestions] @ExID INT
    AS
	SELECT Q.Qtext,Q.Qid, ISNULL(MCQ.choise_text, 'T or F') AS Choices
	FROM exam_question eq INNER JOIN Question Q
	ON Q.Qid = eq.question_id AND eq.exam_id = @ExID
	LEFT JOIN [dbo].[mcq_choise] MCQ
	ON Q.Qid = MCQ.Qid
GO
/****** Object:  StoredProcedure [dbo].[insertinto_student_examinsert]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[insertinto_student_examinsert] @exam_id int , @StId int , @strart time , @end time , @Date_exam datetime 
  as begin try 
  insert into [dbo].[student_exam] values (@exam_id,@StId,@strart,@end,@Date_exam)
  end try 
  begin catch 
  select 'Error :DUPLICATED Value '
  end catch 
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoAllowenceOptionsTable]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertIntoAllowenceOptionsTable] @ExamID INT, @Allowence_Option VARCHAR(40)
AS
	INSERT INTO [dbo].[allowance_option]
	VALUES(@ExamID,@Allowence_Option )
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoBranchTable]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertIntoBranchTable] @BranID INT, @BranCity VARCHAR(20)
AS
	INSERT INTO branch
	VALUES(@BranID, @BranCity)
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoClassTable]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertIntoClassTable] @ClassName VARCHAR(20)
AS
	INSERT INTO [dbo].[Class]
	VALUES(@ClassName)
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoCourse_InstructorTable]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertIntoCourse_InstructorTable] @CrsID INT,@CrsInsID int ,@ClassID int
AS
   begin try
	INSERT INTO Course_instructor
	VALUES(@ClassID,@CrsID,@CrsInsID )
	  end try
   begin catch
	  select 'ERROR: DUPLICATED Value'
   end catch
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoCourseTable]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertIntoCourseTable] @CrsID INT,@CrsInsID INT, @CrsName VARCHAR(20), @CrsDescription varchar(100), @PoolName varchar(100) , @MaxDegree int ,@MinDegree int
AS
   begin try
	INSERT INTO Course
	VALUES(@CrsID,@CrsInsID, @CrsName, @CrsDescription,@PoolName,@MaxDegree, @MinDegree)
	  end try
   begin catch
	  select 'ERROR: DUPLICATED Value'
   end catch
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoDepartementTable]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertIntoDepartementTable] @DeptID int , @DeptName VARCHAR(20)
AS
	INSERT INTO [dbo].[departement]
	VALUES(@DeptID  ,@DeptName)
GO
/****** Object:  StoredProcedure [dbo].[insertintoQuestion]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertintoQuestion] @QuesID INT, @QuesText NVARCHAR(700), @QuesType VARCHAR(3), @QuesAnswer VARCHAR(1),@QueDegree int, @QuesCrsID INT
AS
   begin try
	INSERT INTO [dbo].[question]
	VALUES(@QuesID, @QuesText, @QuesType, @QuesAnswer,@QueDegree ,@QuesCrsID)
	  end try
   begin catch
	  select 'ERROR: DUPLICATED Value'
   end catch
GO
/****** Object:  StoredProcedure [dbo].[insertintostudent]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[insertintostudent] @StID INT, @intackid int, @trackid int, @Name VARCHAR(20), @gender VARCHAR(20), @username varchar(150), @password NVARCHAR(150)
   as begin try
	INSERT INTO [dbo].[student]
	VALUES(@StID, @intackid , @trackid, @Name, @gender, @username, @password)
	  end try
   begin catch
	  select 'ERROR: DUPLICATED Value'
   end catch
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoStudentAnswers]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[InsertIntoStudentAnswers] @StID INT, @ExID INT, @QuesID INT, @Answer VARCHAR(1),@iscorrect bit
AS
   begin try
	INSERT INTO [dbo].[student_answers]
	VALUES(@StID, @ExID, @QuesID, @Answer, @iscorrect)	
	  end try
   begin catch
	  select 'ERROR: DUPLICATED Value'
   end catch
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoStudentCourse]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   create  PROC [dbo].[InsertIntoStudentCourse] @StID INT, @CrsID INT
AS
   begin try
	INSERT INTO [dbo].[student_crs]
	VALUES(@StID, @CrsID)
	  end try
   begin catch
	  select 'ERROR: DUPLICATED Value'
   end catch
GO
/****** Object:  StoredProcedure [dbo].[insertintotrack]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[insertintotrack] @track_id int , @Name varchar(100)
   as 
   begin try
   insert into [dbo].[track] values (@track_id,@Name)
   end try 
   begin catch
   select ' Error : DUPLICATED Value'
   end catch
GO
/****** Object:  StoredProcedure [dbo].[search_student_sp]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[search_student_sp]  @st_id int = null, @username nvarchar(50) = null
as 
begin 
	if @st_id is not null
	begin
		select * from studentinfo 
		where st_id = @st_id
	end
	else
	begin
		if @username is not null
		begin
			select * from studentinfo 
			where username = @username
		end
			else
			begin
				print 'you should search with one option at least'
			end
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[SearchOnExamSP]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[SearchOnExamSP]
    @exam_id INT = NULL,
    @CrsTitle NVARCHAR(50) = NULL
AS
BEGIN
    IF @exam_id IS NOT NULL
    BEGIN
        SELECT * FROM ExamquestionInfo
        WHERE exam_id = @exam_id;
    END
    ELSE
    BEGIN
        IF @CrsTitle IS NOT NULL
        BEGIN
            SELECT * FROM ExamquestionInfo
            WHERE CrsName = @CrsTitle;
        END
        ELSE
        BEGIN
            PRINT 'You should search with one option at least';
        END
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[searchonstudentview]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[searchonstudentview] @st_id int = null, @username nvarchar(50) = null
as 
begin 
	if @st_id is not null
	begin
		select * from studentinfo 
		where st_id = @st_id
	end
	else
	begin
		if @username is not null
		begin
			select * from studentinfo 
			where username = @username
		end
			else
			begin
				print 'you should search with one option at least'
			end
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[select_exam_question]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[select_exam_question] @exam_id int
as
begin try
select * from [dbo].[exam_question]
where [exam_id]= @exam_id
end try
begin catch
	select 'ERROR:Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[select_instructor]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   create   proc [dbo].[select_instructor] @ins_id int
as
begin try
select * from [dbo].[instructor]
where [ins_id]= @ins_id
end try
begin catch
	select 'ERROR:Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[selectfrom_student_exam]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[selectfrom_student_exam]  @exam_id int , @StId int
  as 
  begin try
  select * from [dbo].[student_exam] where exam_id =@exam_id and student_id =@StId
  end try 
  begin catch
  select 'Error :NOT EXISTED Value'
  end catch
GO
/****** Object:  StoredProcedure [dbo].[selectfromintake]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectfromintake] @intake_id int 
as
begin try 
select * from [dbo].[intake] where intake_id= @intake_id
end try 
begin catch 
select 'Error : Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[selectfromMcqQuestion]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectfromMcqQuestion] @McQuestion_id int 
as 
begin try 
select * from [dbo].[mcq_choise] where Qid =@McQuestion_id
end try 
begin catch 
select ' Error : Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[selectfromQuestion]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[selectfromQuestion]  @QuesID INT
AS
   begin try
	select * FROM [dbo].[question]
	WHERE Qid = @QuesID
	  end try
   begin catch
	  select 'ERROR:  NOT EXISTED ID '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[selectfromstudent]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   create PROC [dbo].[selectfromstudent]  @StID INT
AS
   begin try
	select * FROM student 
	WHERE st_id = @StID
	  end try
   begin catch
	  select 'ERROR:  NOT EXISTED ID '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[selectfromstudentAnswer]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectfromstudentAnswer] @StID INT, @ExID INT
AS
   begin try
	select * FROM student_answers
	WHERE student_id = @StID AND exam_id = @ExID 
	  end try
   begin catch
	  select 'ERROR:  NOT EXISTED ID '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[selectFromStudentCourse]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   create proc  [dbo].[selectFromStudentCourse] @StID INT, @CrsID INT
AS
   begin try
	select * FROM student_crs
	WHERE stu_id = @StID AND crs_id = @CrsID
	  end try
   begin catch
	  select 'ERROR:  NOT EXISTED ID '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[selectFromTableCourse]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectFromTableCourse] @CrsID INT
AS
   begin try
	select * FROM Course
	WHERE CrsID = @CrsID
	  end try
   begin catch
	  select 'ERROR:NOT EXISTED ID '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[selectFromTableCourse_Instructor]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectFromTableCourse_Instructor] @CrsID INT , @ClassID INT ,@InstructorID INT
AS
   begin try
	select * FROM [dbo].[Course_instructor]
	WHERE [CourseID] = @CrsID
	  end try
   begin catch
	  select 'ERROR:NOT EXISTED ID '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[selectFromTableDept_Branch]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectFromTableDept_Branch] @DeptID INT
AS
   begin try
	select * FROM [dbo].[department_branch]
	WHERE [dept_id] = @DeptID
	  end try
   begin catch
	 select 'ERROR:  NOT EXISTED ID '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[selectFromTableExam]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectFromTableExam] @ExamID INT
AS
   begin try
	select * FROM [dbo].[exam]
	WHERE [exam_id] = @ExamID
	  end try
   begin catch
	  select 'ERROR:  NOT EXISTED ID '
   end catch
GO
/****** Object:  StoredProcedure [dbo].[selectfromtrack]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[selectfromtrack] @track_id int 
  as 
  begin try
  select  *  from [dbo].[track] 
  where track_id = @track_id
  end try 
  begin catch
  select 'Error:NOT EXISTED Value '
  end catch 
GO
/****** Object:  StoredProcedure [dbo].[studentans]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	   create proc [dbo].[studentans]  @question_id int ,@Answer varchar(1) ,@st_id int , @exam_id int 
	   as begin 
	
	   if exists (select @st_id , @exam_id from   [dbo].[student_exam]s where  s.student_id =@st_id and s.exam_id =@exam_id)
	    exec [dbo].[InsertIntoStudentAnswers] @st_id,@exam_id ,@question_id ,@Answer , null  
	   end 
GO
/****** Object:  StoredProcedure [dbo].[update_mcq_ques]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[update_mcq_ques] @Qid int ,@letter char ,@choise_text varchar(200)
as 
begin try 
	update [dbo].[mcq_choise]
	set [choise_text] = @letter+')'+@choise_text
	where [Qid]=@Qid and [choise_text] like @letter+'%'
end try
begin catch
	select 'ERROR:Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[UpdateAllowenceOptionsTable]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateAllowenceOptionsTable] @ExamID INT, @Allowence_Option VARCHAR(40)
AS
    begin try
	UPDATE [dbo].[allowance_option]
	SET [allowance_option] = @Allowence_Option
	WHERE [examID] = @ExamID
	end try
	begin catch
	select 'ERROR: NOT EXISTED'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[UpdateBranchTable]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateBranchTable] @BranID INT, @BranCity VARCHAR(20)
AS
    begin try
	UPDATE [dbo].[branch]
	SET [branch_city] = @BranCity
	WHERE [branch_id] = @BranID
	end try
	begin catch
	select 'ERROR: NOT EXISTED'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[UpdateClassTable]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateClassTable]  @ClassName  VARCHAR(20) , @ClassID int
AS
    begin try
	UPDATE [dbo].[Class]
	SET [ClassName] = @ClassName
	WHERE [ClassId] = @ClassID
	end try
	begin catch
	select 'ERROR: NOT EXISTED'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[UpdateCourseTable]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateCourseTable] @CrsID INT,@CrsInsID INT, @CrsName VARCHAR(20), @CrsDescription varchar(100), @PoolName varchar(100) , @MaxDegree int ,@MinDegree int
AS
   begin try
	UPDATE Course
	SET CrsName = @CrsName, [ins_ID]= @CrsInsID, [Description] = @CrsDescription , [QpoolName]=@PoolName ,[Max_degree] =@MaxDegree ,[Min_Degree] = @MinDegree
	WHERE CrsID = @CrsID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED Value'
   end catch
GO
/****** Object:  StoredProcedure [dbo].[UpdateDepartementTable]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateDepartementTable]  @DeptName  VARCHAR(20) , @DeptID int
AS
    begin try
	UPDATE [dbo].[departement]
	SET [dept_name] = @DeptName
	WHERE [dept_id] = @DeptID
	end try
	begin catch
	select 'ERROR: NOT EXISTED'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[updateDeptBranch]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[updateDeptBranch]  @dept_id int, @branch_id int,@student_id int
as
begin try 
	update [dbo].[department_branch]
	set [dept_id]=@dept_id,[branch_id]=@branch_id
	where [student_id]=@student_id
end try
begin catch
	select 'ERROR:Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[updateExamQuestion]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[updateExamQuestion]  @exam_id int, @old_question_id int, @new_question_id int
as
begin try 
	update [dbo].[exam_question]
	set [question_id] = @new_question_id
	where [exam_id]=@exam_id and [question_id]=@old_question_id
end try
begin catch
	select 'ERROR:Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[updateExamSP]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[updateExamSP] @exam_id int,@course_id int,@ins_id int,@exam_type varchar(50), @startTime datetime, @endTime datetime,@exam_date date
as
begin try
	declare @total_time int
	set @total_time= datediff(minute,@startTime,@endTime)
	update [dbo].[exam]
	set [course_id]=@course_id,[ins_id]=@ins_id,[exam_type]=@exam_type,[start_time]=@startTime,[end_time]=@endTime,[exam_date]=@exam_date,[total_time]=@total_time
	where [exam_id]=@exam_id
end try
begin catch
	select 'ERROR:Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[updateInsNameSP]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[updateInsNameSP] @username nvarchar(50), @name nvarchar(50)
as
begin try
	update [dbo].[instructor]
	set [name] = @name
	where [userName] = @username;
end try 
begin catch
	select 'ERROR:Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[updateInsPasswordSP]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[updateInsPasswordSP] @username nvarchar(50), @password nvarchar(50)
as
begin try 
	update Instructor
	set [password] = @password
	where [userName] = @username;
end try 
begin catch
	select 'ERROR:Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[updateInsUserNameSP]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[updateInsUserNameSP] @oldUsername nvarchar(50), @newUsername nvarchar(50)
as
begin try
	update Instructor
	set [userName] = @newUsername
	where [userName] = @oldUsername;
end try
begin catch
	select 'ERROR:Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[updateIntakeSP]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[updateIntakeSP] @intakeId int, @new_intake_name varchar(20)
as
begin try
	update Intake
	set  [intake_name]= @new_intake_name
	where [intake_id] = @intakeId;
end try
begin catch
	select 'ERROR:Not Existed Value'
end catch
GO
/****** Object:  StoredProcedure [dbo].[UpdateQuestions]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   create PROC [dbo].[UpdateQuestions] @QuesID INT, @QuesText NVARCHAR(700), @QuesType VARCHAR(3), @QuesAnswer VARCHAR(1),@QueDegree int, @QuesCrsID INT
AS
   begin try
	UPDATE [dbo].[question]
	SET  [Qtext]=@QuesText , [Qtype] =@QuesType, [correct_answer]= @QuesAnswer, [degree]=@QueDegree , [CrsId]= @QuesCrsID
	WHERE [Qid] = @QuesID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED Value'
   end catch
GO
/****** Object:  StoredProcedure [dbo].[updatestudent]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   create proc [dbo].[updatestudent] @StID INT, @intackid int, @trackid int, @Name VARCHAR(20), @gender VARCHAR(20), @username varchar(150), @password NVARCHAR(150)
AS
   begin try
	UPDATE student 
	SET  [intake_id]= @intackid ,[track_id]=@trackid , [name] = @Name, [gender]=@gender,username =@username , password =@password
	WHERE st_id = @StID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED Value'
   end catch
GO
/****** Object:  StoredProcedure [dbo].[updatestudent_exam]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[updatestudent_exam] @exam_id int , @StId int , @strart time , @end time , @Date_exam datetime 

  as 
  begin try 
  update [dbo].[student_exam] set StartTime =@strart , Endtime =@end ,Date_Exam =@Date_exam
  where exam_id =@exam_id and student_id =@StId
  end try 
  begin catch 
  select 'Error : NOT EXISTED Value'
  end catch
GO
/****** Object:  StoredProcedure [dbo].[updatestudentanswer]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create PROC [dbo].[updatestudentanswer] @StID INT, @ExID INT, @QuesID INT, @Answer VARCHAR(1),@iscorrect bit
AS
   begin try
	UPDATE [dbo].[student_answers]
	SET student_answer = @Answer, Iscorrect = @iscorrect	
	WHERE student_id = @StID AND exam_id = @ExID AND question_id = @QuesID
	  end try
   begin catch
	  select 'ERROR: NOT EXISTED Value'
   end catch
GO
/****** Object:  StoredProcedure [dbo].[updatetrack]    Script Date: 1/10/2024 3:15:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updatetrack] @track_id int , @Name varchar(100)
   as 
  begin try
 update  [dbo].[track] 
  set track_name = @Name
  where track_id= @track_id
  end try 
  begin catch
  select 'Error:NOT EXISTED Value '
  end catch 
GO
USE [master]
GO
ALTER DATABASE [OnlineExame] SET  READ_WRITE 
GO
