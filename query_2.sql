use NotAP;
SELECT b.employee_number, b.name  
FROM corporate_officer a, personnel b 
WHERE b.home_address = 'Chevy Chase, Maryland'
AND a.employee_number = b.employee_number;