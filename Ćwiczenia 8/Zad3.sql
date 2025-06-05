CREATE SEQUENCE seq_employee_id START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_auto_employee_id
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF :NEW.employee_id IS NULL THEN
        SELECT seq_employee_id.NEXTVAL INTO :NEW.employee_id FROM dual;
    END IF;
END;