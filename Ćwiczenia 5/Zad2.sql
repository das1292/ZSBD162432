DECLARE
  numer_max NUMBER;
  nowy_id   NUMBER;
  nowy_nazwa departments.department_name%TYPE := 'EDUCATION';
BEGIN
  SELECT MAX(department_id) INTO numer_max FROM departments;
  nowy_id := numer_max + 10;

  INSERT INTO departments (department_id, department_name, location_id)
  VALUES (nowy_id, nowy_nazwa, 3000);

  DBMS_OUTPUT.PUT_LINE('Dodano department z location_id = 3000, ID: ' || nowy_id);
END;
/
