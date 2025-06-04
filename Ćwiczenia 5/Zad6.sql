DECLARE
  rekord jobs%ROWTYPE;
BEGIN
  SELECT * INTO rekord
  FROM jobs
  WHERE max_salary = (SELECT MAX(max_salary) FROM jobs);

  DBMS_OUTPUT.PUT_LINE('Najlepiej płatne stanowisko: ' || rekord.job_title ||
                       ' (max_salary: ' || rekord.max_salary || ')');
END;
/
