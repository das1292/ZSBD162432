CREATE OR REPLACE TRIGGER trg_prevent_salary_update
BEFORE UPDATE ON jobs
FOR EACH ROW
BEGIN
    IF :NEW.min_salary != :OLD.min_salary OR :NEW.max_salary != :OLD.max_salary THEN
        :NEW.min_salary := :OLD.min_salary;
        :NEW.max_salary := :OLD.max_salary;
    END IF;
END;