// ============================================
// ACADEMIC MANAGEMENT SYSTEM - RECONSTRUCTED MODEL
// Source: Image analysis
// ============================================

// ============================================
// MÓDULO DE USUARIOS Y AUTORIZACIÓN
// ============================================

Table Roles {
  rol_id INT [primary key]
  name VARCHAR(45) [not null]
}

Table Users {
  user_id INT [primary key]
  name VARCHAR(45) [not null]
  last_name VARCHAR(45) [not null]
  semester INT
  rol_id INT [not null]
}

// ============================================
// ESTRUCTURA ACADÉMICA (FACULTADES Y PROGRAMAS)
// ============================================

Table Faculties {
  faculty_id INT [primary key]
  name VARCHAR(45) [not null]
}

Table Programs {
  program_id INT [primary key]
  name VARCHAR(45) [not null]
  faculty_id INT [not null]
}

// Relación de inscripciones de estudiantes a programas
Table Programs_studests {
  program_student_id INT [primary key]
  program_id INT [not null]
  user_id INT [not null]
}

// ============================================
// ESTRUCTURA ACADÉMICA (CURSOS Y PLANES)
// ============================================

Table Courses {
  course_id INT [primary key]
  name VARCHAR(45) [not null]
  faculty_id INT [not null]
}

// Tabla intermedia para el plan de estudios por semestre
Table Courses_programs {
  course_program INT [primary key]
  semester INT
  course_id INT [not null]
  program_id INT [not null]
}

// ============================================
// PLANIFICACIÓN Y HORARIOS
// ============================================

Table Schedule {
  schedule_id INT [primary key]
  start_time VARCHAR(45)
  end_time VARCHAR(45)
  day VARCHAR(45)
}

// Oferta académica específica (horario, salón, curso, cupo)
Table Course_calendar {
  course_calendar_id INT [primary key]
  quota INT
  classroom_id INT [not null]
  course_id INT [not null]
  schedule_id INT [not null]
}

// Registro de estudiantes en cursos específicos ofertados
Table Courses_students {
  course_student_id INT [primary key]
  course_calendar_course_calendar INT [not null]
  user_id INT [not null]
}

// ============================================
// MÓDULO DE INFRAESTRUCTURA
// ============================================

Table Buildings {
  building_id INT [primary key]
  name VARCHAR(45) [not null]
}

Table Classroms {
  classroom_id INT [primary key]
  name VARCHAR(45) [not null]
  building_id INT [not null]
}

// ============================================
// RELACIONES DEFINIDAS EN EL DIAGRAMA (IMAGEN)
// ============================================

// Relaciones de Usuarios y Roles
Ref: Users.rol_id > Roles.rol_id

// Relaciones Académicas
Ref: Programs.faculty_id > Faculties.faculty_id
Ref: Courses.faculty_id > Faculties.faculty_id

// Relaciones de la tabla intermedia Programs_studests
Ref: Programs_studests.program_id > Programs.program_id
Ref: Programs_studests.user_id > Users.user_id

// Relaciones de la tabla intermedia Courses_programs
Ref: Courses_programs.course_id > Courses.course_id
Ref: Courses_programs.program_id > Programs.program_id

// Relaciones de Infraestructura
Ref: Classroms.building_id > Buildings.building_id

// Relaciones de Planificación y Oferta (Course_calendar)
Ref: Course_calendar.course_id > Courses.course_id
Ref: Course_calendar.schedule_id > Schedule.schedule_id
Ref: Course_calendar.classroom_id > Classroms.classroom_id

// Relaciones de Inscripción de Estudiantes a Cursos
Ref: Courses_students.course_calendar_course_calendar > Course_calendar.course_calendar_id
Ref: Courses_students.user_id > Users.user_id