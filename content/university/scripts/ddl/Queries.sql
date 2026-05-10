--Mostrar los estudiantes que vean los programas de Ingenieria de Sistemas y vayan en el 5to semestre

SELECT 
    university.users.first_name,
    university.users.last_name,
    university.programs.name AS program,
    university.programs_students.current_semester
FROM university.programs_students
JOIN university.programs
    ON university.programs_students.program_id = university.programs.program_id
JOIN university.users
    ON university.programs_students.user_id = university.users.user_id
WHERE university.programs.name = 'Ingeniería de Sistemas'
AND university.programs_students.current_semester = 5;


-- Obtener el nombre completo y correo de los profesores de la universidad

SELECT 
    university.users.first_name || ' ' || university.users.last_name AS full_name,
    university.users.email
FROM university.users
JOIN university.roles
    ON university.users.role_id = university.roles.role_id
WHERE university.roles.name = 'Professor';



--Listar los cursos que se dan en mas de una facultad


SELECT 
    university.courses.name AS course,
    COUNT(DISTINCT university.programs.faculty_id) AS faculties_count
FROM university.programs_courses
JOIN university.programs
    ON university.programs_courses.program_id = university.programs.program_id
JOIN university.courses
    ON university.programs_courses.course_id = university.courses.course_id
GROUP BY university.courses.name
HAVING COUNT(DISTINCT university.programs.faculty_id) > 1;