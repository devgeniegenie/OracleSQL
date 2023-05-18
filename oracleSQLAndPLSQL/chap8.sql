--PL/SQL 기본 구조
--sqlplus
SET SERVEROUTPUT ON
DECLARE
    vi_num NUMBER;
BEGIN
    vi_num := 100;
    DBMS_OUTPUT.PUT_LINE(vi_num);
END;
/

SET SERVEROUTPUT ON
SET TIMING ON
DECLARE
    vi_num NUMBER;
BEGIN
    vi_num := 100;

    DBMS_OUTPUT.PUT_LINE(vi_num);
END;
/

DECLARE
    a INTEGER := 2 ** 2 * 3 ** 2;
BEGIN

    DBMS_OUTPUT.PUT_LINE('a = ' || TO_CHAR(a));
END;
/

DECLARE
    vs_emp_name varchar2(80);
    vs_dep_name varchar2(80);
BEGIN
    SELECT a.emp_name, b.department_name
    INTO vs_emp_name, vs_dep_name
    FROM EMPLOYEES a,
         DEPARTMENTS b
    WHERE a.DEPARTMENT_ID = b.DEPARTMENT_ID
      AND a.EMPLOYEE_ID = 100;

    DBMS_OUTPUT.PUT_LINE(vs_emp_name || ' - ' || vs_dep_name);
END;
/

DECLARE
    vs_emp_name EMPLOYEES.emp_name%type;
    vs_dep_name DEPARTMENTS.department_name%type;
BEGIN
    SELECT a.emp_name, b.department_name
    INTO vs_emp_name, vs_dep_name
    FROM EMPLOYEES a,
         DEPARTMENTS b
    WHERE a.DEPARTMENT_ID = b.DEPARTMENT_ID
      AND a.EMPLOYEE_ID = 100;

    DBMS_OUTPUT.PUT_LINE(vs_emp_name || ' - ' || vs_dep_name);
END ;
/



CREATE TABLE ch08_varchar2
(
    VAR1 varchar2(4000)
);
INSERT INTO ch08_varchar2 (VAR1)
VALUES ('...');
COMMIT;

select * from ch08_varchar2;

DECLARE
    vs_sql_vharchar2   varchar2(4000);
    vs_plsql_vharchar2 varchar2(32767);
BEGIN
    --ch08_varchar2 테이블의 값을 변수에 담음
    SELECT VAR1 into vs_sql_vharchar2 FROM ch08_varchar2;

    --PL/SQL 변수에 4000BYTE 이상 크기의 값을 넣음
    vs_plsql_vharchar2 := vs_sql_vharchar2 || ' - ' || vs_sql_vharchar2 || ' - ' || vs_sql_vharchar2;

    DBMS_OUTPUT.PUT_LINE('SQL_VARCHAR2 길이 : ' || LENGTHB(vs_sql_vharchar2));
    DBMS_OUTPUT.PUT_LINE('PL_SQL VARCHAR2 길이 : ' || LENGTHB(vs_plsql_vharchar2));
END;
/
