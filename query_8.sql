use NotAP;
SELECT a.employee_number, a.name 
FROM personnel a, personnel_project b, project c 
WHERE c.start_year <= 2018 
AND c.end_year >= 2018 
AND c.project_id = b.project_id
AND b.employee_number = a.employee_number 
GROUP BY b.employee_number 
HAVING count(b.employee_number) > 2;