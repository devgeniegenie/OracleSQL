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

