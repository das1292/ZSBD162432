CREATE FUNCTION count_employees_departments(
    p_country_name VARCHAR2
) RETURN VARCHAR2 AS
    v_emp_count NUMBER;
    v_dept_count NUMBER;
BEGIN
    SELECT COUNT(DISTINCT e.employee_id), COUNT(DISTINCT d.department_id)
    INTO v_emp_count, v_dept_count
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    JOIN locations l ON d.location_id = l.location_id
    JOIN countries c ON l.country_id = c.country_id
    WHERE c.country_name = p_country_name;

    IF v_emp_count = 0 AND v_dept_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20011, 'Brak danych dla podanego kraju.');
    END IF;

    RETURN 'Employees: ' || v_emp_count || ', Departments: ' || v_dept_count;
EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;
END;