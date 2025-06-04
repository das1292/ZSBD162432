DECLARE
  CURSOR c_pracownicy(p_min NUMBER, p_max NUMBER, p_fragment VARCHAR2) IS
    SELECT first_name, last_name, salary
    FROM employees
    WHERE salary BETWEEN p_min AND p_max
      AND LOWER(first_name) LIKE LOWER(p_fragment || '%');

BEGIN
  DBMS_OUTPUT.PUT_LINE('Zakres 1000–5000 z "a":');
  FOR rec IN c_pracownicy(1000, 5000, 'a') LOOP
    DBMS_OUTPUT.PUT_LINE(rec.first_name || ' ' || rec.last_name || ' (' || rec.salary || ')');
  END LOOP;

  DBMS_OUTPUT.PUT_LINE(CHR(10) || 'Zakres 5000–20000 z "u":');
  FOR rec IN c_pracownicy(5000, 20000, 'u') LOOP
    DBMS_OUTPUT.PUT_LINE(rec.first_name || ' ' || rec.last_name || ' (' || rec.salary || ')');
  END LOOP;
END;
/
