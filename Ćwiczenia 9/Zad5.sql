CREATE OR REPLACE PACKAGE pkg_auto_update AS
  PROCEDURE fix_phone_format(p_employee_id NUMBER);
  PROCEDURE raise_salary_by_job(p_job_id VARCHAR2, p_percent NUMBER);
END pkg_auto_update;
/

CREATE OR REPLACE PACKAGE BODY pkg_auto_update AS

  PROCEDURE fix_phone_format(p_employee_id NUMBER) IS
    v_phone VARCHAR2(50);
    v_new_phone VARCHAR2(50);
  BEGIN
    SELECT phone_number INTO v_phone FROM employees WHERE employee_id = p_employee_id;

    v_new_phone := REGEXP_REPLACE(v_phone, '[^0-9]', '');
    UPDATE employees SET phone_number = v_new_phone WHERE employee_id = p_employee_id;
  END;

  PROCEDURE raise_salary_by_job(p_job_id VARCHAR2, p_percent NUMBER) IS
  BEGIN
    UPDATE employees
    SET salary = salary + salary * (p_percent / 100)
    WHERE job_id = p_job_id;
  END;

END pkg_auto_update;