-- Compare the average salary of female versus male employees in the entire company until year 2002, and add a filter allowing you to see that per each department
use employees_mod;
SELECT 
    e.gender AS gender,
    dep.dept_name AS dept_name,
    ROUND(AVG(sa.salary), 2) AS avg_salary,
    YEAR(sa.from_date) AS calender_year
FROM
    t_salaries sa
        JOIN
    t_employees e ON sa.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON e.emp_no = de.emp_no
        JOIN
    t_departments dep ON de.dept_no = dep.dept_no
GROUP BY e.gender , de.dept_no , calender_year
HAVING calender_year <= 2002
ORDER BY calender_year;