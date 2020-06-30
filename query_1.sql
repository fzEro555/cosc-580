use NotAP;
SELECT DISTINCT a.employee_number, a.name 
FROM personnel a, personnel_project b, project c 
WHERE c.performance_rating >= 90 
AND b.project_id = c.project_id 
AND a.employee_number = b.employee_number;