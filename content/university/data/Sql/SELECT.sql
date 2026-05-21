SELECT SUM(F.total_records) AS total_records
FROM (

    SELECT COUNT(*) AS total_records
    FROM university.faculties

    UNION ALL

    SELECT COUNT(*) AS total_records
    FROM university.programs

    UNION ALL

    SELECT COUNT(*) AS total_records
    FROM university.courses

    UNION ALL

    SELECT COUNT(*) AS total_records
    FROM university.users

    UNION ALL

    SELECT COUNT(*) AS total_records
    FROM university.roles

    UNION ALL

    SELECT COUNT(*) AS total_records
    FROM university.programs_courses

    UNION ALL

    SELECT COUNT(*) AS total_records
    FROM university.programs_students

    UNION ALL

    SELECT COUNT(*) AS total_records
    FROM university.buildings

    UNION ALL

    SELECT COUNT(*) AS total_records
    FROM university.classrooms

    UNION ALL

    SELECT COUNT(*) AS total_records
    FROM university.schedules

    UNION ALL

    SELECT COUNT(*) AS total_records
    FROM university.enrollments

    UNION ALL

    SELECT COUNT(*) AS total_records
    FROM university.course_offerings

) AS F;