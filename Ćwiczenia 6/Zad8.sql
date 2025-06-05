CREATE PROCEDURE move_employee(
    p_employee_id NUMBER,
    p_new_dept_id NUMBER
) AS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM departments WHERE department_id = p_new_dept_id;
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20005, 'Nowy departament nie istnieje.');
    END IF;

    UPDATE employees
    SET department_id = p_new_dept_id
    WHERE employee_id = p_employee_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20006, 'Pracownik nie istnieje.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;