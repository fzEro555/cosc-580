use NotAP;
SELECT project.project_id, project.project_name 
FROM project 
WHERE project.earn - project.cost > 0;