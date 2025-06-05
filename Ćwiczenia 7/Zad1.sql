CREATE FUNCTION get_job_title(
    p_job_id VARCHAR2
) RETURN VARCHAR2 AS
    v_title VARCHAR2(100);
BEGIN
    SELECT job_title INTO v_title FROM jobs WHERE job_id = p_job_id;
    RETURN v_title;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20010, 'Praca o podanym ID nie istnieje.');
END;