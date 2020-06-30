use NotAP;
SELECT a.project_id, a.project_name 
FROM project a, corporate_officer_project b 
WHERE b.employee_number = '201901'
AND a.project_id = b.project_id; 
