CREATE PROCEDURE raise_salary_dept(
    p_department_id NUMBER,
    p_percent NUMBER
) AS
BEGIN
    UPDATE employees e
    SET salary = salary + salary * (p_percent / 100)
    WHERE department_id = p_department_id
      AND EXISTS (
        SELECT 1 FROM jobs j
        WHERE j.job_id = e.job_id
          AND salary + salary * (p_percent / 100) BETWEEN j.min_salary AND j.max_salary
    );

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Nie zaktualizowano żadnego wynagrodzenia.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
            NULL;
END;