CREATE PROCEDURE delete_job(
    p_job_id VARCHAR2
) AS
BEGIN
    DELETE FROM jobs WHERE job_id = p_job_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Nie usunięto żadnego stanowiska.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;