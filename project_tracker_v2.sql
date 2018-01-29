-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 25, 2018 at 07:03 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_tracker_v2`
--

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
CREATE TABLE IF NOT EXISTS `agency` (
  `agency_id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(50) NOT NULL,
  `agency_address` tinytext NOT NULL,
  `agency_contact_name` varchar(30) NOT NULL,
  `account_no` int(30) NOT NULL,
  `bank_name` varchar(30) NOT NULL,
  `branch` varchar(30) NOT NULL,
  `pan` varchar(20) NOT NULL,
  `agency_contact_designation` varchar(50) NOT NULL,
  `agency_contact_number` varchar(20) NOT NULL,
  `agency_email_id` varchar(100) NOT NULL,
  PRIMARY KEY (`agency_id`),
  KEY `agency_id` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1980 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assembly_constituency`
--

DROP TABLE IF EXISTS `assembly_constituency`;
CREATE TABLE IF NOT EXISTS `assembly_constituency` (
  `assembly_constituency_id` int(11) NOT NULL AUTO_INCREMENT,
  `assembly_constituency` varchar(160) NOT NULL,
  PRIMARY KEY (`assembly_constituency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `bill_id` int(11) NOT NULL DEFAULT '0',
  `bill_number` int(30) NOT NULL,
  `date` date NOT NULL,
  `payment_id` int(11) NOT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
CREATE TABLE IF NOT EXISTS `budget` (
  `budget_id` int(11) NOT NULL AUTO_INCREMENT,
  `grant_id` int(11) NOT NULL,
  `year_start` int(11) NOT NULL,
  `budget` bigint(11) NOT NULL,
  `released` bigint(11) NOT NULL,
  PRIMARY KEY (`budget_id`),
  KEY `grant_id` (`grant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category1`
--

DROP TABLE IF EXISTS `category1`;
CREATE TABLE IF NOT EXISTS `category1` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(60) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category2`
--

DROP TABLE IF EXISTS `category2`;
CREATE TABLE IF NOT EXISTS `category2` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(60) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `circles`
--

DROP TABLE IF EXISTS `circles`;
CREATE TABLE IF NOT EXISTS `circles` (
  `circle_id` int(11) NOT NULL AUTO_INCREMENT,
  `circle_name` varchar(50) NOT NULL,
  PRIMARY KEY (`circle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
CREATE TABLE IF NOT EXISTS `districts` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(50) NOT NULL,
  `state` varchar(2) NOT NULL,
  `state_id` int(11) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
CREATE TABLE IF NOT EXISTS `divisions` (
  `division_id` int(11) NOT NULL AUTO_INCREMENT,
  `division` varchar(50) NOT NULL,
  `district_id` int(11) NOT NULL,
  `circle_id` int(11) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  PRIMARY KEY (`division_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
CREATE TABLE IF NOT EXISTS `facilities` (
  `facility_id` int(11) NOT NULL AUTO_INCREMENT,
  `facility_type_id` int(11) NOT NULL,
  `facility_name` varchar(200) NOT NULL,
  `village_town` varchar(50) NOT NULL,
  `division_id` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`facility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facility_types`
--

DROP TABLE IF EXISTS `facility_types`;
CREATE TABLE IF NOT EXISTS `facility_types` (
  `facility_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `facility_type` varchar(50) NOT NULL,
  PRIMARY KEY (`facility_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `government_orders`
--

DROP TABLE IF EXISTS `government_orders`;
CREATE TABLE IF NOT EXISTS `government_orders` (
  `sanction_ref_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_description` text NOT NULL,
  `grant_phase` int(11) NOT NULL,
  `sanction_type` varchar(20) NOT NULL,
  `go_or_proceeding` tinyint(1) NOT NULL,
  `number` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `section` varchar(10) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`sanction_ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grants`
--

DROP TABLE IF EXISTS `grants`;
CREATE TABLE IF NOT EXISTS `grants` (
  `grant_id` int(11) NOT NULL AUTO_INCREMENT,
  `grant_name` varchar(200) NOT NULL,
  `grant_source_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`grant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grant_phase`
--

DROP TABLE IF EXISTS `grant_phase`;
CREATE TABLE IF NOT EXISTS `grant_phase` (
  `phase_id` int(11) NOT NULL AUTO_INCREMENT,
  `grant_id` int(11) NOT NULL,
  `phase_name` varchar(200) NOT NULL,
  PRIMARY KEY (`phase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grant_sources`
--

DROP TABLE IF EXISTS `grant_sources`;
CREATE TABLE IF NOT EXISTS `grant_sources` (
  `grant_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `grant_source` varchar(50) NOT NULL,
  PRIMARY KEY (`grant_source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ho_pendency`
--

DROP TABLE IF EXISTS `ho_pendency`;
CREATE TABLE IF NOT EXISTS `ho_pendency` (
  `pendency_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `pendency_type_id` int(11) NOT NULL,
  `pendency_details` varchar(400) NOT NULL,
  `pendency_date` date NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pendency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mandal`
--

DROP TABLE IF EXISTS `mandal`;
CREATE TABLE IF NOT EXISTS `mandal` (
  `mandal_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_id` int(11) NOT NULL,
  `mandal` varchar(160) NOT NULL,
  PRIMARY KEY (`mandal_id`),
  KEY `mandal_id` (`mandal_id`),
  KEY `district_id` (`district_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2256 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parliament_constituency`
--

DROP TABLE IF EXISTS `parliament_constituency`;
CREATE TABLE IF NOT EXISTS `parliament_constituency` (
  `parliament_constituency_id` int(11) NOT NULL AUTO_INCREMENT,
  `parliament_constituency` varchar(160) NOT NULL,
  PRIMARY KEY (`parliament_constituency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_date` date NOT NULL,
  `paid_by` varchar(30) NOT NULL,
  `project_id` int(11) NOT NULL,
  `payment_amount` int(11) NOT NULL,
  `type_of_payment` varchar(10) NOT NULL,
  `voucher_number` int(30) NOT NULL,
  `payment_mode` varchar(10) NOT NULL,
  `cheque_no` int(30) NOT NULL,
  `cheque_date` date NOT NULL,
  `agency_id` int(11) NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pendency_type`
--

DROP TABLE IF EXISTS `pendency_type`;
CREATE TABLE IF NOT EXISTS `pendency_type` (
  `pendency_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `pendency_type` varchar(50) NOT NULL,
  PRIMARY KEY (`pendency_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` tinytext NOT NULL,
  `project_address` tinytext NOT NULL,
  `facility_id` int(11) NOT NULL,
  `agreement_id` int(11) NOT NULL DEFAULT '0',
  `agreement_amount` bigint(15) NOT NULL,
  `agreement_date` date NOT NULL,
  `agreement_completion_date` date NOT NULL,
  `agreement_extension_date` date NOT NULL,
  `actual_completion_date` date NOT NULL,
  `site_status` varchar(10) NOT NULL,
  `tender_status` varchar(10) NOT NULL,
  `grant_phase_id` int(11) NOT NULL,
  `category1_id` int(11) NOT NULL DEFAULT '0',
  `category2_id` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `mandal_id` int(11) NOT NULL DEFAULT '0',
  `division_id` int(11) NOT NULL DEFAULT '0',
  `assembly_constituency_id` int(11) NOT NULL DEFAULT '0',
  `parliament_constituency_id` int(11) NOT NULL DEFAULT '0',
  `agency_id` int(11) NOT NULL,
  `work_type_id` smallint(10) NOT NULL,
  `user_department_id` int(6) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `final_bill` tinyint(1) NOT NULL,
  `final_bill_date` date NOT NULL,
  `sanction_type_id` int(11) NOT NULL,
  `road_length_target` double(10,2) NOT NULL,
  `road_length_completed` double(10,2) NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `grant_phase_id` (`grant_phase_id`),
  KEY `district_id` (`district_id`),
  KEY `mandal_id` (`mandal_id`),
  KEY `division_id` (`division_id`),
  KEY `assembly_constituency_id` (`assembly_constituency_id`),
  KEY `parliament_constituency_id` (`parliament_constituency_id`),
  KEY `agency_id` (`agency_id`),
  KEY `work_type_id` (`work_type_id`),
  KEY `user_department_id` (`user_department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10151 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_bills`
--

DROP TABLE IF EXISTS `project_bills`;
CREATE TABLE IF NOT EXISTS `project_bills` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `bill_amount` bigint(20) NOT NULL,
  `bill_date` date NOT NULL,
  `voucher_number` int(11) NOT NULL,
  `payer` varchar(10) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bill_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_expenses`
--

DROP TABLE IF EXISTS `project_expenses`;
CREATE TABLE IF NOT EXISTS `project_expenses` (
  `expense_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `expense_amount` bigint(20) NOT NULL,
  `expense_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`expense_id`),
  KEY `project_id` (`project_id`),
  KEY `expense_id` (`expense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3387 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_extension`
--

DROP TABLE IF EXISTS `project_extension`;
CREATE TABLE IF NOT EXISTS `project_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_date` date NOT NULL,
  `approval_date` date NOT NULL,
  `project_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`extension_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_images`
--

DROP TABLE IF EXISTS `project_images`;
CREATE TABLE IF NOT EXISTS `project_images` (
  `image_id` int(6) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `title` tinytext NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_status`
--

DROP TABLE IF EXISTS `project_status`;
CREATE TABLE IF NOT EXISTS `project_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `status_type_id` int(3) NOT NULL,
  `stage_id` int(6) NOT NULL,
  `status_date` date NOT NULL,
  `probable_date_of_completion` date NOT NULL,
  `remarks_1` text NOT NULL COMMENT 'Remarks by reporting person',
  `remarks_2` text NOT NULL COMMENT 'remarks by reporting officer',
  `current` tinyint(1) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18788 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_targets`
--

DROP TABLE IF EXISTS `project_targets`;
CREATE TABLE IF NOT EXISTS `project_targets` (
  `target_id` int(6) NOT NULL AUTO_INCREMENT,
  `project_id` int(6) NOT NULL,
  `projection_month` date NOT NULL,
  `target_amount` bigint(11) NOT NULL,
  `current` tinyint(1) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`target_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9133 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sanctions`
--

DROP TABLE IF EXISTS `sanctions`;
CREATE TABLE IF NOT EXISTS `sanctions` (
  `sanction_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `admin_sanction_id` tinytext NOT NULL,
  `admin_sanction_amount` bigint(11) NOT NULL,
  `admin_sanction_date` date NOT NULL,
  `tech_sanction_id` tinytext NOT NULL,
  `tech_sanction_amount` bigint(11) NOT NULL,
  `tech_sanction_date` date NOT NULL,
  PRIMARY KEY (`sanction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10153 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sanction_type`
--

DROP TABLE IF EXISTS `sanction_type`;
CREATE TABLE IF NOT EXISTS `sanction_type` (
  `sanction_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `sanction_type` varchar(50) NOT NULL,
  PRIMARY KEY (`sanction_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staff_id` int(6) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `date_of_birth` date NOT NULL,
  `staff_category_id` int(6) NOT NULL,
  `staff_role_id` int(6) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `staff_type` varchar(30) NOT NULL,
  `division_id` int(11) NOT NULL,
  `reporting_officer_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_category`
--

DROP TABLE IF EXISTS `staff_category`;
CREATE TABLE IF NOT EXISTS `staff_category` (
  `staff_category_id` int(6) NOT NULL AUTO_INCREMENT,
  `staff_category` varchar(50) NOT NULL,
  PRIMARY KEY (`staff_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_role`
--

DROP TABLE IF EXISTS `staff_role`;
CREATE TABLE IF NOT EXISTS `staff_role` (
  `staff_role_id` int(6) NOT NULL AUTO_INCREMENT,
  `staff_role` varchar(50) NOT NULL,
  PRIMARY KEY (`staff_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(50) NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_types`
--

DROP TABLE IF EXISTS `status_types`;
CREATE TABLE IF NOT EXISTS `status_types` (
  `status_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_type` varchar(100) NOT NULL,
  PRIMARY KEY (`status_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `staff_id` int(6) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_departments`
--

DROP TABLE IF EXISTS `user_departments`;
CREATE TABLE IF NOT EXISTS `user_departments` (
  `user_department_id` int(6) NOT NULL AUTO_INCREMENT,
  `user_department` varchar(100) NOT NULL,
  PRIMARY KEY (`user_department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_department_link`
--

DROP TABLE IF EXISTS `user_department_link`;
CREATE TABLE IF NOT EXISTS `user_department_link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_department_id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_district_link`
--

DROP TABLE IF EXISTS `user_district_link`;
CREATE TABLE IF NOT EXISTS `user_district_link` (
  `link_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_division_link`
--

DROP TABLE IF EXISTS `user_division_link`;
CREATE TABLE IF NOT EXISTS `user_division_link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `division_id` int(11) NOT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1051 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_functions`
--

DROP TABLE IF EXISTS `user_functions`;
CREATE TABLE IF NOT EXISTS `user_functions` (
  `function_id` int(7) NOT NULL AUTO_INCREMENT,
  `user_function` varchar(50) NOT NULL,
  PRIMARY KEY (`function_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_function_link`
--

DROP TABLE IF EXISTS `user_function_link`;
CREATE TABLE IF NOT EXISTS `user_function_link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `function_id` int(11) NOT NULL,
  `add` tinyint(1) NOT NULL,
  `edit` tinyint(1) NOT NULL,
  `view` tinyint(1) NOT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1431 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_state_link`
--

DROP TABLE IF EXISTS `user_state_link`;
CREATE TABLE IF NOT EXISTS `user_state_link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
CREATE TABLE IF NOT EXISTS `user_types` (
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` int(11) NOT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `village_town`
--

DROP TABLE IF EXISTS `village_town`;
CREATE TABLE IF NOT EXISTS `village_town` (
  `village_town_id` int(11) NOT NULL AUTO_INCREMENT,
  `village_town` int(11) NOT NULL,
  `division_id` int(11) NOT NULL,
  `longitude` decimal(7,6) NOT NULL,
  `latitude` decimal(7,6) NOT NULL,
  PRIMARY KEY (`village_town_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `work_stages`
--

DROP TABLE IF EXISTS `work_stages`;
CREATE TABLE IF NOT EXISTS `work_stages` (
  `stage_id` int(6) NOT NULL AUTO_INCREMENT,
  `stage` varchar(50) NOT NULL,
  `status_type_id` int(6) NOT NULL,
  PRIMARY KEY (`stage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `work_type`
--

DROP TABLE IF EXISTS `work_type`;
CREATE TABLE IF NOT EXISTS `work_type` (
  `work_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `work_type` varchar(25) NOT NULL,
  PRIMARY KEY (`work_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `project_bills`
--
ALTER TABLE `project_bills`
  ADD CONSTRAINT `project_bills_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_expenses`
--
ALTER TABLE `project_expenses`
  ADD CONSTRAINT `project_expenses_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `project_extension`
--
ALTER TABLE `project_extension`
  ADD CONSTRAINT `proj_ext` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE;

--
-- Constraints for table `project_images`
--
ALTER TABLE `project_images`
  ADD CONSTRAINT `project_images_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_status`
--
ALTER TABLE `project_status`
  ADD CONSTRAINT `project_status_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `project_targets`
--
ALTER TABLE `project_targets`
  ADD CONSTRAINT `project_targets_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
