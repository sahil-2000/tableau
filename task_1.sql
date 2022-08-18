-- Create a visualization that provides a breakdown between the male and female employees working in the company each year, starting from 1990. 
use employees_mod;
SELECT year(de.from_date) as cal_year,e.gender,count(e.emp_no) as num_of_employees
from t_employees e inner join t_dept_emp de 
on e.emp_no=de.emp_no
group by cal_year,e.gender
having cal_year>1990
order by cal_year;