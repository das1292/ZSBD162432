CREATE PROCEDURE get_employee_salary_name(
    p_employee_id NUMBER,
    p_salary OUT NUMBER,
    p_last_name OUT VARCHAR2
) AS
BEGIN
    SELECT salary, last_name
    INTO p_salary, p_last_name
    FROM employees
    WHERE employee_id = p_employee_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        NULL;
    WHEN OTHERS THEN
        NULL;
END;