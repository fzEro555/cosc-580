use NotAP;
SELECT DISTINCT a.* 
FROM personnel a, personnel_project b 
WHERE b.evaluation = 0 
AND a.employee_number=b.employee_number;