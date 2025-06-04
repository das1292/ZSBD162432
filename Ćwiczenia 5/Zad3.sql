BEGIN
  EXECUTE IMMEDIATE 'CREATE TABLE nowa_liczby (liczba VARCHAR2(10))';

  FOR i IN 1..10 LOOP
    IF i NOT IN (4, 6) THEN
      INSERT INTO nowa_liczby VALUES (TO_CHAR(i));
    END IF;
  END LOOP;

  COMMIT;
END;
/
