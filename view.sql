/*VIEW 1*/
  
SELECT
    pa.course_instance_id,
    cl.course_code,
    cl.hp,
    ci.study_period,
    ci.num_students,
    ta.activity_name,
    pa.planned_hours * ta.factor AS effective_hours
FROM planned_activity pa
JOIN course_instance ci
    ON pa.course_instance_id = ci.id
JOIN course_layout cl
    ON ci.course_layout_id = cl.id
JOIN teaching_activity ta
    ON pa.teaching_activity_id = ta.id
WHERE ci.study_year = '2025';


/* VIEW 2 */
CREATE OR REPLACE VIEW planned_teacher_hours_view AS
SELECT
    e.employment_id,
    p.first_name || ' ' || p.last_name AS teacher_name,
    pa.course_instance_id,
    cl.course_code,
    cl.hp,
    ci.study_period,
    ta.activity_name,
    pa.planned_hours * ta.factor AS effective_hours
FROM planned_activity_employee pae
JOIN planned_activity pa
    ON pae.planned_activity_id = pa.id
   AND pae.course_instance_id = pa.course_instance_id
JOIN employee e
    ON pae.employee_id = e.id
JOIN person p
    ON e.person_id = p.id
JOIN course_instance ci
    ON pa.course_instance_id = ci.id
JOIN course_layout cl
    ON ci.course_layout_id = cl.id
JOIN teaching_activity ta
    ON pa.teaching_activity_id = ta.id
WHERE ci.study_year = '2025';

