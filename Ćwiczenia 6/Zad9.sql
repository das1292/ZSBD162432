CREATE PROCEDURE delete_department(
    p_dept_id NUMBER
) AS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM employees WHERE department_id = p_dept_id;

    IF v_count = 0 THEN
        DELETE FROM departments WHERE department_id = p_dept_id;
    ELSE
        RAISE_APPLICATION_ERROR(-20007, 'Departament ma przypisanych pracowników.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;