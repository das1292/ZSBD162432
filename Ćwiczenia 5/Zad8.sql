DECLARE
  CURSOR c_osoby IS
    SELECT e.last_name, e.salary
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    WHERE d.department_id = 50;

BEGIN
  FOR rec IN c_osoby LOOP
    IF rec.salary > 3100 THEN
      DBMS_OUTPUT.PUT_LINE(rec.last_name || ': nie dawać podwyżki');
    ELSE
      DBMS_OUTPUT.PUT_LINE(rec.last_name || ': dać podwyżkę');
    END IF;
  END LOOP;
END;
/
