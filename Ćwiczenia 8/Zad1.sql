CREATE TABLE archiwum_departamentow (
    id NUMBER,
    nazwa VARCHAR2(100),
    data_zamkniecia DATE,
    ostatni_manager VARCHAR2(200)
);

CREATE OR REPLACE TRIGGER trg_after_delete_department
AFTER DELETE ON departments
FOR EACH ROW
DECLARE
    v_manager_name VARCHAR2(200);
BEGIN
    SELECT first_name || ' ' || last_name
    INTO v_manager_name
    FROM employees
    WHERE employee_id = :OLD.manager_id;

    INSERT INTO archiwum_departamentow (id, nazwa, data_zamkniecia, ostatni_manager)
    VALUES (:OLD.department_id, :OLD.department_name, SYSDATE, v_manager_name);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO archiwum_departamentow (id, nazwa, data_zamkniecia, ostatni_manager)
        VALUES (:OLD.department_id, :OLD.department_name, SYSDATE, 'Brak managera');
END;