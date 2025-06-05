CREATE PROCEDURE add_job(
    p_job_id VARCHAR2,
    p_job_title VARCHAR2
) AS
BEGIN
    INSERT INTO jobs(job_id, job_title, min_salary, max_salary)
    VALUES (p_job_id, p_job_title, 2000, 5000);
EXCEPTION
    WHEN OTHERS THEN
        NULL; 
END;