DECLARE
  CURSOR c_kraje(p_region_id NUMBER) IS
    SELECT country_name,
           (SELECT COUNT(*) FROM employees e
            JOIN departments d ON e.department_id = d.department_id
            WHERE d.location_id IN (
              SELECT location_id FROM locations WHERE country_id = c.country_id)
           ) AS liczba_prac
    FROM countries c
    WHERE region_id = p_region_id;

BEGIN
  FOR rec IN c_kraje(1) LOOP
    DBMS_OUTPUT.PUT_LINE('Kraj: ' || rec.country_name || ', Pracownicy: ' || rec.liczba_prac);
  END LOOP;
END;
/
