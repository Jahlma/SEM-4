
/* QUERY 1*/
SELECT
    course_code AS "Course Code",
    course_instance_id AS "Course Instance ID",
    hp AS "HP",
    study_period AS "Period",
    num_students AS "# Students",

    SUM(CASE WHEN activity_name = 'LECTURE' THEN effective_hours ELSE 0 END) AS "Lecture Hours",
    SUM(CASE WHEN activity_name = 'Tutorial' THEN effective_hours ELSE 0 END) AS "Tutorial Hours",
    SUM(CASE WHEN activity_name = 'LAB' THEN effective_hours ELSE 0 END) AS "Lab Hours",
    SUM(CASE WHEN activity_name = 'SEMINAR' THEN effective_hours ELSE 0 END) AS "Seminar Hours",
    SUM(CASE WHEN activity_name = 'Other Overhead' THEN effective_hours ELSE 0 END) AS "Other Overhead Hours",
    SUM(CASE WHEN activity_name = 'Administration' THEN effective_hours ELSE 0 END) AS "Admin",
    SUM(CASE WHEN activity_name = 'Examination' THEN effective_hours ELSE 0 END) AS "Exam",

    SUM(effective_hours) AS "Total Hours"
FROM planned_hours_view
GROUP BY
    course_code,
    course_instance_id,
    hp,
    study_period,
    num_students
ORDER BY
    study_period,
    course_instance_id;


/* QUERY 2*/
SELECT
    course_code AS "Course Code",
    course_instance_id AS "Course Instance ID",
    hp AS "HP",
    study_period AS "Period",
    teacher_name AS "Teacher's Name",

    SUM(CASE WHEN activity_name = 'LECTURE' THEN effective_hours ELSE 0 END) AS "Lecture Hours",
    SUM(CASE WHEN activity_name = 'Tutorial' THEN effective_hours ELSE 0 END) AS "Tutorial Hours",
    SUM(CASE WHEN activity_name = 'LAB' THEN effective_hours ELSE 0 END) AS "Lab Hours",
    SUM(CASE WHEN activity_name = 'SEMINAR' THEN effective_hours ELSE 0 END) AS "Seminar Hours",
    SUM(CASE WHEN activity_name = 'Other Overhead' THEN effective_hours ELSE 0 END) AS "Other Overhead Hours",
    SUM(CASE WHEN activity_name = 'Administration' THEN effective_hours ELSE 0 END) AS "Admin",
    SUM(CASE WHEN activity_name = 'Examination' THEN effective_hours ELSE 0 END) AS "Exam",

    SUM(effective_hours) AS "Total Hours"
FROM planned_teacher_hours_view
GROUP BY
    course_code,
    course_instance_id,
    hp,
    study_period,
    teacher_name
ORDER BY
    course_instance_id,
    teacher_name;


/* QUERY 3*/
SELECT
    course_code AS "Course Code",
    course_instance_id AS "Course Instance ID",
    hp AS "HP",
    study_period AS "Period",
    teacher_name AS "Teacher's Name",

    SUM(CASE WHEN activity_name = 'LECTURE' THEN effective_hours ELSE 0 END) AS "Lecture Hours",
    SUM(CASE WHEN activity_name = 'Tutorial' THEN effective_hours ELSE 0 END) AS "Tutorial Hours",
    SUM(CASE WHEN activity_name = 'LAB' THEN effective_hours ELSE 0 END) AS "Lab Hours",
    SUM(CASE WHEN activity_name = 'SEMINAR' THEN effective_hours ELSE 0 END) AS "Seminar Hours",
    SUM(CASE WHEN activity_name = 'Other Overhead' THEN effective_hours ELSE 0 END) AS "Other Overhead Hours",
    SUM(CASE WHEN activity_name = 'Administration' THEN effective_hours ELSE 0 END) AS "Admin",
    SUM(CASE WHEN activity_name = 'Examination' THEN effective_hours ELSE 0 END) AS "Exam",

    SUM(effective_hours) AS "Total"
FROM planned_teacher_hours_view
WHERE employment_id = '7487'   
GROUP BY
    course_code,
    course_instance_id,
    hp,
    study_period,
    teacher_name
ORDER BY
    study_period,
    course_instance_id;


/* QUERY 4*/
  
SELECT
    employment_id AS "Employment ID",
    teacher_name AS "Teacher's Name",
    study_period AS "Period",
    COUNT(DISTINCT course_instance_id) AS "No of courses"
FROM planned_teacher_hours_view
WHERE study_period = 'P4'     
GROUP BY
    employment_id,
    teacher_name,
    study_period
HAVING
    COUNT(DISTINCT course_instance_id) > 1
ORDER BY
    "No of courses" DESC;
