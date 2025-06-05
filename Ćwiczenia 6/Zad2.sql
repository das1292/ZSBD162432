CREATE PROCEDURE update_job_title(
    p_job_id VARCHAR2,
    p_new_title VARCHAR2
) AS
BEGIN
    UPDATE jobs
    SET job_title = p_new_title
    WHERE job_id = p_job_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nie zaktualizowano żadnego stanowiska.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;