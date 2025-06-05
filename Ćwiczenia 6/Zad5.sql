CREATE PROCEDURE add_employee(
    p_first_name VARCHAR2 DEFAULT 'Jan',
    p_last_name VARCHAR2 DEFAULT 'Kowalski',
    p_salary NUMBER DEFAULT 3000
) AS
    v_new_id NUMBER;
BEGIN
    IF p_salary > 20000 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Zarobki przekraczają 20000!');
    END IF;

    SELECT NVL(MAX(employee_id), 0) + 1 INTO v_new_id FROM employees;

    INSERT INTO employees(employee_id, first_name, last_name, salary, hire_date, job_id, department_id)
    VALUES (v_new_id, p_first_name, p_last_name, p_salary, SYSDATE, 'IT_PROG', 10);
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;