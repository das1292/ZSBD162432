CREATE FUNCTION pesel_to_date(
    p_pesel VARCHAR2
) RETURN DATE AS
    v_year NUMBER;
    v_month NUMBER;
    v_day NUMBER;
    v_century NUMBER;
    v_real_month NUMBER;
BEGIN
    IF LENGTH(p_pesel) <> 11 THEN
        RETURN NULL;
    END IF;

    v_year := TO_NUMBER(SUBSTR(p_pesel,1,2));
    v_month := TO_NUMBER(SUBSTR(p_pesel,3,2));
    v_day := TO_NUMBER(SUBSTR(p_pesel,5,2));

    IF v_month > 80 THEN
        v_century := 1800;
        v_real_month := v_month - 80;
    ELSIF v_month > 60 THEN
        v_century := 2200;
        v_real_month := v_month - 60;
    ELSIF v_month > 40 THEN
        v_century := 2100;
        v_real_month := v_month - 40;
    ELSIF v_month > 20 THEN
        v_century := 2000;
        v_real_month := v_month - 20;
    ELSE
        v_century := 1900;
        v_real_month := v_month;
    END IF;

    RETURN TO_DATE(TO_CHAR(v_century + v_year) || '-' || TO_CHAR(v_real_month,'FM00') || '-' || TO_CHAR(v_day,'FM00'), 'YYYY-MM-DD');
END;