--REPLACE, TRANSLATE 비교
SELECT REPLACE('나는 너를 모르는데 너는 나를 알겠는가?', '나는', '너를')   AS REPLACE,
       TRANSLATE('나는 너를 모르는데 너는 나를 알겠는가?', '나는', '너를') AS TRANSLATE
FROM DUAL;

--날짜함수
SELECT SYSDATE, SYSTIMESTAMP
FROM DUAL;

SELECT LAST_DAY(SYSDATE)
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, '금요일')
FROM DUAL;


--NULL관련 함수

--NVL(expr1, expr2), NVL2(expr1, expr2, expr3)
SELECT NVL(manager_id, employee_id)
FROM employees
WHERE manager_id IS NULL;
-- COALESCE(expr1, expr2, ...)
SELECT employee_id, salary, COMMISSION_PCT, COALESCE(salary * COMMISSION_PCT, SALARY) AS salary2
FROM EMPLOYEES;
--LNNVL : 매개변수로 들어오는 조건의 결과가 TRUE이면 FALSE, FALSE나 UNKNOWN이면 TRUE를 반환하므로 조건을 반대로 줌
SELECT COUNT(*)
FROM EMPLOYEES
WHERE LNNVL(COMMISSION_PCT >= 0.2); --(commission_pct < 0.2)
--NULLIF(expr1, expr2) : expr1과 expr2가 같으면 NULL, 같지 않으면 expr1 반환
SELECT EMPLOYEE_ID,
       TO_CHAR(start_date, 'yyyy')                                    start_year,
       TO_CHAR(end_date, 'yyyy')                                      end_year,
       NULLIF(TO_CHAR(end_date, 'yyyy'), TO_CHAR(start_date, 'yyyy')) nullif_year
FROM JOB_HISTORY;


--기타 함수
SELECT GREATEST(1, 2, 3, 4),
       LEAST(1, 2, 3, 4)
FROM DUAL;