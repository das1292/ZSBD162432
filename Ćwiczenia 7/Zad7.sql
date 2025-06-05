CREATE FUNCTION generate_access_id(
    p_last_name VARCHAR2,
    p_phone VARCHAR2,
    p_first_name VARCHAR2
) RETURN VARCHAR2 AS
    v_part1 VARCHAR2(3);
    v_part2 VARCHAR2(4);
    v_part3 VARCHAR2(1);
BEGIN
    v_part1 := SUBSTR(UPPER(p_last_name),1,3);


    v_part2 := SUBSTR(REGEXP_REPLACE(p_phone,'\D','','g'), -4);

    v_part3 := SUBSTR(UPPER(p_first_name),1,1);

    RETURN v_part1 || v_part2 || v_part3;
END;