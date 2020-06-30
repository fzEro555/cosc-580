use NotAP;
SELECT b.*, a.work_address 
FROM personnel a, loan b 
WHERE b.amount > 1000000 
AND b.authorized_employee_number = a.employee_number;