CREATE VIEW E_TARGET1
AS
SELECT
E.EMPLOYEE_ID,
E.FIRST_NAME,
E.LAST_NAME,
D.DEPARTMENT_NAME,
E.SALARY,
NVL(COMMISSION_PCT,0) AS COMMISION_PCT, --nvl used to replace null to 0--
CASE WHEN COMMISSION_PCT IS NULL THEN SALARY --if commisson_pct is null then show salary
ELSE SALARY*12 --if commission_pct is not null the n show total salary
END AS TOTAL_SALARY,
J.JOB_TITLE,
L.CITY,
C.COUNTRY_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
JOIN JOBS J USING(JOB_ID)
JOIN LOCATIONS L ON L.LOCATION_ID=D.LOCATION_ID
JOIN COUNTRIES C ON C.COUNTRY_ID=L.COUNTRY_ID;

SELECT * FROM E_TARGET1;
