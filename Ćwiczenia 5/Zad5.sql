DECLARE
  rekord jobs%ROWTYPE;
BEGIN
  FOR rec IN (SELECT * FROM jobs WHERE LOWER(job_title) LIKE '%manager%') LOOP
    UPDATE jobs
    SET min_salary = min_salary * 1.05
    WHERE job_id = rec.job_id;

    DBMS_OUTPUT.PUT_LINE('Zaktualizowano: ' || rec.job_title);
  END LOOP;
END;
/
