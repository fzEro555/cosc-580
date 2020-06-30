DROP DATABASE IF EXISTS NotAP;
CREATE DATABASE NotAP;
USE NotAP;


DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `building_id` int(11) NOT NULL,
  `building_name` varchar(45) NOT NULL,
  `building_address` varchar(45) NOT NULL,
  PRIMARY KEY (`building_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `building`  VALUES('1', 'Maguire Hall', 'Washington, DC 20007');
INSERT INTO `building`  VALUES('2', 'St Mary Hall', 'Washington, DC 20007');
INSERT INTO `building`  VALUES('3', 'Rosslyn Heights', '1860 N Scott St.');
INSERT INTO `building`  VALUES('4', '711', '1800 N Quinn St.');
INSERT INTO `building`  VALUES('5', 'McDonald', '1800 N Lynn St.');


DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `project_id` int(11) NOT NULL,
  `project_name` varchar(45) NOT NULL,
  `cost` int(20) NOT NULL,
  `earn` int(20) NOT NULL,
  `start_year` year(4) NOT NULL,
  `end_year` year(4) NOT NULL,
  `performance_rating` int(3) NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `project` VALUES('20190101', 'sun', '1000000', '1000001', '2017', '2019', '100');
INSERT INTO `project` VALUES('20190102', 'moon', '1000002', '1000001', '2016', '2017', '80');
INSERT INTO `project` VALUES('20190201', 'star', '900000', '1200000', '2017', '2018', '90');
INSERT INTO `project` VALUES('20190202', 'jupiter', '1000000', '1300000', '2018', '2019', '60');
INSERT INTO `project` VALUES('20190301', 'sun', '1000000', '900000', '2019', '2020', '91');


DROP TABLE IF EXISTS `personnel`;
CREATE TABLE `personnel` (
  `employee_number` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `work_address` varchar(45) DEFAULT NULL,
  `home_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employee_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `personnel` VALUES('201901', 'Xiao', '1234567890', 'Washington, DC 20007', 'Chevy Chase, Maryland');
INSERT INTO `personnel` VALUES('201903', 'Zhao', '2123434341', '1860 N Scott St.', '1760 S Lynn St.');
INSERT INTO `personnel` VALUES('201904', 'Lin', '8218888888', 'Washington, DC 20007', '1870 N Scott St.');
INSERT INTO `personnel` VALUES('201905', 'Chen', '1111111111', 'Washington, DC 20007', '1851 N Quinn St.');
INSERT INTO `personnel` VALUES('201906', 'Huang', '2222222222', '1800 N Lynn St.', '1600 Wilson BLVD');
INSERT INTO `personnel` VALUES('201802', 'Gong', '3333333333', '1800 N Lynn St.', 'Chevy Chase, Maryland');
INSERT INTO `personnel` VALUES('201703', 'He', '4444444444', '1800 N Quinn St.', '1600 Wilson BLVD');
INSERT INTO `personnel` VALUES('201604', 'Haoran', '5555555555', '1800 N Lynn St.', '1870 N Scott St.');


DROP TABLE IF EXISTS `corporate_financial`;
CREATE TABLE `corporate_financial` (
  `year` year(4) NOT NULL,
  `quarter_number` int(1) NOT NULL,
  `earnings` int(11) NOT NULL,
  `liabilities` int(11) NOT NULL,
  `payments_to_distributors` int(11) NOT NULL,
  `loans` int(11) NOT NULL,
  PRIMARY KEY (`year`,`quarter_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `corporate_financial` VALUES('2018', '1', '5000000', '1000000', '300000', '2000000');
INSERT INTO `corporate_financial` VALUES('2017', '2', '3000000', '2000000', '500000', '1000000');
INSERT INTO `corporate_financial` VALUES('2018', '2', '7000000', '3000000', '700000', '4000000');
INSERT INTO `corporate_financial` VALUES('2019', '1', '9000000', '4000000', '900000', '6000000');
INSERT INTO `corporate_financial` VALUES('2019', '2', '3000000', '500000', '100000', '900000');


DROP TABLE IF EXISTS `corporate_officer_manage_group`;
CREATE TABLE `corporate_officer_manage_group` (
  `employee_number` int(11) NOT NULL,
  `group_number` int(11) NOT NULL,
  PRIMARY KEY (`employee_number`,`group_number`),
  FOREIGN KEY (`employee_number`) REFERENCES `personnel` (`employee_number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `corporate_officer_manage_group` VALUES('201901', '1');
INSERT INTO `corporate_officer_manage_group` VALUES('201901', '2');
INSERT INTO `corporate_officer_manage_group` VALUES('201802', '2');
INSERT INTO `corporate_officer_manage_group` VALUES('201703', '3');
INSERT INTO `corporate_officer_manage_group` VALUES('201604', '4');


DROP TABLE IF EXISTS `corporate_officer_project`;
CREATE TABLE `corporate_officer_project` (
  `employee_number` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_number`,`project_id`),
  FOREIGN KEY (`employee_number`) REFERENCES `personnel` (`employee_number`) ON DELETE CASCADE,
  FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `corporate_officer_project` VALUES('201901', '20190101');
INSERT INTO `corporate_officer_project` VALUES('201901', '20190201');
INSERT INTO `corporate_officer_project` VALUES('201802', '20190102');
INSERT INTO `corporate_officer_project` VALUES('201703', '20190202');
INSERT INTO `corporate_officer_project` VALUES('201604', '20190301');


DROP TABLE IF EXISTS `corporate_officer`;
CREATE TABLE `corporate_officer` (
  `employee_number` int(11) NOT NULL,
  PRIMARY KEY (`employee_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `corporate_officer` VALUES('201901');
INSERT INTO `corporate_officer` VALUES('201802');
INSERT INTO `corporate_officer` VALUES('201703');
INSERT INTO `corporate_officer` VALUES('201604');


DROP TABLE IF EXISTS `distributor`;
CREATE TABLE `distributor` (
  `distributor_id` int(11) NOT NULL,
  `distributor_name` varchar(45) NOT NULL,
  PRIMARY KEY (`distributor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `distributor` VALUES('10001', 'Jack');
INSERT INTO `distributor` VALUES('10002', 'Mike');
INSERT INTO `distributor` VALUES('10003', 'Jane');
INSERT INTO `distributor` VALUES('10004', 'Mary');
INSERT INTO `distributor` VALUES('10005', 'Mark');


DROP TABLE IF EXISTS `employee_group`;
CREATE TABLE `employee_group` (
  `employee_number` int(11) NOT NULL,
  `group_number` int(11) NOT NULL,
  `responsibility` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employee_number`,`group_number`),
  FOREIGN KEY (`employee_number`) REFERENCES `personnel` (`employee_number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `employee_group` VALUES('201903', '1', 'Data analysis');
INSERT INTO `employee_group` VALUES('201903', '2', 'Marketing');
INSERT INTO `employee_group` VALUES('201904', '3', 'Coding');
INSERT INTO `employee_group` VALUES('201905', '1', 'Coding');
INSERT INTO `employee_group` VALUES('201906', '2', 'Marketing');

DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `equipment_id` int(11) NOT NULL,
  `equipment_name` varchar(45) NOT NULL,
  `equipment_age` varchar(45) NOT NULL,
  `equipment_shape` varchar(45) NOT NULL,
  `building_id` int(11) NOT NULL,
  PRIMARY KEY (`equipment_id`),
  FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `equipment` VALUES('11', 'car1', '1 year', 'good shape', '1');
INSERT INTO `equipment` VALUES('12', 'computer1', '5 months', 'good shape', '1');
INSERT INTO `equipment` VALUES('13', 'car2', '2 years', 'bad shape', '2');
INSERT INTO `equipment` VALUES('14', 'car3', '1 year', 'good shape', '3');
INSERT INTO `equipment` VALUES('15', 'computer2', '5 years', 'bad shape', '3');


DROP TABLE IF EXISTS `equipment_repairs`;
CREATE TABLE `equipment_repairs` (
  `equipment_id` int(11) NOT NULL,
  `repairs_record_id` int(11) NOT NULL,
  `record_report` varchar(45) NOT NULL,
  PRIMARY KEY (`equipment_id`,`repairs_record_id`),
  FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`equipment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `equipment_repairs` VALUES('11', '1', 'Repair the wheel');
INSERT INTO `equipment_repairs` VALUES('11', '2', 'Repair the break');
INSERT INTO `equipment_repairs` VALUES('12', '1', 'Repair the engine');
INSERT INTO `equipment_repairs` VALUES('13', '1', 'Repair the break');
INSERT INTO `equipment_repairs` VALUES('13', '2', 'Repair the engine');


DROP TABLE IF EXISTS `loan`;
CREATE TABLE `loan` (
  `loan_id` int(11) NOT NULL,
  `loan_name` varchar(45) NOT NULL,
  `amount` int(20) NOT NULL,
  `authorized_employee_number` int(11) NOT NULL,
  PRIMARY KEY (`loan_id`),
  FOREIGN KEY (`authorized_employee_number`) REFERENCES `personnel` (`employee_number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `loan` VALUES('111', 'name1', '1500000', '201901');
INSERT INTO `loan` VALUES('112', 'name2', '500000', '201802');
INSERT INTO `loan` VALUES('113', 'name3', '1100000', '201703');
INSERT INTO `loan` VALUES('114', 'name4', '900000', '201903');
INSERT INTO `loan` VALUES('115', 'name5', '700000', '201901');


DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `material_id` int(11) NOT NULL,
  `material_name` varchar(45) NOT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `material` VALUES('1111', 'graphic card');
INSERT INTO `material` VALUES('1112', 'cpu');
INSERT INTO `material` VALUES('1113', 'ssd');
INSERT INTO `material` VALUES('1114', 'power supply');
INSERT INTO `material` VALUES('1115', 'monitor');


DROP TABLE IF EXISTS `payments_to_distributors`;
CREATE TABLE `payments_to_distributors` (
  `payments_to_distributors_id` int(11) NOT NULL,
  `distributor_id` int(11) NOT NULL,
  `amount` int(20) NOT NULL,
  PRIMARY KEY (`payments_to_distributors_id`),
  FOREIGN KEY (`distributor_id`) REFERENCES `distributor` (`distributor_id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `payments_to_distributors` VALUES('1', '10001', '40000');
INSERT INTO `payments_to_distributors` VALUES('2', '10001', '50000');
INSERT INTO `payments_to_distributors` VALUES('3', '10002', '40000');
INSERT INTO `payments_to_distributors` VALUES('4', '10003', '60000');
INSERT INTO `payments_to_distributors` VALUES('5', '10004', '40000');


DROP TABLE IF EXISTS `personnel_dependants`;
CREATE TABLE `personnel_dependants` (
  `employee_number` int(11) NOT NULL,
  `dependent_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `relation` varchar(45) NOT NULL,
  PRIMARY KEY (`employee_number`,`dependent_id`),
  FOREIGN KEY (`employee_number`) REFERENCES `personnel` (`employee_number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `personnel_dependants` VALUES('201901', '1', 'Jenny', 'mother');
INSERT INTO `personnel_dependants` VALUES('201903', '1', 'Kane', 'father');
INSERT INTO `personnel_dependants` VALUES('201903', '2', 'Kale', 'son');
INSERT INTO `personnel_dependants` VALUES('201904', '1', 'May', 'mother');
INSERT INTO `personnel_dependants` VALUES('201905', '1', 'Danny', 'brother');
INSERT INTO `personnel_dependants` VALUES('201906', '1', 'Jeff', 'brother');
INSERT INTO `personnel_dependants` VALUES('201802', '1', 'Tom', 'father');
INSERT INTO `personnel_dependants` VALUES('201703', '1', 'Tina', 'sister');
INSERT INTO `personnel_dependants` VALUES('201604', '1', 'Tim', 'brother');


DROP TABLE IF EXISTS `personnel_project`;
CREATE TABLE `personnel_project` (
  `employee_number` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `position` varchar(45) NOT NULL,
  `evaluation` int(1) NOT NULL COMMENT '0:poor1:fair2:good3:great',
  PRIMARY KEY (`employee_number`,`project_id`),
  FOREIGN KEY (`employee_number`) REFERENCES `personnel` (`employee_number`) ON DELETE CASCADE,
  FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `personnel_project` VALUES('201901', '20190101', 'project manager', '3');
INSERT INTO `personnel_project` VALUES('201903', '20190101', 'software engineer', '2');
INSERT INTO `personnel_project` VALUES('201904', '20190201', 'project manager', '0');
INSERT INTO `personnel_project` VALUES('201905', '20190102', 'project manager', '2');
INSERT INTO `personnel_project` VALUES('201906', '20190202', 'developer', '1');
INSERT INTO `personnel_project` VALUES('201802', '20190301', 'project manager', '0');
INSERT INTO `personnel_project` VALUES('201703', '20190301', 'developer', '3');
INSERT INTO `personnel_project` VALUES('201604', '20190201', 'algorithm engineer', '3');
INSERT INTO `personnel_project` VALUES('201901', '20190201', 'algorithm engineer', '3');
INSERT INTO `personnel_project` VALUES('201901', '20190202', 'algorithm engineer', '3');


DROP TABLE IF EXISTS `project_material`;
CREATE TABLE `project_material` (
  `project_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`material_id`),
  FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE,
  FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `project_material` VALUES('20190101', '1111');
INSERT INTO `project_material` VALUES('20190101', '1112');
INSERT INTO `project_material` VALUES('20190102', '1113');
INSERT INTO `project_material` VALUES('20190201', '1114');
INSERT INTO `project_material` VALUES('20190202', '1115');
INSERT INTO `project_material` VALUES('20190301', '1111');



