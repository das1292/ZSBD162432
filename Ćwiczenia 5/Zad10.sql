BEGIN
  EXECUTE IMMEDIATE '
    CREATE TABLE statystyki_menedzerow (
      manager_id NUMBER,
      liczba_podwladnych NUMBER,
      roznica_pensji NUMBER
    )';

  FOR rec IN (
    SELECT manager_id,
           COUNT(*) AS liczba_podwladnych,
           MAX(salary) - MIN(salary) AS roznica
    FROM employees
    WHERE manager_id IS NOT NULL
    GROUP BY manager_id
  ) LOOP
    INSERT INTO statystyki_menedzerow VALUES (rec.manager_id, rec.liczba_podwladnych, rec.roznica);
  END LOOP;

  COMMIT;
END;
/
