DECLARE
    vn_num1 number := 1;
    vn_num2 number := 2;
BEGIN
    IF vn_num1 >= vn_num2 THEN
        DBMS_OUTPUT.PUT_LINE(vn_num1 || '이 큰수');
    ELSE
        DBMS_OUTPUT.PUT_LINE(vn_num2 || '이 큰수');
    END IF;
END;
/