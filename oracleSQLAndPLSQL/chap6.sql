--JOIN
--INNER JOIN
SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
FROM employees a,
     departments b
WHERE a.department_id = b.department_id;

SELECT department_id, department_name
FROM departments a
WHERE EXISTS(SELECT * FROM employees b WHERE a.department_id = b.department_id AND b.SALARY > 3000)
ORDER BY a.DEPARTMENT_NAME;

SELECT department_id, DEPARTMENT_NAME
FROM departments a
WHERE a.DEPARTMENT_ID IN (SELECT b.department_id FROM EMPLOYEES b WHERE b.SALARY > 3000)
ORDER BY DEPARTMENT_NAME;

SELECT a.department_id, a.DEPARTMENT_NAME
FROM DEPARTMENTS a,
     EMPLOYEES b
WHERE a.department_id = b.department_id
  AND b.SALARY > 3000
ORDER BY a.DEPARTMENT_NAME;

SELECT a.department_id, a.DEPARTMENT_NAME
FROM DEPARTMENTS a
         JOIN EMPLOYEES b ON a.DEPARTMENT_ID = b.DEPARTMENT_ID
WHERE a.department_id = b.department_id
  AND b.SALARY > 3000
ORDER BY a.DEPARTMENT_NAME;

--OUTER JOIN
SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM departments a,
     JOB_HISTORY b
WHERE a.department_id = b.department_id(+);

SELECT a.department_id, a.EMP_NAME, b.job_id, b.department_id
FROM EMPLOYEES a,
     JOB_HISTORY b
WHERE a.employee_id = b.EMPLOYEE_ID(+)
  AND a.department_id = b.department_id(+);

--ANSI
--비교
SELECT a.employee_id, a.emp_name, b.job_id, b.department_id
FROM EMPLOYEES a,
     JOB_HISTORY b
WHERE a.EMPLOYEE_ID = b.EMPLOYEE_ID (+)
  AND a.DEPARTMENT_ID = b.DEPARTMENT_ID(+);

SELECT a.employee_id, a.emp_name, b.job_id, b.department_id
FROM EMPLOYEES a
         LEFT OUTER JOIN JOB_HISTORY b
             ON (a.EMPLOYEE_ID = b.EMPLOYEE_ID AND a.department_id = b.DEPARTMENT_ID);

--서브쿼리
--연관성 없는 서브 쿼리
SELECT COUNT(*)
FROM employees
WHERE salary >= (SELECT AVG(salary) FROM employees);

SELECT COUNT(*)
FROM employees
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM departments WHERE PARENT_ID IS NULL);

SELECT employee_id, emp_name, job_id
FROM employees
WHERE (EMPLOYEE_ID, job_id) IN (SELECT employee_id, JOB_ID FROM JOB_HISTORY);
--연관성 있는 서브 쿼리
SELECT a.department_id, a.department_name
FROM DEPARTMENTS a
WHERE EXISTS(SELECT 1 FROM JOB_HISTORY b WHERE a.department_id = b.department_id);

SELECT a.employee_id,
       (SELECT b.emp_name FROM EMPLOYEES b WHERE a.employee_id = b.EMPLOYEE_ID)              AS emp_name,
       a.department_id,
       (SELECT b.department_name FROM departments b WHERE a.department_id = b.DEPARTMENT_ID) AS dep_name
FROM JOB_HISTORY a;

SELECT a.department_id, a.department_name
FROM departments a
WHERE EXISTS(SELECT 1
             FROM EMPLOYEES b
             WHERE a.department_id = b.DEPARTMENT_ID
               AND b.SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES));

SELECT department_id, AVG(SALARY)
FROM EMPLOYEES a
WHERE department_id IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE parent_id = 90)
GROUP BY department_id;

SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM EMPLOYEES a,
     departments b,
     (SELECT AVG(c.salary) AS avg_salary
      FROM departments b,
           employees c
      WHERE b.PARENT_ID = 90
        AND b.DEPARTMENT_ID = c.DEPARTMENT_ID) d
WHERE a.department_id = b.department_id
  AND a.salary > d.avg_salary;

