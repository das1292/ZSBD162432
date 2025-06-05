CREATE PROCEDURE avg_salary_by_manager(
    p_manager_id NUMBER,
    p_avg_salary OUT NUMBER
) AS
BEGIN
    SELECT AVG(salary)
    INTO p_avg_salary
    FROM employees
    WHERE manager_id = p_manager_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_avg_salary := 0;
    WHEN OTHERS THEN
        NULL;
END;