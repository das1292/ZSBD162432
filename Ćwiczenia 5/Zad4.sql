DECLARE
  kraj countries%ROWTYPE;
BEGIN
  SELECT * INTO kraj
  FROM countries
  WHERE country_id = 'CA';

  DBMS_OUTPUT.PUT_LINE('Kraj: ' || kraj.country_name || ', Region: ' || kraj.region_id);
END;
/
