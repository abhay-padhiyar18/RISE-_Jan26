
-- Designing a Student Assessment Management System for an analytics training institute.

--Int_ID : Int_1042
--Name : Abhay Padhiyar


CREATE DATABASE StudentDb
USE StudentDb

CREATE TABLE Student_Assessments (
    assessment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    student_name VARCHAR(50) NOT NULL,
    course_name VARCHAR(50) NOT NULL,
    assessment_type VARCHAR(20),
    assessment_date DATE NOT NULL,
    total_marks INT,
    obtained_marks INT,
    attendance_status VARCHAR(10),
    trainer_name VARCHAR(50),
    remarks VARCHAR(100)
)


Select * from Student_Assessments

INSERT INTO Student_Assessments VALUES

(1, 101, 'Rahul', 'MERN Stack', 'Quiz', '2024-01-10', 50, 42, 'Present', 'Amit Patel', 'Good'),
(2, 101, 'Rahul', 'MERN Stack', 'Assignment', '2024-01-15', 100, 85, 'Present', 'Amit Patel', 'Well done'),
(3, 101, 'Rahul', 'MERN Stack', 'Exam', '2024-02-01', 100, 78, 'Present', 'Amit Patel', 'Satisfactory'),
(4, 102, 'Priya', 'MERN Stack', 'Quiz', '2024-01-10', 50, 0, 'Absent', 'Amit Patel', 'Absent'),
(5, 102, 'Priya', 'MERN Stack', 'Assignment', '2024-01-15', 100, 88, 'Present', 'Amit Patel', 'Excellent'),
(6, 102, 'Priya', 'MERN Stack', 'Exam', '2024-02-01', 100, 91, 'Present', 'Amit Patel', 'Outstanding'),
(7, 103, 'Amit', 'Python', 'Quiz', '2024-01-12', 50, 35, 'Present', 'Neha Shah', 'Average'),
(8, 103, 'Amit', 'Python', 'Assignment', '2024-01-18', 100, 70, 'Present', 'Neha Shah', 'Needs improvement'),
(9, 103, 'Amit', 'Python', 'Exam', '2024-02-05', 100, 0, 'Absent', 'Neha Shah', 'Absent'),
(10, 104, 'Sneha', 'Data Science', 'Quiz', '2024-01-14', 50, 46, 'Present', 'Ravi Mehta', 'Very good'),
(11, 104, 'Sneha', 'Data Science', 'Project', '2024-01-25', 100, 92, 'Present', 'Ravi Mehta', 'Excellent work'),
(12, 104, 'Sneha', 'Data Science', 'Exam', '2024-02-10', 100, 89, 'Present', 'Ravi Mehta', 'Strong performance'),
(13, 105, 'Karan', 'Java Full Stack', 'Quiz', '2024-01-16', 50, 28, 'Present', 'Pooja Nair', 'Weak basics'),
(14, 105, 'Karan', 'Java Full Stack', 'Assignment', '2024-01-22', 100, 60, 'Present', 'Pooja Nair', 'Improving'),
(15, 105, 'Karan', 'Java Full Stack', 'Exam', '2024-02-12', 100, 0, 'Absent', 'Pooja Nair', 'Absent'),
(16, 106, 'Anjali', 'Web Development', 'Quiz', '2024-01-11', 50, 44, 'Present', 'Suresh Rao', 'Good'),
(17, 106, 'Anjali', 'Web Development', 'Assignment', '2024-01-20', 100, 90, 'Present', 'Suresh Rao', 'Very good'),
(18, 106, 'Anjali', 'Web Development', 'Project', '2024-02-08', 100, 95, 'Present', 'Suresh Rao', 'Excellent'),
(19, 107, 'Vishal', 'DevOps', 'Quiz', '2024-01-13', 50, 0, 'Absent', 'Arjun Malhotra', 'Absent'),
(20, 107, 'Vishal', 'DevOps', 'Assignment', '2024-01-21', 100, 72, 'Present', 'Arjun Malhotra', 'Good effort'),
(21, 107, 'Vishal', 'DevOps', 'Exam', '2024-02-15', 100, 68, 'Present', 'Arjun Malhotra', 'Average'),
(22, 108, 'Neeraj', 'Cyber Security', 'Quiz', '2024-01-17', 50, 40, 'Present', 'Rohit Jain', 'Good'),
(23, 108, 'Neeraj', 'Cyber Security', 'Exam', '2024-02-18', 100, 84, 'Present', 'Rohit Jain', 'Strong'),
(24, 109, 'Pooja', 'AI & ML', 'Assignment', '2024-01-28', 100, 0, 'Absent', 'Kunal Verma', 'Absent'),
(25, 109, 'Pooja', 'AI & ML', 'Exam', '2024-02-20', 100, 88, 'Present', 'Kunal Verma', 'Good');

INSERT INTO Student_Assessments
(assessment_id, student_id, student_name, course_name, assessment_type,
 assessment_date, total_marks, obtained_marks, attendance_status, trainer_name, remarks)
VALUES
(26, 110, 'Abhay Padhiyar', 'Full Stack', 'Exam', '2024-02-18', 100, 100, 'Present', 'Kunal Verma', 'Strong');

SELECT * FROM Student_Assessments


--1. Display records with obtained marks > 70%.
SELECT * FROM Student_Assessments 
WHERE obtained_marks > 40

--2. Students scoring full marks.
SELECT * FROM Student_Assessments 
WHERE obtained_marks = total_marks

--3. Absent students.
SELECT * FROM Student_Assessments 
WHERE attendance_status = 'Absent'

--4. Marks between 40 and 60.
SELECT * FROM Student_Assessments 
WHERE obtained_marks BETWEEN 40 AND 60

--5. Assessments after 1 Jan 2024.
SELECT * FROM Student_Assessments 
WHERE assessment_date > '2024-01-01'

--6. Assessments not by Rahul Sharma.
SELECT * FROM Student_Assessments 
WHERE student_name <> 'Rahul'

--7. Power BI Project assessments.
Select * from Student_Assessments
Where course_name = 'Full Stack'
AND assessment_type ='Exam'

--8. SQL or Azure course records.
SELECT * FROM Student_Assessments WHERE course_name IN  ('PYTHON','Data Science'); 

--9. Students not absent.
SELECT * FROM Student_Assessments WHERE attendance_status <> 'Absent'

--10. Marks <50 and present.
SELECT * FROM Student_Assessments WHERE obtained_marks < 50 AND attendance_status = 'Present'

--11. Names starting with A.
SELECT * FROM Student_Assessments WHERE student_name LIKE 'A%'

--12. Trainers containing 'an'.
SELECT * FROM Student_Assessments WHERE trainer_name LIKE '%ra%'

--13. Courses ending with BI.
SELECT * FROM Student_Assessments WHERE course_name LIKE '%ck'

--14. Remarks containing 'late'.
SELECT * FROM Student_Assessments WHERE remarks LIKE '%late%'

--15. Calculate percentage
SELECT student_name, student_id, (obtained_marks  * 100.0 / total_marks) AS percentage FROM Student_Assessments

--16. Failed students (<40%).
SELECT student_name AS 'Failed Students' FROM Student_Assessments WHERE (obtained_marks  * 100.0 / total_marks) < 40

--17. Grace marks for 35–39.
SELECT assessment_id, 
       student_name,  
       obtained_marks, 
      (obtained_marks + 5) AS 'Grace Marks'  
FROM Student_Assessments 
WHERE obtained_marks BETWEEN 35 AND 39

--18. Add 5% marks to quizzes (display).
SELECT assessment_id, 
       student_name, 
       obtained_marks, 
       (obtained_marks + (obtained_marks * 0.05)) AS 'Increased Marks by 5%'  
       FROM Student_Assessments 
       WHERE assessment_type = 'quiz' 

--19. Average marks per course.

SELECT course_name, (SUM(obtained_marks) * 100.0 / SUM(total_marks)) AS 'Course Average Percentage' 
FROM Student_Assessments 
GROUP BY course_name

--20. Max & Min per assessment type.
SELECT assessment_type, MAX(obtained_marks) AS 'Max Marks', MIN(obtained_marks) AS 'Min Marks' 
FROM Student_Assessments 
GROUP BY assessment_type

--21. Total absents per course.
SELECT course_name, COUNT(*) AS 'Total Absents' 
FROM Student_Assessments 
WHERE attendance_status = 'Absent' 
GROUP BY course_name

--22. Total assessments per trainer.
SELECT trainer_name, COUNT(*) AS 'Total Assessments' 
FROM Student_Assessments 
GROUP BY trainer_name

--23. Pass count per course.
SELECT course_name, COUNT(*) AS 'Passed Students' 
FROM Student_Assessments 
WHERE (obtained_marks * 100.0 / total_marks) >= 40 
GROUP BY course_name

--24. Trainers with >5 assessments.
SELECT trainer_name, COUNT(*) AS 'Total Assessments' 
FROM Student_Assessments 
GROUP BY trainer_name 
HAVING COUNT(*) > 5

--25. Students with >3 assessments.

SELECT student_name, COUNT(*) AS 'Total Assessments' 
FROM Student_Assessments 
GROUP BY student_name 
HAVING COUNT(*) > 1

--26. Courses with avg >65.
SELECT course_name, (SUM(obtained_marks) * 100.0 / SUM(total_marks)) AS 'Course Average Percentage' 
FROM Student_Assessments 
GROUP BY course_name 
HAVING (SUM(obtained_marks) * 100.0 / SUM(total_marks)) > 65

