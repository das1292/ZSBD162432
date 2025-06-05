CREATE FUNCTION capitalize_ends(
    p_str VARCHAR2
) RETURN VARCHAR2 AS
    v_len NUMBER := LENGTH(p_str);
    v_result VARCHAR2(4000);
BEGIN
    IF v_len = 0 THEN
        RETURN NULL;
    ELSIF v_len = 1 THEN
        RETURN UPPER(p_str);
    ELSE
        v_result := UPPER(SUBSTR(p_str,1,1)) || LOWER(SUBSTR(p_str,2,v_len-2)) || UPPER(SUBSTR(p_str,v_len,1));
        RETURN v_result;
    END IF;
END;