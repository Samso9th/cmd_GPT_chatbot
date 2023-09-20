/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.24 : Database - abdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `ac_accounts` */

DROP TABLE IF EXISTS `ac_accounts`;

CREATE TABLE `ac_accounts` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `count_id` int(5) DEFAULT NULL,
  `store_id` int(5) DEFAULT NULL,
  `parent_id` int(5) DEFAULT NULL,
  `sort_code` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `account_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `account_code` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `balance` double(20,4) DEFAULT NULL,
  `note` text CHARACTER SET latin1,
  `created_by` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `delete_bit` int(1) DEFAULT '0',
  `account_selection_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `paymenttypes_id` int(1) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `expense_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `paymenttypes_id` (`paymenttypes_id`),
  KEY `customer_id` (`customer_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `expense_id` (`expense_id`),
  CONSTRAINT `ac_accounts_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_accounts_ibfk_2` FOREIGN KEY (`paymenttypes_id`) REFERENCES `db_paymenttypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_accounts_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_accounts_ibfk_4` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_accounts_ibfk_5` FOREIGN KEY (`expense_id`) REFERENCES `db_expense` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ac_accounts` */

/*Table structure for table `ac_moneydeposits` */

DROP TABLE IF EXISTS `ac_moneydeposits`;

CREATE TABLE `ac_moneydeposits` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `reference_no` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `debit_account_id` int(11) DEFAULT NULL,
  `credit_account_id` int(11) DEFAULT NULL,
  `amount` double(20,4) DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_account_id` (`debit_account_id`),
  KEY `to_account_id` (`credit_account_id`),
  KEY `db_moneydeposits_ibfk_3` (`store_id`),
  CONSTRAINT `ac_moneydeposits_ibfk_1` FOREIGN KEY (`debit_account_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_moneydeposits_ibfk_2` FOREIGN KEY (`credit_account_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_moneydeposits_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ac_moneydeposits` */

/*Table structure for table `ac_moneytransfer` */

DROP TABLE IF EXISTS `ac_moneytransfer`;

CREATE TABLE `ac_moneytransfer` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL,
  `transfer_code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `transfer_date` date DEFAULT NULL,
  `reference_no` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `debit_account_id` int(11) DEFAULT NULL,
  `credit_account_id` int(11) DEFAULT NULL,
  `amount` double(20,4) DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_account_id` (`debit_account_id`),
  KEY `to_account_id` (`credit_account_id`),
  KEY `db_moneytransfer_ibfk_3` (`store_id`),
  CONSTRAINT `ac_moneytransfer_ibfk_1` FOREIGN KEY (`debit_account_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_moneytransfer_ibfk_2` FOREIGN KEY (`credit_account_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_moneytransfer_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ac_moneytransfer` */

/*Table structure for table `ac_transactions` */

DROP TABLE IF EXISTS `ac_transactions`;

CREATE TABLE `ac_transactions` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_type` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `debit_account_id` int(5) DEFAULT NULL,
  `credit_account_id` int(5) DEFAULT NULL,
  `debit_amt` double(20,4) DEFAULT NULL,
  `credit_amt` double(20,4) DEFAULT NULL,
  `note` text CHARACTER SET latin1,
  `created_by` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `ref_accounts_id` int(5) DEFAULT NULL COMMENT 'reference table',
  `ref_moneytransfer_id` int(5) DEFAULT NULL COMMENT 'reference table',
  `ref_moneydeposits_id` int(5) DEFAULT NULL COMMENT 'reference table',
  `ref_salespayments_id` int(5) DEFAULT NULL,
  `ref_salespaymentsreturn_id` int(5) DEFAULT NULL,
  `ref_purchasepayments_id` int(5) DEFAULT NULL,
  `ref_purchasepaymentsreturn_id` int(5) DEFAULT NULL,
  `ref_expense_id` int(5) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `short_code` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `journal_id` (`transaction_type`),
  KEY `account_id` (`debit_account_id`),
  KEY `store_id` (`store_id`),
  KEY `ac_accounts_id` (`ref_accounts_id`),
  KEY `ac_moneytransfer_id` (`ref_moneytransfer_id`),
  KEY `ac_moneydeposits_id` (`ref_moneydeposits_id`),
  KEY `customer_id` (`customer_id`),
  KEY `ref_salespayments_id` (`ref_salespayments_id`),
  KEY `ref_purchasepayments_id` (`ref_purchasepayments_id`),
  KEY `ref_purchasepaymentsreturn_id` (`ref_purchasepaymentsreturn_id`),
  KEY `ac_transactions_ibfk_9` (`ref_salespaymentsreturn_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `ref_expense_id` (`ref_expense_id`),
  CONSTRAINT `ac_transactions_ibfk_10` FOREIGN KEY (`ref_purchasepayments_id`) REFERENCES `db_purchasepayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_11` FOREIGN KEY (`ref_purchasepaymentsreturn_id`) REFERENCES `db_purchasepaymentsreturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_12` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_13` FOREIGN KEY (`ref_expense_id`) REFERENCES `db_expense` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_4` FOREIGN KEY (`ref_accounts_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_5` FOREIGN KEY (`ref_moneytransfer_id`) REFERENCES `ac_moneytransfer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_6` FOREIGN KEY (`ref_moneydeposits_id`) REFERENCES `ac_moneydeposits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_7` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_8` FOREIGN KEY (`ref_salespayments_id`) REFERENCES `db_salespayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ac_transactions_ibfk_9` FOREIGN KEY (`ref_salespaymentsreturn_id`) REFERENCES `db_salespaymentsreturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=830 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ac_transactions` */

/*Table structure for table `ci_sessions` */

DROP TABLE IF EXISTS `ci_sessions`;

CREATE TABLE `ci_sessions` (
  `id` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ci_sessions` */

insert  into `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) values ('1gg2j2uh340uk746tinfq8o9nadpfkpk','127.0.0.1',1683442299,'__ci_last_regenerate|i:1683442299;language|s:7:\"English\";currency|s:0:\"\";currency_placement|s:0:\"\";currency_code|s:0:\"\";view_date|s:10:\"dd-mm-yyyy\";view_time|s:2:\"12\";decimals|s:1:\"2\";qty_decimals|s:1:\"2\";store_name|s:10:\"SAAS ADMIN\";'),('5b6ok1c221emvu27gqp2b9jau1qstlei','127.0.0.1',1684593075,'__ci_last_regenerate|i:1684593070;currency|s:3:\"₹\";currency_placement|s:4:\"Left\";currency_code|s:3:\"INR\";view_date|s:10:\"dd-mm-yyyy\";view_time|s:2:\"12\";decimals|s:1:\"3\";qty_decimals|s:1:\"2\";store_name|s:12:\"Billing Book\";inv_username|s:5:\"admin\";user_lname|s:6:\"Morris\";inv_userid|s:1:\"2\";logged_in|b:1;role_id|s:1:\"2\";role_name|s:11:\"Store Admin\";store_id|s:1:\"2\";email|s:17:\"admin@example.com\";language|s:7:\"English\";language_id|s:1:\"1\";');

/*Table structure for table `db_bankdetails` */

DROP TABLE IF EXISTS `db_bankdetails`;

CREATE TABLE `db_bankdetails` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `country_id` int(5) DEFAULT NULL,
  `holder_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IFSC or Bank Code',
  `account_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_details` mediumtext COLLATE utf8mb4_unicode_ci,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_bankdetails_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_bankdetails` */

insert  into `db_bankdetails`(`id`,`store_id`,`country_id`,`holder_name`,`bank_name`,`branch_name`,`code`,`account_type`,`account_number`,`other_details`,`description`,`status`) values (1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);

/*Table structure for table `db_brands` */

DROP TABLE IF EXISTS `db_brands`;

CREATE TABLE `db_brands` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `brand_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_brands_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_brands_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_brands` */

/*Table structure for table `db_category` */

DROP TABLE IF EXISTS `db_category`;

CREATE TABLE `db_category` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create category Code',
  `category_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_category_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_category` */

/*Table structure for table `db_cobpayments` */

DROP TABLE IF EXISTS `db_cobpayments`;

CREATE TABLE `db_cobpayments` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_cobpayments` */

/*Table structure for table `db_company` */

DROP TABLE IF EXISTS `db_company`;

CREATE TABLE `db_company` (
  `id` double DEFAULT NULL,
  `company_code` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_website` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` text COLLATE utf8mb4_unicode_ci,
  `logo` mediumtext COLLATE utf8mb4_unicode_ci,
  `upi_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upi_code` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` mediumtext COLLATE utf8mb4_unicode_ci,
  `cid` int(10) DEFAULT NULL,
  `category_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `supplier_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_return_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_return_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_view` int(5) DEFAULT NULL COMMENT '1=Standard,2=Indian GST',
  `status` int(1) DEFAULT NULL,
  `sms_status` int(1) DEFAULT NULL COMMENT '1=Enable 0=Disable',
  `sales_terms_and_conditions` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_company` */

insert  into `db_company`(`id`,`company_code`,`company_name`,`company_website`,`mobile`,`phone`,`email`,`website`,`company_logo`,`logo`,`upi_id`,`upi_code`,`country`,`state`,`city`,`address`,`postcode`,`gst_no`,`vat_no`,`pan_no`,`bank_details`,`cid`,`category_init`,`item_init`,`supplier_init`,`purchase_init`,`purchase_return_init`,`customer_init`,`sales_init`,`sales_return_init`,`expense_init`,`invoice_view`,`status`,`sms_status`,`sales_terms_and_conditions`) values (1,'','Company Name',NULL,'9999999999','','admin@example.com','','company_logo.png','logo-0.png',NULL,NULL,'India','Karnataka','Belgaum','Address Details','','','','','',1,'CT','IT','SP','PU','PR','CU','SL','PR','EX',1,1,0,NULL);

/*Table structure for table `db_country` */

DROP TABLE IF EXISTS `db_country`;

CREATE TABLE `db_country` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `country` varchar(4050) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_on` date DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_country` */

insert  into `db_country`(`id`,`country`,`added_on`,`status`) values (1,'Abkhazia','2020-11-03',1),(2,'Afghanistan','2020-11-03',1),(3,'Albania','2020-11-03',1),(4,'Algeria','2020-11-03',1),(5,'Andorra','2020-11-03',1),(6,'Angola','2020-11-03',1),(7,'Antigua and Barbuda','2020-11-03',1),(8,'Argentina','2020-11-03',1),(9,'Armenia','2020-11-03',1),(10,'Australia','2020-11-03',1),(11,'Austria','2020-11-03',1),(12,'Azerbaijan','2020-11-03',1),(13,'Bahamas','2020-11-03',1),(14,'Bahrain','2020-11-03',1),(15,'Bangladesh','2020-11-03',1),(16,'Barbados','2020-11-03',1),(17,'Belarus','2020-11-03',1),(18,'Belgium','2020-11-03',1),(19,'Belize','2020-11-03',1),(20,'Benin','2020-11-03',1),(21,'Bhutan','2020-11-03',1),(22,'Bolivia','2020-11-03',1),(23,'Bosnia and Herzegovina','2020-11-03',1),(24,'Botswana','2020-11-03',1),(25,'Brazil','2020-11-03',1),(26,'Brunei','2020-11-03',1),(27,'Bulgaria','2020-11-03',1),(28,'Burkina Faso','2020-11-03',1),(29,'Burma','2020-11-03',1),(30,'Burundi','2020-11-03',1),(31,'Cambodia','2020-11-03',1),(32,'Cameroon','2020-11-03',1),(33,'Canada','2020-11-03',1),(34,'Cape Verde','2020-11-03',1),(35,'Central African Republic','2020-11-03',1),(36,'Chad','2020-11-03',1),(37,'Chile','2020-11-03',1),(38,'China','2020-11-03',1),(39,'Colombia','2020-11-03',1),(40,'Comoros','2020-11-03',1),(41,'Congo','2020-11-03',1),(42,'Cook Islands','2020-11-03',1),(43,'Costa Rica','2020-11-03',1),(44,'Croatia','2020-11-03',1),(45,'Cuba','2020-11-03',1),(46,'Cyprus','2020-11-03',1),(47,'Czech Republic','2020-11-03',1),(48,'C?te d\'Ivoire','2020-11-03',1),(49,'Denmark','2020-11-03',1),(50,'Djibouti','2020-11-03',1),(51,'Dominica','2020-11-03',1),(52,'Dominican Republic','2020-11-03',1),(53,'East Timor','2020-11-03',1),(54,'Ecuador','2020-11-03',1),(55,'Egypt','2020-11-03',1),(56,'El Salvador','2020-11-03',1),(57,'Equatorial Guinea','2020-11-03',1),(58,'Eritrea','2020-11-03',1),(59,'Estonia','2020-11-03',1),(60,'Ethiopia','2020-11-03',1),(61,'Fiji','2020-11-03',1),(62,'Finland','2020-11-03',1),(63,'France','2020-11-03',1),(64,'Gabon','2020-11-03',1),(65,'Gambia','2020-11-03',1),(66,'Georgia','2020-11-03',1),(67,'Germany','2020-11-03',1),(68,'Ghana','2020-11-03',1),(69,'Greece','2020-11-03',1),(70,'Grenada','2020-11-03',1),(71,'Guatemala','2020-11-03',1),(72,'Guinea','2020-11-03',1),(73,'Guinea-Bissau','2020-11-03',1),(74,'Guyana','2020-11-03',1),(75,'Haiti','2020-11-03',1),(76,'Honduras','2020-11-03',1),(77,'Hungary','2020-11-03',1),(78,'Iceland','2020-11-03',1),(79,'India','2020-11-03',1),(80,'Indonesia','2020-11-03',1),(81,'Iran','2020-11-03',1),(82,'Iraq','2020-11-03',1),(83,'Ireland','2020-11-03',1),(84,'Israel','2020-11-03',1),(85,'Italy','2020-11-03',1),(86,'Ivory Coast','2020-11-03',1),(87,'Jamaica','2020-11-03',1),(88,'Japan','2020-11-03',1),(89,'Jordan','2020-11-03',1),(90,'Kazakhstan','2020-11-03',1),(91,'Kenya','2020-11-03',1),(92,'Kiribati','2020-11-03',1),(93,'Korea, North','2020-11-03',1),(94,'Korea, South','2020-11-03',1),(95,'Kosovo','2020-11-03',1),(96,'Kuwait','2020-11-03',1),(97,'Kyrgyzstan','2020-11-03',1),(98,'Laos','2020-11-03',1),(99,'Latvia','2020-11-03',1),(100,'Lebanon','2020-11-03',1),(101,'Lesotho','2020-11-03',1),(102,'Liberia','2020-11-03',1),(103,'Libya','2020-11-03',1),(104,'Liechtenstein','2020-11-03',1),(105,'Lithuania','2020-11-03',1),(106,'Luxembourg','2020-11-03',1),(107,'Macedonia','2020-11-03',1),(108,'Madagascar','2020-11-03',1),(109,'Malawi','2020-11-03',1),(110,'Malaysia','2020-11-03',1),(111,'Maldives','2020-11-03',1),(112,'Mali','2020-11-03',1),(113,'Malta','2020-11-03',1),(114,'Marshall Islands','2020-11-03',1),(115,'Mauritania','2020-11-03',1),(116,'Mauritius','2020-11-03',1),(117,'Mexico','2020-11-03',1),(118,'Micronesia','2020-11-03',1),(119,'Moldova','2020-11-03',1),(120,'Monaco','2020-11-03',1),(121,'Mongolia','2020-11-03',1),(122,'Montenegro','2020-11-03',1),(123,'Morocco','2020-11-03',1),(124,'Mozambique','2020-11-03',1),(125,'Myanmar / Burma','2020-11-03',1),(126,'Nagorno-Karabakh','2020-11-03',1),(127,'Namibia','2020-11-03',1),(128,'Nauru','2020-11-03',1),(129,'Nepal','2020-11-03',1),(130,'Netherlands','2020-11-03',1),(131,'New Zealand','2020-11-03',1),(132,'Nicaragua','2020-11-03',1),(133,'Niger','2020-11-03',1),(134,'Nigeria','2020-11-03',1),(135,'Niue','2020-11-03',1),(136,'Northern Cyprus','2020-11-03',1),(137,'Norway','2020-11-03',1),(138,'Oman','2020-11-03',1),(139,'Pakistan','2020-11-03',1),(140,'Palau','2020-11-03',1),(141,'Palestine','2020-11-03',1),(142,'Panama','2020-11-03',1),(143,'Papua New Guinea','2020-11-03',1),(144,'Paraguay','2020-11-03',1),(145,'Peru','2020-11-03',1),(146,'Philippines','2020-11-03',1),(147,'Poland','2020-11-03',1),(148,'Portugal','2020-11-03',1),(149,'Qatar','2020-11-03',1),(150,'Romania','2020-11-03',1),(151,'Russia','2020-11-03',1),(152,'Rwanda','2020-11-03',1),(153,'Sahrawi Arab Democratic Republic','2020-11-03',1),(154,'Saint Kitts and Nevis','2020-11-03',1),(155,'Saint Lucia','2020-11-03',1),(156,'Saint Vincent and the Grenadines','2020-11-03',1),(157,'Samoa','2020-11-03',1),(158,'San Marino','2020-11-03',1),(159,'Saudi Arabia','2020-11-03',1),(160,'Senegal','2020-11-03',1),(161,'Serbia','2020-11-03',1),(162,'Seychelles','2020-11-03',1),(163,'Sierra Leone','2020-11-03',1),(164,'Singapore','2020-11-03',1),(165,'Slovakia','2020-11-03',1),(166,'Slovenia','2020-11-03',1),(167,'Solomon Islands','2020-11-03',1),(168,'Somalia','2020-11-03',1),(169,'Somaliland','2020-11-03',1),(170,'South Africa','2020-11-03',1),(171,'South Ossetia','2020-11-03',1),(172,'Spain','2020-11-03',1),(173,'Sri Lanka','2020-11-03',1),(174,'Sudan','2020-11-03',1),(175,'Suriname','2020-11-03',1),(176,'Swaziland','2020-11-03',1),(177,'Sweden','2020-11-03',1),(178,'Switzerland','2020-11-03',1),(179,'Syria','2020-11-03',1),(180,'S?o Tom? and Pr?ncipe','2020-11-03',1),(181,'Taiwan','2020-11-03',1),(182,'Tajikistan','2020-11-03',1),(183,'Tanzania','2020-11-03',1),(184,'Thailand','2020-11-03',1),(185,'Timor-Leste / East Timor','2020-11-03',1),(186,'Togo','2020-11-03',1),(187,'Tonga','2020-11-03',1),(188,'Trinidad and Tobago','2020-11-03',1),(189,'Tunisia','2020-11-03',1),(190,'Turkey','2020-11-03',1),(191,'Turkmenistan','2020-11-03',1),(192,'Tuvalu','2020-11-03',1),(193,'Uganda','2020-11-03',1),(194,'Ukraine','2020-11-03',1),(195,'United Arab Emirates','2020-11-03',1),(196,'United Kingdom','2020-11-03',1),(197,'United States','2020-11-03',1),(198,'Uruguay','2020-11-03',1),(199,'Uzbekistan','2020-11-03',1),(200,'Vanuatu','2020-11-03',1),(201,'Vatican City','2020-11-03',1),(202,'Venezuela','2020-11-03',1),(203,'Vietnam','2020-11-03',1),(204,'Yemen','2020-11-03',1),(205,'Zambia','2020-11-03',1),(206,'Zimbabwe','2020-11-03',1);

/*Table structure for table `db_coupons` */

DROP TABLE IF EXISTS `db_coupons`;

CREATE TABLE `db_coupons` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `value` double(20,2) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_coupons_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_coupons_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_coupons` */

/*Table structure for table `db_currency` */

DROP TABLE IF EXISTS `db_currency`;

CREATE TABLE `db_currency` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` blob,
  `symbol` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_currency` */

insert  into `db_currency`(`id`,`currency_name`,`currency_code`,`currency`,`symbol`,`status`) values (1,'Bulgaria-Bulgarian lev(BGN)',NULL,'лв',NULL,1),(2,'Switzerland \r-Swiss franc (CHF)',NULL,'CHF',NULL,1),(3,'Czechia-Czech koruna(CZK))',NULL,'Kč ',NULL,1),(4,'Denmark-Danish krone(DKK)',NULL,'kr ',NULL,1),(5,'Euro area countries -Euro(EUR)',NULL,'€ ',NULL,1),(6,'United Kingdom-Pounds sterling (GBP)',NULL,'£',NULL,1),(7,'Croatia -Croatian Kuna (HRK)',NULL,'kn',NULL,1),(8,'Georgia -Georgian lari (GEL)',NULL,'&#8382;',NULL,1),(9,'Hungary -Hungarian forint (HUF)',NULL,'ft',NULL,1),(10,'Norway -Norwegian krone (NOK)',NULL,'kr',NULL,1),(11,'Poland -Polish zloty (PLN)',NULL,'zł ',NULL,1),(12,'Russia -Russian ruble (RUB)',NULL,'&#8381; ',NULL,1),(13,'Romania -Romanian leu (RON)',NULL,'lei',NULL,1),(14,'Sweden - Swedish krona (SEK)',NULL,'kr',NULL,1),(15,'Turkey -Turkish lira (TRY)',NULL,'&#8378; ',NULL,1),(16,'Ukraine - Ukrainian hryvna  (UAH)',NULL,'₴ ',NULL,1),(17,'UAE -Emirati dirham (AED)',NULL,'د.إ ',NULL,1),(18,'Israel - Israeli shekel (ILS)',NULL,'&#8362; ',NULL,1),(19,'Kenya - Kenyan shilling(KES)',NULL,'Ksh',NULL,1),(20,'Morocco - Moroccan dirham (MAD)',NULL,'.د.م ',NULL,1),(21,'Nigeria - Nigerian naira (NGN)',NULL,'₦ ',NULL,1),(22,'South Africa -South african rand** (ZAR)',NULL,'R',NULL,1),(23,'Brazil- Brazilian real(BRL)',NULL,'R$',NULL,1),(24,'Canada-Canadian dollars (CAD)',NULL,'$',NULL,1),(25,'Chile -Chilean peso (CLP)',NULL,'$',NULL,1),(26,'Colombia -Colombian peso (COP)',NULL,'$',NULL,1),(27,'Mexico - Mexican peso (MXN)',NULL,'$',NULL,1),(28,'Peru -Peruvian sol(PEN)',NULL,'S/. ',NULL,1),(29,'USA -US dollar (USD)',NULL,'$',NULL,1),(30,'Australia -Australian dollars (AUD)',NULL,'$',NULL,1),(31,'Bangladesh -Bangladeshi taka (BDT) ',NULL,'&#2547; ',NULL,1),(32,'China - Chinese yuan (CNY)',NULL,'&#20803; ',NULL,1),(33,'Hong Kong - Hong Kong dollar(HKD)',NULL,'&#36; ',NULL,1),(34,'Indonesia - Indonesian rupiah (IDR)',NULL,'Rp',NULL,1),(35,'India - Indian rupee','INR','₹','?',1),(36,'Japan - Japanese yen (JPY)',NULL,'¥',NULL,1),(37,'Malaysia - Malaysian ringgit (MYR)',NULL,'RM',NULL,1),(38,'New Zealand - New Zealand dollar (NZD)',NULL,'$',NULL,1),(39,'Philippines- Philippine peso (PHP)',NULL,'₱ ',NULL,1),(40,'Pakistan- Pakistani rupee (PKR)',NULL,'Rs ',NULL,1),(41,'Singapore - Singapore dollar (SGD)',NULL,'$',NULL,1),(42,'South Korea - South Korean won (KRW)',NULL,'&#8361; ',NULL,1),(43,'Sri Lanka - Sri Lankan rupee (LKR)',NULL,'Rs',NULL,1),(44,'Thailand- Thai baht (THB)',NULL,'&#3647; ',NULL,1),(45,'Vietnam - Vietnamese dong','VND','₫',NULL,1),(46,'Bitcoin - BTC or XBT','BTC ','₿',NULL,1),(47,'Ripples','XRP','XRP',NULL,1),(48,'Monero','XMR','ɱ',NULL,1),(49,'Litecoin','LTC','Ł',NULL,1),(50,'Ethereum','ETH','Ξ',NULL,1),(51,'Euro','EUR','€',NULL,1),(52,'Pounds sterling','GBP','£',NULL,1),(53,'US dollar','USD','$',NULL,1),(54,'Japanese yen','JPY','¥',NULL,1),(55,'Omani rial','OMR','ر.ع.',NULL,1);

/*Table structure for table `db_custadvance` */

DROP TABLE IF EXISTS `db_custadvance`;

CREATE TABLE `db_custadvance` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `count_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `amount` double(20,4) DEFAULT NULL,
  `payment_type` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_ip` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_custadvance_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_custadvance_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_custadvance` */

/*Table structure for table `db_customer_coupons` */

DROP TABLE IF EXISTS `db_customer_coupons`;

CREATE TABLE `db_customer_coupons` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `value` double(20,2) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `coupon_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `customer_id` (`customer_id`),
  KEY `coupon_id` (`coupon_id`),
  CONSTRAINT `db_customer_coupons_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_customer_coupons_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_customer_coupons_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_customer_coupons_ibfk_4` FOREIGN KEY (`coupon_id`) REFERENCES `db_coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_customer_coupons` */

/*Table structure for table `db_customer_payments` */

DROP TABLE IF EXISTS `db_customer_payments`;

CREATE TABLE `db_customer_payments` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `salespayment_id` int(5) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` text CHARACTER SET utf8mb4,
  `system_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `salespayment_id` (`salespayment_id`),
  CONSTRAINT `db_customer_payments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_customer_payments_ibfk_2` FOREIGN KEY (`salespayment_id`) REFERENCES `db_salespayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_customer_payments` */

/*Table structure for table `db_customers` */

DROP TABLE IF EXISTS `db_customers`;

CREATE TABLE `db_customers` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create Customer Code',
  `customer_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gstin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vatin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance` double(20,4) DEFAULT NULL,
  `sales_due` double(20,4) DEFAULT NULL,
  `sales_return_due` double(20,4) DEFAULT NULL,
  `country_id` int(50) DEFAULT NULL,
  `state_id` int(50) DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_country_id` int(5) DEFAULT NULL,
  `ship_state_id` int(5) DEFAULT NULL,
  `ship_city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_address` text COLLATE utf8mb4_unicode_ci,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `location_link` text COLLATE utf8mb4_unicode_ci,
  `attachment_1` text COLLATE utf8mb4_unicode_ci,
  `price_level_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'Increase',
  `price_level` double(20,4) DEFAULT '0.0000',
  `delete_bit` int(1) DEFAULT '0',
  `tot_advance` double(20,4) DEFAULT NULL,
  `credit_limit` double(20,4) DEFAULT '-1.0000',
  `shippingaddress_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_customers_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_customers` */

insert  into `db_customers`(`id`,`store_id`,`count_id`,`customer_code`,`customer_name`,`mobile`,`phone`,`email`,`gstin`,`tax_number`,`vatin`,`opening_balance`,`sales_due`,`sales_return_due`,`country_id`,`state_id`,`city`,`postcode`,`address`,`ship_country_id`,`ship_state_id`,`ship_city`,`ship_postcode`,`ship_address`,`system_ip`,`system_name`,`created_date`,`created_time`,`created_by`,`company_id`,`status`,`location_link`,`attachment_1`,`price_level_type`,`price_level`,`delete_bit`,`tot_advance`,`credit_limit`,`shippingaddress_id`) values (1,1,NULL,'CU0001','Walk-in customer',NULL,'','','','',NULL,0.0000,0.0000,0.0000,1,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-01','10:55:54 pm','admin',NULL,1,NULL,NULL,'Increase',0.0000,1,NULL,-1.0000,1),(2,2,1,'CU/02/0001','Walk-in customer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'127.0.0.1','LAPTOP-I5OUIM4R','2021-02-12','05:53:37 pm','',NULL,1,NULL,NULL,'Increase',0.0000,1,0.0000,-1.0000,2);

/*Table structure for table `db_emailtemplates` */

DROP TABLE IF EXISTS `db_emailtemplates`;

CREATE TABLE `db_emailtemplates` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `key` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `variables` text COLLATE utf8mb4_unicode_ci,
  `status` int(5) DEFAULT NULL,
  `undelete_bit` int(5) DEFAULT NULL,
  `admin_only` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_emailtemplates_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_emailtemplates` */

insert  into `db_emailtemplates`(`id`,`store_id`,`key`,`template_name`,`content`,`variables`,`status`,`undelete_bit`,`admin_only`) values (1,1,'SAAS_FORGOT_PASSWORD_EMAIL','Site forgot password email template','Hi {{user_name}},\r\n\r\nyour OTP is {{email_otp}}\r\n\r\nThank you\r\n{{saas_name}}','{{user_name}}<br>\r\n{{saas_name}}<br>\r\n{{email_otp}}<br>',1,1,1),(2,1,'SAAS_WELCOME_EMAIL','Site welcome email','Hi {{user_name}},\r\nYour email id {{email_id}},\r\nwelcome to our {{saas_name}},\r\n\r\nThank you','{{user_name}}<br>\r\n{{email_id}}<br>\r\n{{saas_name}}<br>',1,1,1);

/*Table structure for table `db_expense` */

DROP TABLE IF EXISTS `db_expense`;

CREATE TABLE `db_expense` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create Expense Code',
  `expense_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(5) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_for` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_amt` double(20,4) DEFAULT NULL,
  `payment_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int(5) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `db_expense_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_expense_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `ac_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_expense` */

/*Table structure for table `db_expense_category` */

DROP TABLE IF EXISTS `db_expense_category`;

CREATE TABLE `db_expense_category` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `category_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_expense_category_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_expense_category` */

/*Table structure for table `db_fivemojo` */

DROP TABLE IF EXISTS `db_fivemojo`;

CREATE TABLE `db_fivemojo` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `url` text CHARACTER SET utf8mb4,
  `token` text CHARACTER SET utf8mb4,
  `instance_id` text CHARACTER SET utf8mb4,
  `status` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_fivemojo_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_fivemojo` */

/*Table structure for table `db_hold` */

DROP TABLE IF EXISTS `db_hold`;

CREATE TABLE `db_hold` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `reference_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Temprary',
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL,
  `round_off` double(20,2) DEFAULT NULL,
  `grand_total` double(20,4) DEFAULT NULL,
  `sales_note` text COLLATE utf8mb4_unicode_ci,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `customer_id` (`customer_id`),
  KEY `warehouse_id` (`warehouse_id`),
  CONSTRAINT `db_hold_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_hold_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_hold_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_hold` */

/*Table structure for table `db_holditems` */

DROP TABLE IF EXISTS `db_holditems`;

CREATE TABLE `db_holditems` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `hold_id` int(5) DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sales_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `sales_id` (`hold_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `db_holditems_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_holditems_ibfk_2` FOREIGN KEY (`hold_id`) REFERENCES `db_hold` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_holditems_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `db_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_holditems` */

/*Table structure for table `db_instamojo` */

DROP TABLE IF EXISTS `db_instamojo`;

CREATE TABLE `db_instamojo` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `sandbox` int(1) DEFAULT NULL,
  `api_key` text CHARACTER SET utf8mb4,
  `api_token` text CHARACTER SET utf8mb4,
  `updated_at` date DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_instamojo_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_instamojo` */

insert  into `db_instamojo`(`id`,`store_id`,`sandbox`,`api_key`,`api_token`,`updated_at`,`updated_by`,`status`) values (1,1,1,'','','2021-02-22','Admin',1);

/*Table structure for table `db_instamojopayments` */

DROP TABLE IF EXISTS `db_instamojopayments`;

CREATE TABLE `db_instamojopayments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `buyer_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL,
  `purpose` text CHARACTER SET utf8,
  `expires_at` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `send_sms` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT 'false',
  `send_email` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT 'false',
  `sms_status` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email_status` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `shorturl` mediumtext CHARACTER SET utf8,
  `longurl` mediumtext CHARACTER SET utf8,
  `redirect_url` mediumtext CHARACTER SET utf8,
  `webhook` mediumtext CHARACTER SET utf8,
  `allow_repeated_payments` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT 'false',
  `customer_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `modified_at` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_instamojopayments` */

/*Table structure for table `db_items` */

DROP TABLE IF EXISTS `db_items`;

CREATE TABLE `db_items` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create ITEM Code',
  `item_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hsn` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sac` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(10) DEFAULT NULL,
  `alert_qty` int(10) DEFAULT NULL,
  `brand_id` int(5) DEFAULT NULL,
  `lot_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `price` double(20,4) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `purchase_price` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profit_margin` double(20,2) DEFAULT NULL,
  `sales_price` double(20,4) DEFAULT NULL,
  `stock` double(20,2) DEFAULT NULL,
  `item_image` text COLLATE utf8mb4_unicode_ci,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `discount_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Percentage',
  `discount` double(20,2) DEFAULT '0.00',
  `service_bit` int(1) DEFAULT '0',
  `seller_points` double(20,2) DEFAULT '0.00',
  `custom_barcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `item_group` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(5) DEFAULT NULL,
  `variant_id` int(5) DEFAULT NULL,
  `child_bit` int(1) DEFAULT '0',
  `mrp` double(20,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_items_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_items` */

/*Table structure for table `db_languages` */

DROP TABLE IF EXISTS `db_languages`;

CREATE TABLE `db_languages` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `language` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_languages` */

insert  into `db_languages`(`id`,`language`,`status`) values (1,'English',1),(2,'Russian',1),(3,'Spanish',1),(4,'Arabic',1),(5,'Bangla',1),(6,'French',1);

/*Table structure for table `db_package` */

DROP TABLE IF EXISTS `db_package`;

CREATE TABLE `db_package` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `package_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `monthly_price` double(20,2) DEFAULT NULL,
  `annual_price` double(20,2) DEFAULT NULL,
  `trial_days` int(10) DEFAULT NULL,
  `max_users` int(10) DEFAULT NULL,
  `max_items` int(10) DEFAULT NULL,
  `max_invoices` int(10) DEFAULT NULL,
  `max_warehouses` int(10) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `plan_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_package_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_package` */

insert  into `db_package`(`id`,`store_id`,`package_type`,`package_code`,`package_name`,`description`,`monthly_price`,`annual_price`,`trial_days`,`max_users`,`max_items`,`max_invoices`,`max_warehouses`,`expire_date`,`system_ip`,`system_name`,`created_date`,`created_time`,`created_by`,`status`,`plan_type`) values (1,1,'Free',NULL,'Free','Test description',0.00,0.00,10,2,20,20,2,'2021-01-14','127.0.0.1','LAPTOP-I5OUIM4R','2021-01-13','06:37:21 pm','admin',1,NULL),(2,1,'Paid',NULL,'Regular','Test description',250.00,2000.00,15,20,200,200,20,NULL,'127.0.0.1','LAPTOP-I5OUIM4R','2021-01-13','06:39:23 pm','admin',1,NULL),(3,1,'Paid',NULL,'Ultimate','Description',500.00,5000.00,15,-1,-1,-1,-1,NULL,'127.0.0.1','LAPTOP-I5OUIM4R','2021-01-24','12:35:30 pm','admin',1,NULL);

/*Table structure for table `db_paymenttypes` */

DROP TABLE IF EXISTS `db_paymenttypes`;

CREATE TABLE `db_paymenttypes` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_paymenttypes_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_paymenttypes` */

/*Table structure for table `db_paypal` */

DROP TABLE IF EXISTS `db_paypal`;

CREATE TABLE `db_paypal` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(10) DEFAULT NULL,
  `sandbox` int(1) DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_paypal_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_paypal` */

insert  into `db_paypal`(`id`,`store_id`,`sandbox`,`email`,`updated_at`,`updated_by`,`status`) values (1,1,1,'','2021-02-22','Admin',1);

/*Table structure for table `db_paypalpaylog` */

DROP TABLE IF EXISTS `db_paypalpaylog`;

CREATE TABLE `db_paypalpaylog` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `txn_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payer_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_paypalpaylog` */

/*Table structure for table `db_permissions` */

DROP TABLE IF EXISTS `db_permissions`;

CREATE TABLE `db_permissions` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `role_id` int(5) DEFAULT NULL,
  `permissions` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_permissions_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_permissions` */

insert  into `db_permissions`(`id`,`store_id`,`role_id`,`permissions`) values (4414,1,17,'items_add'),(4415,1,17,'items_edit'),(4416,1,17,'items_delete'),(4417,1,17,'items_view'),(4418,1,17,'import_items'),(4419,1,17,'brand_add'),(4420,1,17,'brand_edit'),(4421,1,17,'brand_delete'),(4422,1,17,'brand_view'),(4423,1,17,'customers_add'),(4424,1,17,'customers_edit'),(4425,1,17,'customers_delete'),(4426,1,17,'customers_view'),(4427,1,17,'sales_add'),(4428,1,17,'sales_edit'),(4429,1,17,'sales_delete'),(4430,1,17,'sales_view'),(4431,1,17,'sales_payment_view'),(4432,1,17,'sales_payment_add'),(4433,1,17,'sales_payment_delete'),(4434,1,17,'sales_report'),(4435,1,17,'sales_payments_report'),(4436,1,17,'items_category_add'),(4437,1,17,'items_category_edit'),(4438,1,17,'items_category_delete'),(4439,1,17,'items_category_view'),(4440,1,17,'print_labels'),(4441,1,17,'dashboard_view'),(4442,1,17,'dashboard_info_box_1'),(4443,1,17,'dashboard_info_box_2'),(4444,1,17,'dashboard_pur_sal_chart'),(4445,1,17,'dashboard_recent_items'),(4446,1,17,'dashboard_stock_alert'),(4447,1,17,'dashboard_trending_items_chart'),(4448,1,17,'sales_return_add'),(4449,1,17,'sales_return_edit'),(4450,1,17,'sales_return_delete'),(4451,1,17,'sales_return_view'),(4452,1,17,'sales_return_report'),(4453,1,17,'sales_return_payment_view'),(4454,1,17,'sales_return_payment_add'),(4455,1,17,'sales_return_payment_delete'),(4456,1,17,'payment_types_add'),(4457,1,17,'payment_types_edit'),(4458,1,17,'payment_types_delete'),(4459,1,17,'payment_types_view'),(4460,1,17,'import_customers'),(4461,1,17,'stock_transfer_add'),(4462,1,17,'stock_transfer_edit'),(4463,1,17,'stock_transfer_delete'),(4464,1,17,'stock_transfer_view'),(4465,1,17,'seller_points_report'),(4466,1,17,'services_add'),(4467,1,17,'services_edit'),(4468,1,17,'services_delete'),(4469,1,17,'services_view'),(4470,1,17,'import_services'),(4471,1,17,'stock_adjustment_add'),(4472,1,17,'stock_adjustment_edit'),(4473,1,17,'stock_adjustment_delete'),(4474,1,17,'stock_adjustment_view'),(4475,1,17,'variant_add'),(4476,1,17,'variant_edit'),(4477,1,17,'variant_delete'),(4478,1,17,'variant_view'),(4479,1,17,'accounts_add'),(4480,1,17,'accounts_edit'),(4481,1,17,'accounts_delete'),(4482,1,17,'accounts_view'),(4483,1,17,'money_transfer_add'),(4484,1,17,'money_transfer_edit'),(4485,1,17,'money_transfer_delete'),(4486,1,17,'money_transfer_view'),(4487,1,17,'money_deposit_add'),(4488,1,17,'money_deposit_edit'),(4489,1,17,'money_deposit_delete'),(4490,1,17,'money_deposit_view'),(4491,1,17,'sales_tax_report'),(4492,1,18,'tax_add'),(4493,1,18,'tax_edit'),(4494,1,18,'tax_delete'),(4495,1,18,'tax_view'),(4496,1,18,'units_add'),(4497,1,18,'units_edit'),(4498,1,18,'units_delete'),(4499,1,18,'units_view'),(4500,1,18,'items_add'),(4501,1,18,'items_edit'),(4502,1,18,'items_delete'),(4503,1,18,'items_view'),(4504,1,18,'import_items'),(4505,1,18,'brand_add'),(4506,1,18,'brand_edit'),(4507,1,18,'brand_delete'),(4508,1,18,'brand_view'),(4509,1,18,'suppliers_add'),(4510,1,18,'suppliers_edit'),(4511,1,18,'suppliers_delete'),(4512,1,18,'suppliers_view'),(4513,1,18,'purchase_add'),(4514,1,18,'purchase_edit'),(4515,1,18,'purchase_delete'),(4516,1,18,'purchase_view'),(4517,1,18,'purchase_report'),(4518,1,18,'purchase_payments_report'),(4519,1,18,'items_category_add'),(4520,1,18,'items_category_edit'),(4521,1,18,'items_category_delete'),(4522,1,18,'items_category_view'),(4523,1,18,'print_labels'),(4524,1,18,'dashboard_view'),(4525,1,18,'dashboard_info_box_1'),(4526,1,18,'dashboard_info_box_2'),(4527,1,18,'dashboard_pur_sal_chart'),(4528,1,18,'dashboard_recent_items'),(4529,1,18,'dashboard_stock_alert'),(4530,1,18,'dashboard_trending_items_chart'),(4531,1,18,'purchase_return_add'),(4532,1,18,'purchase_return_edit'),(4533,1,18,'purchase_return_delete'),(4534,1,18,'purchase_return_view'),(4535,1,18,'purchase_return_report'),(4536,1,18,'purchase_return_payment_view'),(4537,1,18,'purchase_return_payment_add'),(4538,1,18,'purchase_return_payment_delete'),(4539,1,18,'purchase_payment_view'),(4540,1,18,'purchase_payment_add'),(4541,1,18,'purchase_payment_delete'),(4542,1,18,'payment_types_add'),(4543,1,18,'payment_types_edit'),(4544,1,18,'payment_types_delete'),(4545,1,18,'payment_types_view'),(4546,1,18,'import_suppliers'),(4547,1,18,'stock_transfer_add'),(4548,1,18,'stock_transfer_edit'),(4549,1,18,'stock_transfer_delete'),(4550,1,18,'stock_transfer_view'),(4551,1,18,'warehouse_add'),(4552,1,18,'warehouse_edit'),(4553,1,18,'warehouse_delete'),(4554,1,18,'warehouse_view'),(4555,1,18,'services_add'),(4556,1,18,'services_edit'),(4557,1,18,'services_delete'),(4558,1,18,'services_view'),(4559,1,18,'import_services'),(4560,1,18,'stock_adjustment_add'),(4561,1,18,'stock_adjustment_edit'),(4562,1,18,'stock_adjustment_delete'),(4563,1,18,'stock_adjustment_view'),(4564,1,18,'variant_add'),(4565,1,18,'variant_edit'),(4566,1,18,'variant_delete'),(4567,1,18,'variant_view'),(4568,1,18,'accounts_add'),(4569,1,18,'accounts_edit'),(4570,1,18,'accounts_delete'),(4571,1,18,'accounts_view'),(4572,1,18,'money_transfer_add'),(4573,1,18,'money_transfer_edit'),(4574,1,18,'money_transfer_delete'),(4575,1,18,'money_transfer_view'),(4576,1,18,'money_deposit_add'),(4577,1,18,'money_deposit_edit'),(4578,1,18,'money_deposit_delete'),(4579,1,18,'money_deposit_view'),(4580,1,18,'purchase_tax_report'),(5818,1,2,'users_add'),(5819,1,2,'users_edit'),(5820,1,2,'users_delete'),(5821,1,2,'users_view'),(5822,1,2,'tax_add'),(5823,1,2,'tax_edit'),(5824,1,2,'tax_delete'),(5825,1,2,'tax_view'),(5826,1,2,'store_edit'),(5827,1,2,'units_add'),(5828,1,2,'units_edit'),(5829,1,2,'units_delete'),(5830,1,2,'units_view'),(5831,1,2,'roles_add'),(5832,1,2,'roles_edit'),(5833,1,2,'roles_delete'),(5834,1,2,'roles_view'),(5835,1,2,'expense_add'),(5836,1,2,'expense_edit'),(5837,1,2,'expense_delete'),(5838,1,2,'expense_view'),(5839,1,2,'items_add'),(5840,1,2,'items_edit'),(5841,1,2,'items_delete'),(5842,1,2,'items_view'),(5843,1,2,'import_items'),(5844,1,2,'brand_add'),(5845,1,2,'brand_edit'),(5846,1,2,'brand_delete'),(5847,1,2,'brand_view'),(5848,1,2,'suppliers_add'),(5849,1,2,'suppliers_edit'),(5850,1,2,'suppliers_delete'),(5851,1,2,'suppliers_view'),(5852,1,2,'customers_add'),(5853,1,2,'customers_edit'),(5854,1,2,'customers_delete'),(5855,1,2,'customers_view'),(5856,1,2,'purchase_add'),(5857,1,2,'purchase_edit'),(5858,1,2,'purchase_delete'),(5859,1,2,'purchase_view'),(5860,1,2,'sales_add'),(5861,1,2,'sales_edit'),(5862,1,2,'sales_delete'),(5863,1,2,'sales_view'),(5864,1,2,'sales_payment_view'),(5865,1,2,'sales_payment_add'),(5866,1,2,'sales_payment_delete'),(5867,1,2,'sales_report'),(5868,1,2,'purchase_report'),(5869,1,2,'expense_report'),(5870,1,2,'profit_report'),(5871,1,2,'stock_report'),(5872,1,2,'item_sales_report'),(5873,1,2,'purchase_payments_report'),(5874,1,2,'sales_payments_report'),(5875,1,2,'items_category_add'),(5876,1,2,'items_category_edit'),(5877,1,2,'items_category_delete'),(5878,1,2,'items_category_view'),(5879,1,2,'print_labels'),(5880,1,2,'expense_category_add'),(5881,1,2,'expense_category_edit'),(5882,1,2,'expense_category_delete'),(5883,1,2,'expense_category_view'),(5884,1,2,'dashboard_view'),(5885,1,2,'dashboard_info_box_1'),(5886,1,2,'dashboard_info_box_2'),(5887,1,2,'dashboard_pur_sal_chart'),(5888,1,2,'dashboard_recent_items'),(5889,1,2,'dashboard_stock_alert'),(5890,1,2,'dashboard_trending_items_chart'),(5891,1,2,'send_sms'),(5892,1,2,'sms_template_edit'),(5893,1,2,'sms_template_view'),(5894,1,2,'sms_api_view'),(5895,1,2,'sms_api_edit'),(5896,1,2,'purchase_return_add'),(5897,1,2,'purchase_return_edit'),(5898,1,2,'purchase_return_delete'),(5899,1,2,'purchase_return_view'),(5900,1,2,'purchase_return_report'),(5901,1,2,'sales_return_add'),(5902,1,2,'sales_return_edit'),(5903,1,2,'sales_return_delete'),(5904,1,2,'sales_return_view'),(5905,1,2,'sales_return_report'),(5906,1,2,'sales_return_payment_view'),(5907,1,2,'sales_return_payment_add'),(5908,1,2,'sales_return_payment_delete'),(5909,1,2,'purchase_return_payment_view'),(5910,1,2,'purchase_return_payment_add'),(5911,1,2,'purchase_return_payment_delete'),(5912,1,2,'purchase_payment_view'),(5913,1,2,'purchase_payment_add'),(5914,1,2,'purchase_payment_delete'),(5915,1,2,'payment_types_add'),(5916,1,2,'payment_types_edit'),(5917,1,2,'payment_types_delete'),(5918,1,2,'payment_types_view'),(5919,1,2,'import_customers'),(5920,1,2,'import_suppliers'),(5921,1,2,'stock_transfer_add'),(5922,1,2,'stock_transfer_edit'),(5923,1,2,'stock_transfer_delete'),(5924,1,2,'stock_transfer_view'),(5925,1,2,'warehouse_add'),(5926,1,2,'warehouse_edit'),(5927,1,2,'warehouse_delete'),(5928,1,2,'warehouse_view'),(5929,1,2,'supplier_items_report'),(5930,1,2,'seller_points_report'),(5931,1,2,'services_add'),(5932,1,2,'services_edit'),(5933,1,2,'services_delete'),(5934,1,2,'services_view'),(5935,1,2,'quotation_add'),(5936,1,2,'quotation_edit'),(5937,1,2,'quotation_delete'),(5938,1,2,'quotation_view'),(5939,1,2,'import_services'),(5940,1,2,'stock_adjustment_add'),(5941,1,2,'stock_adjustment_edit'),(5942,1,2,'stock_adjustment_delete'),(5943,1,2,'stock_adjustment_view'),(5944,1,2,'variant_add'),(5945,1,2,'variant_edit'),(5946,1,2,'variant_delete'),(5947,1,2,'variant_view'),(5948,1,2,'accounts_add'),(5949,1,2,'accounts_edit'),(5950,1,2,'accounts_delete'),(5951,1,2,'accounts_view'),(5952,1,2,'money_transfer_add'),(5953,1,2,'money_transfer_edit'),(5954,1,2,'money_transfer_delete'),(5955,1,2,'money_transfer_view'),(5956,1,2,'money_deposit_add'),(5957,1,2,'money_deposit_edit'),(5958,1,2,'money_deposit_delete'),(5959,1,2,'money_deposit_view'),(5960,1,2,'sales_tax_report'),(5961,1,2,'purchase_tax_report'),(5962,1,2,'cash_transactions'),(5963,1,2,'show_all_users_sales_invoices'),(5964,1,2,'show_all_users_sales_return_invoices'),(5965,1,2,'show_all_users_purchase_invoices'),(5966,1,2,'show_all_users_purchase_return_invoices'),(5967,1,2,'show_all_users_expenses'),(5968,1,2,'show_all_users_quotations'),(5970,1,2,'smtp_settings'),(5971,1,2,'send_email'),(5972,1,2,'sms_settings'),(5973,1,2,'email_template_edit'),(5974,1,2,'email_template_view'),(5975,1,2,'cust_adv_payments_add'),(5976,1,2,'cust_adv_payments_edit'),(5977,1,2,'cust_adv_payments_delete'),(5978,1,2,'cust_adv_payments_view'),(5999,2,28,'cust_adv_payments_add'),(6000,2,28,'cust_adv_payments_edit'),(6001,2,28,'cust_adv_payments_delete'),(6002,2,28,'cust_adv_payments_view'),(6011,2,29,'users_add'),(6012,2,29,'users_edit'),(6013,2,29,'users_delete'),(6014,2,29,'users_view'),(6015,2,29,'tax_add'),(6016,2,29,'tax_edit'),(6017,2,29,'tax_delete'),(6018,2,29,'tax_view'),(6019,2,29,'store_edit'),(6020,2,29,'units_add'),(6021,2,29,'units_edit'),(6022,2,29,'units_delete'),(6023,2,29,'units_view'),(6024,2,29,'roles_add'),(6025,2,29,'roles_edit'),(6026,2,29,'roles_delete'),(6027,2,29,'roles_view'),(6028,2,29,'expense_add'),(6029,2,29,'expense_edit'),(6030,2,29,'expense_delete'),(6031,2,29,'expense_view'),(6032,2,29,'items_add'),(6033,2,29,'items_edit'),(6034,2,29,'items_delete'),(6035,2,29,'items_view'),(6036,2,29,'import_items'),(6037,2,29,'brand_add'),(6038,2,29,'brand_edit'),(6039,2,29,'brand_delete'),(6040,2,29,'brand_view'),(6041,2,29,'suppliers_add'),(6042,2,29,'suppliers_edit'),(6043,2,29,'suppliers_delete'),(6044,2,29,'suppliers_view'),(6045,2,29,'customers_add'),(6046,2,29,'customers_edit'),(6047,2,29,'customers_delete'),(6048,2,29,'customers_view'),(6049,2,29,'purchase_add'),(6050,2,29,'purchase_edit'),(6051,2,29,'purchase_delete'),(6052,2,29,'purchase_view'),(6053,2,29,'sales_add'),(6054,2,29,'sales_edit'),(6055,2,29,'sales_delete'),(6056,2,29,'sales_view'),(6057,2,29,'sales_payment_view'),(6058,2,29,'sales_payment_add'),(6059,2,29,'sales_payment_delete'),(6060,2,29,'sales_report'),(6061,2,29,'purchase_report'),(6062,2,29,'expense_report'),(6063,2,29,'profit_report'),(6064,2,29,'stock_report'),(6065,2,29,'item_sales_report'),(6066,2,29,'purchase_payments_report'),(6067,2,29,'sales_payments_report'),(6068,2,29,'items_category_add'),(6069,2,29,'items_category_edit'),(6070,2,29,'items_category_delete'),(6071,2,29,'items_category_view'),(6072,2,29,'print_labels'),(6073,2,29,'expense_category_add'),(6074,2,29,'expense_category_edit'),(6075,2,29,'expense_category_delete'),(6076,2,29,'expense_category_view'),(6077,2,29,'dashboard_view'),(6078,2,29,'dashboard_info_box_1'),(6079,2,29,'dashboard_info_box_2'),(6080,2,29,'dashboard_pur_sal_chart'),(6081,2,29,'dashboard_recent_items'),(6082,2,29,'dashboard_stock_alert'),(6083,2,29,'dashboard_trending_items_chart'),(6084,2,29,'send_sms'),(6085,2,29,'sms_template_edit'),(6086,2,29,'sms_template_view'),(6087,2,29,'sms_api_view'),(6088,2,29,'sms_api_edit'),(6089,2,29,'purchase_return_add'),(6090,2,29,'purchase_return_edit'),(6091,2,29,'purchase_return_delete'),(6092,2,29,'purchase_return_view'),(6093,2,29,'purchase_return_report'),(6094,2,29,'sales_return_add'),(6095,2,29,'sales_return_edit'),(6096,2,29,'sales_return_delete'),(6097,2,29,'sales_return_view'),(6098,2,29,'sales_return_report'),(6099,2,29,'sales_return_payment_view'),(6100,2,29,'sales_return_payment_add'),(6101,2,29,'sales_return_payment_delete'),(6102,2,29,'purchase_return_payment_view'),(6103,2,29,'purchase_return_payment_add'),(6104,2,29,'purchase_return_payment_delete'),(6105,2,29,'purchase_payment_view'),(6106,2,29,'purchase_payment_add'),(6107,2,29,'purchase_payment_delete'),(6108,2,29,'payment_types_add'),(6109,2,29,'payment_types_edit'),(6110,2,29,'payment_types_delete'),(6111,2,29,'payment_types_view'),(6112,2,29,'import_customers'),(6113,2,29,'import_suppliers'),(6114,2,29,'stock_transfer_add'),(6115,2,29,'stock_transfer_edit'),(6116,2,29,'stock_transfer_delete'),(6117,2,29,'stock_transfer_view'),(6118,2,29,'warehouse_add'),(6119,2,29,'warehouse_edit'),(6120,2,29,'warehouse_delete'),(6121,2,29,'warehouse_view'),(6122,2,29,'supplier_items_report'),(6123,2,29,'seller_points_report'),(6124,2,29,'services_add'),(6125,2,29,'services_edit'),(6126,2,29,'services_delete'),(6127,2,29,'services_view'),(6128,2,29,'quotation_add'),(6129,2,29,'quotation_edit'),(6130,2,29,'quotation_delete'),(6131,2,29,'quotation_view'),(6132,2,29,'import_services'),(6133,2,29,'stock_adjustment_add'),(6134,2,29,'stock_adjustment_edit'),(6135,2,29,'stock_adjustment_delete'),(6136,2,29,'stock_adjustment_view'),(6137,2,29,'variant_add'),(6138,2,29,'variant_edit'),(6139,2,29,'variant_delete'),(6140,2,29,'variant_view'),(6141,2,29,'accounts_add'),(6142,2,29,'accounts_edit'),(6143,2,29,'accounts_delete'),(6144,2,29,'accounts_view'),(6145,2,29,'money_transfer_add'),(6146,2,29,'money_transfer_edit'),(6147,2,29,'money_transfer_delete'),(6148,2,29,'money_transfer_view'),(6149,2,29,'money_deposit_add'),(6150,2,29,'money_deposit_edit'),(6151,2,29,'money_deposit_delete'),(6152,2,29,'money_deposit_view'),(6153,2,29,'sales_tax_report'),(6154,2,29,'purchase_tax_report'),(6155,2,29,'cash_transactions'),(6156,2,29,'show_all_users_sales_invoices'),(6157,2,29,'show_all_users_sales_return_invoices'),(6158,2,29,'show_all_users_purchase_invoices'),(6159,2,29,'show_all_users_purchase_return_invoices'),(6160,2,29,'show_all_users_expenses'),(6161,2,29,'show_all_users_quotations'),(6162,2,29,'smtp_settings'),(6163,2,29,'send_email'),(6164,2,29,'sms_settings'),(6165,2,29,'email_template_edit'),(6166,2,29,'email_template_view'),(6167,2,29,'cust_adv_payments_add'),(6168,2,29,'cust_adv_payments_edit'),(6169,2,29,'cust_adv_payments_delete'),(6170,2,29,'cust_adv_payments_view'),(6179,1,2,'gstr_1_report'),(6180,1,2,'gstr_2_report'),(6181,1,2,'delivery_sheet_report'),(6182,1,2,'load_sheet_report'),(6183,1,2,'show_purchase_price'),(6184,1,2,'customer_orders_report'),(6185,1,2,'discountCouponAdd'),(6186,1,2,'discountCouponEdit'),(6187,1,2,'discountCouponDelete'),(6188,1,2,'discountCouponView'),(6189,2,2,'sales_gst_report'),(6190,2,2,'purchase_gst_report'),(6192,1,2,'customerCouponAdd'),(6193,1,2,'customerCouponEdit'),(6194,1,2,'customerCouponDelete'),(6195,1,2,'customerCouponView'),(6196,1,2,'return_items_report'),(6197,1,2,'help_link'),(6198,2,2,'recent_sales_invoice_list'),(6199,1,2,'stock_transfer_report'),(6200,1,2,'pos'),(6201,1,2,'sales_summary_report'),(6202,1,2,'sales_return_payments');

/*Table structure for table `db_purchase` */

DROP TABLE IF EXISTS `db_purchase`;

CREATE TABLE `db_purchase` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create Purchase Code',
  `purchase_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,4) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,4) DEFAULT NULL,
  `discount_to_all_input` double(20,4) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,4) DEFAULT NULL,
  `subtotal` double(20,4) DEFAULT NULL COMMENT 'Purchased qty',
  `round_off` double(20,4) DEFAULT NULL COMMENT 'Pending Qty',
  `grand_total` double(20,4) DEFAULT NULL,
  `purchase_note` text COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'Purchase return raised',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `db_purchase_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_purchase_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_purchase` */

/*Table structure for table `db_purchaseitems` */

DROP TABLE IF EXISTS `db_purchaseitems`;

CREATE TABLE `db_purchaseitems` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `purchase_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `purchase_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  `profit_margin_per` double(20,4) DEFAULT NULL,
  `unit_sales_price` double(20,4) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `purchase_id` (`purchase_id`),
  CONSTRAINT `db_purchaseitems_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `db_purchase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_purchaseitems` */

/*Table structure for table `db_purchaseitemsreturn` */

DROP TABLE IF EXISTS `db_purchaseitemsreturn`;

CREATE TABLE `db_purchaseitemsreturn` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `return_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  `profit_margin_per` double(20,4) DEFAULT NULL,
  `unit_sales_price` double(20,4) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `return_id` (`return_id`),
  KEY `purchase_id` (`purchase_id`),
  CONSTRAINT `db_purchaseitemsreturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_purchaseitemsreturn_ibfk_2` FOREIGN KEY (`return_id`) REFERENCES `db_purchasereturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_purchaseitemsreturn` */

/*Table structure for table `db_purchasepayments` */

DROP TABLE IF EXISTS `db_purchasepayments`;

CREATE TABLE `db_purchasepayments` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `count_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,4) DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `account_id` int(5) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `short_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `db_purchasepayments_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_purchasepayments_ibfk_2` FOREIGN KEY (`purchase_id`) REFERENCES `db_purchase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_purchasepayments_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_purchasepayments` */

/*Table structure for table `db_purchasepaymentsreturn` */

DROP TABLE IF EXISTS `db_purchasepaymentsreturn`;

CREATE TABLE `db_purchasepaymentsreturn` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `count_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,4) DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `account_id` int(5) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `short_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `return_id` (`return_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `db_purchasepaymentsreturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_purchasepaymentsreturn_ibfk_2` FOREIGN KEY (`return_id`) REFERENCES `db_purchasereturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_purchasepaymentsreturn_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_purchasepaymentsreturn` */

/*Table structure for table `db_purchasereturn` */

DROP TABLE IF EXISTS `db_purchasereturn`;

CREATE TABLE `db_purchasereturn` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create Purchase Return Code',
  `warehouse_id` int(5) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,4) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,4) DEFAULT NULL,
  `discount_to_all_input` double(20,4) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,4) DEFAULT NULL,
  `subtotal` double(20,4) DEFAULT NULL COMMENT 'Purchased qty',
  `round_off` double(20,4) DEFAULT NULL COMMENT 'Pending Qty',
  `grand_total` double(20,4) DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `purchase_id` (`purchase_id`),
  CONSTRAINT `db_purchasereturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_purchasereturn_ibfk_2` FOREIGN KEY (`purchase_id`) REFERENCES `db_purchase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_purchasereturn` */

/*Table structure for table `db_quotation` */

DROP TABLE IF EXISTS `db_quotation`;

CREATE TABLE `db_quotation` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create quotation Code',
  `quotation_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `quotation_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,4) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,4) DEFAULT NULL,
  `discount_to_all_input` double(20,4) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,4) DEFAULT NULL,
  `subtotal` double(20,4) DEFAULT NULL,
  `round_off` double(20,4) DEFAULT NULL,
  `grand_total` double(20,4) DEFAULT NULL,
  `quotation_note` text COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'quotation return raised',
  `customer_previous_due` double(20,4) DEFAULT NULL,
  `customer_total_due` double(20,4) DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `customer_id` (`customer_id`),
  KEY `warehouse_id` (`warehouse_id`),
  CONSTRAINT `db_quotation_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_quotation_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_quotation_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_quotation` */

/*Table structure for table `db_quotationitems` */

DROP TABLE IF EXISTS `db_quotationitems`;

CREATE TABLE `db_quotationitems` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `quotation_id` int(5) DEFAULT NULL,
  `quotation_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quotation_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `seller_points` double(20,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `quotation_id` (`quotation_id`),
  CONSTRAINT `db_quotationitems_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_quotationitems_ibfk_2` FOREIGN KEY (`quotation_id`) REFERENCES `db_quotation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_quotationitems` */

/*Table structure for table `db_roles` */

DROP TABLE IF EXISTS `db_roles`;

CREATE TABLE `db_roles` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `role_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_roles_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_roles` */

insert  into `db_roles`(`id`,`store_id`,`role_name`,`description`,`status`) values (1,1,'Admin','All Rights Permitted.',1),(2,1,'Store Admin','Note: Apply this role for New Store Admin. ',1);

/*Table structure for table `db_sales` */

DROP TABLE IF EXISTS `db_sales`;

CREATE TABLE `db_sales` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `init_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_id` decimal(20,0) DEFAULT NULL COMMENT 'Use to create Sales Code',
  `sales_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,2) DEFAULT NULL,
  `discount_to_all_input` double(20,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,2) DEFAULT NULL,
  `subtotal` double(20,2) DEFAULT NULL,
  `round_off` double(20,2) DEFAULT NULL,
  `grand_total` double(20,4) DEFAULT NULL,
  `sales_note` text COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'sales return raised',
  `customer_previous_due` double(20,2) DEFAULT NULL,
  `customer_total_due` double(20,2) DEFAULT NULL,
  `quotation_id` int(5) DEFAULT NULL,
  `coupon_id` int(10) DEFAULT NULL,
  `coupon_amt` double(20,2) DEFAULT '0.00',
  `invoice_terms` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `customer_id` (`customer_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `coupon_id` (`coupon_id`),
  CONSTRAINT `db_sales_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_sales_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_sales_ibfk_4` FOREIGN KEY (`coupon_id`) REFERENCES `db_customer_coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_sales` */

/*Table structure for table `db_salesitems` */

DROP TABLE IF EXISTS `db_salesitems`;

CREATE TABLE `db_salesitems` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sales_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `seller_points` double(20,2) DEFAULT '0.00',
  `purchase_price` double(20,3) DEFAULT '0.000',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `sales_id` (`sales_id`),
  CONSTRAINT `db_salesitems_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_salesitems_ibfk_2` FOREIGN KEY (`sales_id`) REFERENCES `db_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=556 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_salesitems` */

/*Table structure for table `db_salesitemsreturn` */

DROP TABLE IF EXISTS `db_salesitemsreturn`;

CREATE TABLE `db_salesitemsreturn` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `return_qty` double(20,2) DEFAULT NULL,
  `price_per_unit` double(20,4) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(20,4) DEFAULT NULL,
  `discount_input` double(20,4) DEFAULT NULL,
  `discount_amt` double(20,4) DEFAULT NULL,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_total_cost` double(20,4) DEFAULT NULL,
  `total_cost` double(20,4) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `purchase_price` double(20,3) DEFAULT '0.000',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `return_id` (`return_id`),
  CONSTRAINT `db_salesitemsreturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_salesitemsreturn_ibfk_2` FOREIGN KEY (`return_id`) REFERENCES `db_salesreturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_salesitemsreturn` */

/*Table structure for table `db_salespayments` */

DROP TABLE IF EXISTS `db_salespayments`;

CREATE TABLE `db_salespayments` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `count_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,4) DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci,
  `change_return` double(20,4) DEFAULT NULL COMMENT 'Refunding the greater amount',
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `account_id` int(5) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `short_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advance_adjusted` double(20,4) DEFAULT NULL,
  `cheque_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_period` int(10) DEFAULT NULL,
  `cheque_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `sales_id` (`sales_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `db_salespayments_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_salespayments_ibfk_2` FOREIGN KEY (`sales_id`) REFERENCES `db_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_salespayments_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_salespayments` */

/*Table structure for table `db_salespaymentsreturn` */

DROP TABLE IF EXISTS `db_salespaymentsreturn`;

CREATE TABLE `db_salespaymentsreturn` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `count_id` int(5) DEFAULT NULL,
  `payment_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(20,4) DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci,
  `change_return` double(20,4) DEFAULT NULL COMMENT 'Refunding the greater amount',
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `account_id` int(5) DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `short_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `return_id` (`return_id`),
  KEY `db_salespaymentsreturn_ibfk_3` (`customer_id`),
  CONSTRAINT `db_salespaymentsreturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_salespaymentsreturn_ibfk_2` FOREIGN KEY (`return_id`) REFERENCES `db_salesreturn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_salespaymentsreturn_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_salespaymentsreturn` */

/*Table structure for table `db_salesreturn` */

DROP TABLE IF EXISTS `db_salesreturn`;

CREATE TABLE `db_salesreturn` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create Sales Return Code',
  `sales_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `return_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `other_charges_input` double(20,4) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(20,4) DEFAULT NULL,
  `discount_to_all_input` double(20,4) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(20,4) DEFAULT NULL,
  `subtotal` double(20,4) DEFAULT NULL,
  `round_off` double(20,4) DEFAULT NULL,
  `grand_total` double(20,4) DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(20,4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'Return raised or not 1 or null',
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_amt` double(20,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `sales_id` (`sales_id`),
  KEY `coupon_id` (`coupon_id`),
  CONSTRAINT `db_salesreturn_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_salesreturn_ibfk_2` FOREIGN KEY (`sales_id`) REFERENCES `db_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_salesreturn_ibfk_3` FOREIGN KEY (`coupon_id`) REFERENCES `db_customer_coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_salesreturn` */

/*Table structure for table `db_shippingaddress` */

DROP TABLE IF EXISTS `db_shippingaddress`;

CREATE TABLE `db_shippingaddress` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `store_id` int(10) DEFAULT NULL,
  `country_id` int(10) DEFAULT NULL,
  `state_id` int(10) DEFAULT NULL,
  `city` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `postcode` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `address` text CHARACTER SET latin1,
  `status` int(1) DEFAULT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `location_link` text CHARACTER SET latin1,
  KEY `customer_id` (`customer_id`),
  KEY `store_id` (`store_id`),
  KEY `id` (`id`),
  CONSTRAINT `db_shippingaddress_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `db_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_shippingaddress_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_shippingaddress` */

insert  into `db_shippingaddress`(`id`,`store_id`,`country_id`,`state_id`,`city`,`postcode`,`address`,`status`,`customer_id`,`location_link`) values (1,1,1,NULL,NULL,'','',1,1,NULL),(2,2,NULL,NULL,NULL,NULL,NULL,1,2,NULL);

/*Table structure for table `db_sitesettings` */

DROP TABLE IF EXISTS `db_sitesettings`;

CREATE TABLE `db_sitesettings` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `version` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'path',
  `machine_id` text COLLATE utf8mb4_unicode_ci,
  `domain` text COLLATE utf8mb4_unicode_ci,
  `unique_code` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_sitesettings` */

insert  into `db_sitesettings`(`id`,`version`,`site_name`,`logo`,`machine_id`,`domain`,`unique_code`) values (1,'3.1','Billing Book','/uploads/site/billing-book.png','1','localhost','kl14ri0yeabwton9cpjh2m8f5q73gs');

/*Table structure for table `db_smsapi` */

DROP TABLE IF EXISTS `db_smsapi`;

CREATE TABLE `db_smsapi` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `info` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_value` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_bit` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_smsapi_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_smsapi` */

insert  into `db_smsapi`(`id`,`store_id`,`info`,`key`,`key_value`,`delete_bit`) values (26,2,'url','weblink','http://example.com/sendmessage',NULL),(27,2,'mobile','mobiles','',NULL),(28,2,'message','message','',NULL),(29,1,'url','weblink','https://www.example.com/api/mt/SendSMS?',NULL),(30,1,'mobile','mobiles','',NULL),(31,1,'message','message','',NULL);

/*Table structure for table `db_smstemplates` */

DROP TABLE IF EXISTS `db_smstemplates`;

CREATE TABLE `db_smstemplates` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `template_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `variables` text COLLATE utf8mb4_unicode_ci,
  `status` int(5) DEFAULT NULL,
  `undelete_bit` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_smstemplates_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_smstemplates` */

insert  into `db_smstemplates`(`id`,`store_id`,`template_name`,`content`,`variables`,`status`,`undelete_bit`) values (1,1,'GREETING TO CUSTOMER ON SALES','Hi {{customer_name}},\r\nYour sales Id is {{sales_id}},\r\nSales Date {{sales_date}},\r\nTotal amount  {{sales_amount}},\r\nYou have paid  {{paid_amt}},\r\nand due amount is  {{due_amt}}\r\nThank you Visit Again','{{customer_name}}<br>                          \r\n{{sales_id}}<br>\r\n{{sales_date}}<br>\r\n{{sales_amount}}<br>\r\n{{paid_amt}}<br>\r\n{{due_amt}}<br>\r\n{{store_name}}<br>\r\n{{store_mobile}}<br>\r\n{{store_address}}<br>\r\n{{store_website}}<br>\r\n{{store_email}}<br>\r\n',1,1),(2,1,'GREETING TO CUSTOMER ON SALES RETURN','Hi {{customer_name}},\r\nYour sales return Id is {{return_id}},\r\nReturn Date {{return_date}},\r\nTotal amount  {{return_amount}},\r\nWe paid  {{paid_amt}},\r\nand due amount is  {{due_amt}}\r\nThank you Visit Again','{{customer_name}}<br>                          \r\n{{return_id}}<br>\r\n{{return_date}}<br>\r\n{{return_amount}}<br>\r\n{{paid_amt}}<br>\r\n{{due_amt}}<br>\r\n{{company_name}}<br>\r\n{{company_mobile}}<br>\r\n{{company_address}}<br>\r\n{{company_website}}<br>\r\n{{company_email}}<br>',1,1),(12,2,'GREETING TO CUSTOMER ON SALES','Hi {{customer_name}},\r\nYour sales Id is {{sales_id}},\r\nSales Date {{sales_date}},\r\nTotal amount  {{sales_amount}},\r\nYou have paid  {{paid_amt}},\r\nand due amount is  {{due_amt}}\r\nThank you Visit Again','{{customer_name}}                          \r\n{{sales_id}}\r\n{{sales_date}}\r\n{{sales_amount}}\r\n{{paid_amt}}\r\n{{due_amt}}\r\n{{store_name}}\r\n{{store_mobile}}\r\n{{store_address}}\r\n{{store_website}}\r\n{{store_email}}\r\n',1,1),(13,2,'GREETING TO CUSTOMER ON SALES RETURN','Hi {{customer_name}},\r\nYour sales return Id is {{return_id}},\r\nReturn Date {{return_date}},\r\nTotal amount  {{return_amount}},\r\nWe paid  {{paid_amt}},\r\nand due amount is  {{due_amt}}\r\nThank you Visit Again','{{customer_name}}                          \r\n{{return_id}}\r\n{{return_date}}\r\n{{return_amount}}\r\n{{paid_amt}}\r\n{{due_amt}}\r\n{{company_name}}\r\n{{company_mobile}}\r\n{{company_address}}\r\n{{company_website}}\r\n{{company_email}}\r\n',1,1);

/*Table structure for table `db_sobpayments` */

DROP TABLE IF EXISTS `db_sobpayments`;

CREATE TABLE `db_sobpayments` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_sobpayments` */

/*Table structure for table `db_states` */

DROP TABLE IF EXISTS `db_states`;

CREATE TABLE `db_states` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `state_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(4050) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(5) DEFAULT NULL,
  `country` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_on` date DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_states_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_states` */

insert  into `db_states`(`id`,`store_id`,`state_code`,`state`,`country_code`,`country_id`,`country`,`added_on`,`company_id`,`status`) values (23,1,'ST0001','Karnataka','CNT0001',NULL,'India','2017-07-10',1,1),(24,1,'ST0024','Maharashtra','CNT0001',NULL,'India','2018-04-13',1,1),(25,2,'ST0025','Andhra Pradesh','CNT0001',NULL,'India','2018-11-02',NULL,1),(26,1,'ST0026','Arunachal Pradesh','CNT0001',NULL,'India','2018-11-02',NULL,1),(27,1,'ST0027','Assam','CNT0001',NULL,'India','2018-11-02',NULL,1),(28,1,'ST0028','Bihar','CNT0001',NULL,'India','2018-11-02',NULL,1),(29,1,'ST0029','Chhattisgarh','CNT0001',NULL,'India','2018-11-02',NULL,1),(30,1,'ST0030','Goa','CNT0001',NULL,'India','2018-11-02',NULL,1),(31,1,'ST0031','Gujarat','CNT0001',NULL,'India','2018-11-02',NULL,1),(32,1,'ST0032','Haryana','CNT0001',NULL,'India','2018-11-02',NULL,1),(33,1,'ST0033','Himachal Pradesh','CNT0001',NULL,'India','2018-11-02',NULL,1),(34,1,'ST0034','Jammu and Kashmir','CNT0001',NULL,'India','2018-11-02',NULL,1),(35,1,'ST0035','Jharkhand','CNT0001',NULL,'India','2018-11-02',NULL,1),(36,1,'ST0036','Kerala','CNT0001',NULL,'India','2018-11-02',NULL,1),(37,1,'ST0037','Madhya Pradesh','CNT0001',NULL,'India','2018-11-02',NULL,1),(38,1,'ST0038','Manipur','CNT0001',NULL,'India','2018-11-02',NULL,1),(39,1,'ST0039','Meghalaya','CNT0001',NULL,'India','2018-11-02',NULL,1),(40,1,'ST0040','Mizoram','CNT0001',NULL,'India','2018-11-02',NULL,1),(41,1,'ST0041','Nagaland','CNT0001',NULL,'India','2018-11-02',NULL,1),(42,1,'ST0042','Odisha','CNT0001',NULL,'India','2018-11-02',NULL,1),(43,1,'ST0043','Punjab','CNT0001',NULL,'India','2018-11-02',NULL,1),(44,1,'ST0044','Rajasthan','CNT0001',NULL,'India','2018-11-02',NULL,1),(45,1,'ST0045','Sikkim','CNT0001',NULL,'India','2018-11-02',NULL,1),(46,1,'ST0046','Tamil Nadu','CNT0001',NULL,'India','2018-11-02',NULL,1),(47,1,'ST0047','Telangana','CNT0001',NULL,'India','2018-11-02',NULL,1),(48,1,'ST0048','Tripura','CNT0001',NULL,'India','2018-11-02',NULL,1),(49,1,'ST0049','Uttar Pradesh','CNT0001',NULL,'India','2018-11-02',NULL,1),(50,1,'ST0050','Uttarakhand','CNT0001',NULL,'India','2018-11-02',NULL,1),(51,1,'ST0051','West Bengal','CNT0001',NULL,'India','2018-11-02',NULL,1),(52,1,NULL,'New York',NULL,NULL,'USA',NULL,NULL,1),(53,1,NULL,'Delhi',NULL,NULL,'India',NULL,NULL,1),(63,2,NULL,'Karnataka',NULL,79,'India',NULL,NULL,1);

/*Table structure for table `db_stockadjustment` */

DROP TABLE IF EXISTS `db_stockadjustment`;

CREATE TABLE `db_stockadjustment` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_date` date DEFAULT NULL,
  `adjustment_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_stockadjustment_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_stockadjustment` */

/*Table structure for table `db_stockadjustmentitems` */

DROP TABLE IF EXISTS `db_stockadjustmentitems`;

CREATE TABLE `db_stockadjustmentitems` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `adjustment_id` int(5) DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `adjustment_qty` double(20,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`adjustment_id`),
  KEY `item_id` (`item_id`),
  KEY `store_id` (`store_id`),
  KEY `warehouse_id` (`warehouse_id`),
  CONSTRAINT `db_stockadjustmentitems_ibfk_1` FOREIGN KEY (`adjustment_id`) REFERENCES `db_stockadjustment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stockadjustmentitems_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `db_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stockadjustmentitems_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stockadjustmentitems_ibfk_4` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_stockadjustmentitems` */

/*Table structure for table `db_stockentry` */

DROP TABLE IF EXISTS `db_stockentry`;

CREATE TABLE `db_stockentry` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `entry_date` date DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `qty` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_stockentry` */

/*Table structure for table `db_stocktransfer` */

DROP TABLE IF EXISTS `db_stocktransfer`;

CREATE TABLE `db_stocktransfer` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL COMMENT 'from store',
  `to_store_id` int(11) DEFAULT NULL COMMENT 'to store transfer',
  `warehouse_from` int(5) DEFAULT NULL,
  `warehouse_to` int(5) DEFAULT NULL,
  `transfer_date` date DEFAULT NULL,
  `note` text CHARACTER SET latin1,
  `created_by` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `warehouse_id` (`warehouse_from`),
  KEY `warehouse_to` (`warehouse_to`),
  KEY `db_stocktransfer_ibfk_4` (`to_store_id`),
  CONSTRAINT `db_stocktransfer_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stocktransfer_ibfk_2` FOREIGN KEY (`warehouse_from`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stocktransfer_ibfk_3` FOREIGN KEY (`warehouse_to`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stocktransfer_ibfk_4` FOREIGN KEY (`to_store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_stocktransfer` */

/*Table structure for table `db_stocktransferitems` */

DROP TABLE IF EXISTS `db_stocktransferitems`;

CREATE TABLE `db_stocktransferitems` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `stocktransfer_id` int(5) DEFAULT NULL,
  `store_id` int(5) DEFAULT NULL COMMENT 'from store',
  `to_store_id` int(5) DEFAULT NULL COMMENT 'to store',
  `warehouse_from` int(5) DEFAULT NULL COMMENT 'warehouse ids',
  `warehouse_to` int(11) DEFAULT NULL COMMENT 'warehouse ids',
  `item_id` int(11) DEFAULT NULL,
  `transfer_qty` double(20,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `warehouse_from` (`warehouse_from`),
  KEY `warehouse_to` (`warehouse_to`),
  KEY `stocktranfer_id` (`stocktransfer_id`),
  KEY `item_id` (`item_id`),
  KEY `db_stocktransferitems_ibfk_6` (`to_store_id`),
  CONSTRAINT `db_stocktransferitems_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stocktransferitems_ibfk_2` FOREIGN KEY (`warehouse_from`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stocktransferitems_ibfk_3` FOREIGN KEY (`warehouse_to`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stocktransferitems_ibfk_4` FOREIGN KEY (`stocktransfer_id`) REFERENCES `db_stocktransfer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stocktransferitems_ibfk_5` FOREIGN KEY (`item_id`) REFERENCES `db_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_stocktransferitems_ibfk_6` FOREIGN KEY (`to_store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_stocktransferitems` */

/*Table structure for table `db_store` */

DROP TABLE IF EXISTS `db_store`;

CREATE TABLE `db_store` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_code` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_website` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_logo` text COLLATE utf8mb4_unicode_ci,
  `logo` mediumtext COLLATE utf8mb4_unicode_ci,
  `upi_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upi_code` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` mediumtext COLLATE utf8mb4_unicode_ci,
  `cid` int(50) DEFAULT NULL,
  `category_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `supplier_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_return_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_return_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accounts_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `journal_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cust_advance_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_view` int(5) DEFAULT NULL COMMENT '1=Standard,2=Indian GST',
  `sms_status` int(1) DEFAULT NULL COMMENT '1=Enable 0=Disable',
  `status` int(1) DEFAULT NULL,
  `language_id` int(5) DEFAULT NULL,
  `currency_id` int(5) DEFAULT NULL,
  `currency_placement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` int(5) DEFAULT NULL,
  `sales_discount` double(20,4) DEFAULT NULL,
  `currencysymbol_id` int(5) DEFAULT NULL,
  `regno_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fav_icon` text COLLATE utf8mb4_unicode_ci,
  `purchase_code` text COLLATE utf8mb4_unicode_ci,
  `change_return` int(2) DEFAULT NULL,
  `sales_invoice_format_id` int(5) DEFAULT NULL,
  `pos_invoice_format_id` int(5) DEFAULT NULL,
  `sales_invoice_footer_text` text COLLATE utf8mb4_unicode_ci,
  `round_off` int(1) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimals` int(1) DEFAULT '2',
  `money_transfer_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_payment_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_return_payment_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_payment_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_return_payment_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_payment_init` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_subscriptionlist_id` int(10) DEFAULT '0',
  `smtp_host` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_port` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_user` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_pass` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_status` int(1) DEFAULT '0',
  `sms_url` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(5) NOT NULL,
  `mrp_column` int(1) DEFAULT '0',
  `qty_decimals` int(5) DEFAULT '2',
  `signature` text COLLATE utf8mb4_unicode_ci,
  `show_signature` int(1) DEFAULT '0',
  `invoice_terms` text COLLATE utf8mb4_unicode_ci,
  `previous_balance_bit` int(1) DEFAULT '1' COMMENT '1=Show, 0=Hide - Shows on sales invoice',
  `t_and_c_status` int(1) DEFAULT '1' COMMENT '1=Show, 0=Hide - Shows on sales invoice',
  `t_and_c_status_pos` int(1) DEFAULT '1',
  `number_to_words` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT 'Default',
  `default_account_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_store` */

insert  into `db_store`(`id`,`store_code`,`store_name`,`store_website`,`mobile`,`phone`,`email`,`website`,`store_logo`,`logo`,`upi_id`,`upi_code`,`country`,`state`,`city`,`address`,`postcode`,`gst_no`,`vat_no`,`pan_no`,`bank_details`,`cid`,`category_init`,`item_init`,`supplier_init`,`purchase_init`,`purchase_return_init`,`customer_init`,`sales_init`,`sales_return_init`,`expense_init`,`accounts_init`,`journal_init`,`cust_advance_init`,`invoice_view`,`sms_status`,`status`,`language_id`,`currency_id`,`currency_placement`,`timezone`,`date_format`,`time_format`,`sales_discount`,`currencysymbol_id`,`regno_key`,`fav_icon`,`purchase_code`,`change_return`,`sales_invoice_format_id`,`pos_invoice_format_id`,`sales_invoice_footer_text`,`round_off`,`created_date`,`created_time`,`created_by`,`system_ip`,`system_name`,`quotation_init`,`decimals`,`money_transfer_init`,`sales_payment_init`,`sales_return_payment_init`,`purchase_payment_init`,`purchase_return_payment_init`,`expense_payment_init`,`current_subscriptionlist_id`,`smtp_host`,`smtp_port`,`smtp_user`,`smtp_pass`,`smtp_status`,`sms_url`,`user_id`,`mrp_column`,`qty_decimals`,`signature`,`show_signature`,`invoice_terms`,`previous_balance_bit`,`t_and_c_status`,`t_and_c_status_pos`,`number_to_words`,`default_account_id`) values (1,'ST0001','SAAS ADMIN','','+919999999999','','admin@example.com','www','uploads/store/company_logo.png',NULL,NULL,NULL,'India','Karnataka','Bengalore','Gandhi Road','','','','','',NULL,'CT/01/','IT01','SU/01/','PU/2020/01','PR/2020/01/','CU/01/','SL/2020/01/','SR/2020/01/','EX/2020/01/','AC/01/','JE','ADV',1,0,1,1,35,'Left','Asia/Kolkata\r\n','dd-mm-yyyy',12,0.0000,NULL,NULL,NULL,NULL,1,3,1,'Its Footer, You can change it from Store Settings.',0,NULL,NULL,NULL,NULL,NULL,'QT/2020/01/',2,'MT/01/','SP/2020/01/','SRP/2020/01/','PP/2020/01/','PRP/2020/01/','XP/2020/01/',26,'','','','',1,'',0,0,2,NULL,0,NULL,1,1,1,'Default',NULL),(2,'ST0002','Billing Book','','9999999999','','billingbook@email.com',NULL,NULL,NULL,NULL,NULL,'India','Karnataka','Chikodi','AP: Belgaum','','','','','',NULL,'CT/02/','IT02','SU/02/','PU/2021/02/','PR/2021/02/','CU/02/','SL/2021/02/','SR/2021/02/','EX/2021/02/','AC/02/',NULL,'ADV',1,2,1,1,35,'Left','Asia/Calcutta\r\n','dd-mm-yyyy',12,0.0000,NULL,NULL,NULL,NULL,1,3,1,'This is footer text. It is in Store Management.',1,'2021-02-12','05:53:37 pm','','127.0.0.1','LAPTOP-I5OUIM4R','QT/2021/02/',3,'MT/02/','SP/2021/02/','SRP/2021/02/','PP/2021/02/','PRP/2021/02/','XP/2021/02/',28,NULL,NULL,NULL,NULL,0,NULL,0,0,2,NULL,0,NULL,1,1,1,'Default',NULL);

/*Table structure for table `db_stripe` */

DROP TABLE IF EXISTS `db_stripe`;

CREATE TABLE `db_stripe` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `sandbox` int(1) DEFAULT NULL,
  `publishable_key` text CHARACTER SET utf8mb4,
  `api_secret` text CHARACTER SET utf8mb4,
  `updated_at` date DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_stripe_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_stripe` */

/*Table structure for table `db_stripepayments` */

DROP TABLE IF EXISTS `db_stripepayments`;

CREATE TABLE `db_stripepayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `buyer_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `buyer_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paid_amount` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paid_amount_currency` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `txn_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_stripepayments` */

/*Table structure for table `db_subscription` */

DROP TABLE IF EXISTS `db_subscription`;

CREATE TABLE `db_subscription` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `payment_id` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `package_id` int(5) DEFAULT NULL,
  `package_type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `package_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4,
  `subscription_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `trial_days` int(10) DEFAULT NULL,
  `max_users` int(10) DEFAULT NULL,
  `max_warehouses` int(10) DEFAULT NULL,
  `max_items` int(10) DEFAULT NULL,
  `max_invoices` int(10) DEFAULT NULL,
  `payment_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `txn_id` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment_gross` double(10,2) DEFAULT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payer_email` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment_status` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `package_status` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'manual subscription only',
  `package_count` int(10) DEFAULT NULL COMMENT 'manual subscription only',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_subscription` */

insert  into `db_subscription`(`id`,`store_id`,`payment_id`,`package_id`,`package_type`,`package_name`,`description`,`subscription_date`,`expire_date`,`trial_days`,`max_users`,`max_warehouses`,`max_items`,`max_invoices`,`payment_by`,`txn_id`,`payment_gross`,`currency_code`,`payer_email`,`payment_status`,`created_date`,`created_time`,`created_by`,`system_ip`,`system_name`,`package_status`,`payment_type`,`package_count`) values (13,22,NULL,2,NULL,'Regular','Test description','2021-01-25',NULL,15,20,20,200,200,'PayPal','48R18927X78299709',250.00,'USD','sb-9fy504805522@business.example.com','Pending','2021-01-25','01:30:45 pm','Tester','127.0.0.1','LAPTOP-I5OUIM4R',NULL,NULL,NULL),(14,22,NULL,2,'Paid','Regular','Test description','2021-01-25',NULL,15,20,20,200,200,'PayPal','9M838440FH9266015',250.00,'USD','sb-9fy504805522@business.example.com','Pending','2021-01-25','01:32:28 pm','Tester','127.0.0.1','LAPTOP-I5OUIM4R',NULL,NULL,NULL),(16,22,NULL,2,'Paid','Regular','Test description','2021-01-25','2021-02-25',15,20,20,200,200,'PayPal','2PT61144W90213341',250.00,'USD','sb-9fy504805522@business.example.com','Pending','2021-01-25','02:00:38 pm','Tester','127.0.0.1','LAPTOP-I5OUIM4R',NULL,NULL,NULL),(26,1,NULL,1,'Free','Free','Test description','2021-01-25','2021-02-04',10,2,2,20,20,'Self','',0.00,'','','','2021-01-25','06:32:32 pm','admin','127.0.0.1','LAPTOP-I5OUIM4R',NULL,NULL,NULL),(27,24,NULL,1,'Free','Free','Test description','2021-02-11','2021-02-21',10,2,2,20,20,'Self','',0.00,'','','','2021-02-11','03:09:47 pm','Tester','127.0.0.1','LAPTOP-I5OUIM4R',NULL,NULL,NULL),(28,2,NULL,1,'Free','Free','Test description','2021-02-12','2021-02-22',10,2,2,20,20,'Self','',0.00,'','','','2021-02-12','06:57:18 pm','Tester','127.0.0.1','LAPTOP-I5OUIM4R',NULL,NULL,NULL);

/*Table structure for table `db_supplier_payments` */

DROP TABLE IF EXISTS `db_supplier_payments`;

CREATE TABLE `db_supplier_payments` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `purchasepayment_id` int(5) DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` text CHARACTER SET utf8mb4,
  `system_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `system_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_time` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_date` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `purchasepayment_id` (`purchasepayment_id`),
  CONSTRAINT `db_supplier_payments_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `db_suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_supplier_payments_ibfk_2` FOREIGN KEY (`purchasepayment_id`) REFERENCES `db_purchasepayments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_supplier_payments` */

/*Table structure for table `db_suppliers` */

DROP TABLE IF EXISTS `db_suppliers`;

CREATE TABLE `db_suppliers` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `count_id` int(10) DEFAULT NULL COMMENT 'Use to create supplier Code',
  `supplier_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gstin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vatin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance` double(20,4) DEFAULT NULL,
  `purchase_due` double(20,4) DEFAULT NULL,
  `purchase_return_due` double(20,4) DEFAULT NULL,
  `country_id` int(5) DEFAULT NULL,
  `state_id` int(5) DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_suppliers_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_suppliers` */

/*Table structure for table `db_tax` */

DROP TABLE IF EXISTS `db_tax`;

CREATE TABLE `db_tax` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `tax_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` double(20,4) DEFAULT NULL,
  `group_bit` int(1) DEFAULT NULL COMMENT '1=Yes, 0=No',
  `subtax_ids` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tax groups IDs',
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_tax_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_tax` */

/*Table structure for table `db_timezone` */

DROP TABLE IF EXISTS `db_timezone`;

CREATE TABLE `db_timezone` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `timezone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=549 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_timezone` */

insert  into `db_timezone`(`id`,`timezone`,`status`) values (1,'Africa/Abidjan\r',1),(2,'Africa/Accra\r',1),(3,'Africa/Addis_Ababa\r',1),(4,'Africa/Algiers\r',1),(5,'Africa/Asmara\r',1),(6,'Africa/Asmera\r',1),(7,'Africa/Bamako\r',1),(8,'Africa/Bangui\r',1),(9,'Africa/Banjul\r',1),(10,'Africa/Bissau\r',1),(11,'Africa/Blantyre\r',1),(12,'Africa/Brazzaville\r',1),(13,'Africa/Bujumbura\r',1),(14,'Africa/Cairo\r',1),(15,'Africa/Casablanca\r',1),(16,'Africa/Ceuta\r',1),(17,'Africa/Conakry\r',1),(18,'Africa/Dakar\r',1),(19,'Africa/Dar_es_Salaam\r',1),(20,'Africa/Djibouti\r',1),(21,'Africa/Douala\r',1),(22,'Africa/El_Aaiun\r',1),(23,'Africa/Freetown\r',1),(24,'Africa/Gaborone\r',1),(25,'Africa/Harare\r',1),(26,'Africa/Johannesburg\r',1),(27,'Africa/Juba\r',1),(28,'Africa/Kampala\r',1),(29,'Africa/Khartoum\r',1),(30,'Africa/Kigali\r',1),(31,'Africa/Kinshasa\r',1),(32,'Africa/Lagos\r',1),(33,'Africa/Libreville\r',1),(34,'Africa/Lome\r',1),(35,'Africa/Luanda\r',1),(36,'Africa/Lubumbashi\r',1),(37,'Africa/Lusaka\r',1),(38,'Africa/Malabo\r',1),(39,'Africa/Maputo\r',1),(40,'Africa/Maseru\r',1),(41,'Africa/Mbabane\r',1),(42,'Africa/Mogadishu\r',1),(43,'Africa/Monrovia\r',1),(44,'Africa/Nairobi\r',1),(45,'Africa/Ndjamena\r',1),(46,'Africa/Niamey\r',1),(47,'Africa/Nouakchott\r',1),(48,'Africa/Ouagadougou\r',1),(49,'Africa/Porto-Novo\r',1),(50,'Africa/Sao_Tome\r',1),(51,'Africa/Timbuktu\r',1),(52,'Africa/Tripoli\r',1),(53,'Africa/Tunis\r',1),(54,'Africa/Windhoek\r',1),(55,'AKST9AKDT\r',1),(56,'America/Adak\r',1),(57,'America/Anchorage\r',1),(58,'America/Anguilla\r',1),(59,'America/Antigua\r',1),(60,'America/Araguaina\r',1),(61,'America/Argentina/Buenos_Aires\r',1),(62,'America/Argentina/Catamarca\r',1),(63,'America/Argentina/ComodRivadavia\r',1),(64,'America/Argentina/Cordoba\r',1),(65,'America/Argentina/Jujuy\r',1),(66,'America/Argentina/La_Rioja\r',1),(67,'America/Argentina/Mendoza\r',1),(68,'America/Argentina/Rio_Gallegos\r',1),(69,'America/Argentina/Salta\r',1),(70,'America/Argentina/San_Juan\r',1),(71,'America/Argentina/San_Luis\r',1),(72,'America/Argentina/Tucuman\r',1),(73,'America/Argentina/Ushuaia\r',1),(74,'America/Aruba\r',1),(75,'America/Asuncion\r',1),(76,'America/Atikokan\r',1),(77,'America/Atka\r',1),(78,'America/Bahia\r',1),(79,'America/Bahia_Banderas\r',1),(80,'America/Barbados\r',1),(81,'America/Belem\r',1),(82,'America/Belize\r',1),(83,'America/Blanc-Sablon\r',1),(84,'America/Boa_Vista\r',1),(85,'America/Bogota\r',1),(86,'America/Boise\r',1),(87,'America/Buenos_Aires\r',1),(88,'America/Cambridge_Bay\r',1),(89,'America/Campo_Grande\r',1),(90,'America/Cancun\r',1),(91,'America/Caracas\r',1),(92,'America/Catamarca\r',1),(93,'America/Cayenne\r',1),(94,'America/Cayman\r',1),(95,'America/Chicago\r',1),(96,'America/Chihuahua\r',1),(97,'America/Coral_Harbour\r',1),(98,'America/Cordoba\r',1),(99,'America/Costa_Rica\r',1),(100,'America/Creston\r',1),(101,'America/Cuiaba\r',1),(102,'America/Curacao\r',1),(103,'America/Danmarkshavn\r',1),(104,'America/Dawson\r',1),(105,'America/Dawson_Creek\r',1),(106,'America/Denver\r',1),(107,'America/Detroit\r',1),(108,'America/Dominica\r',1),(109,'America/Edmonton\r',1),(110,'America/Eirunepe\r',1),(111,'America/El_Salvador\r',1),(112,'America/Ensenada\r',1),(113,'America/Fort_Wayne\r',1),(114,'America/Fortaleza\r',1),(115,'America/Glace_Bay\r',1),(116,'America/Godthab\r',1),(117,'America/Goose_Bay\r',1),(118,'America/Grand_Turk\r',1),(119,'America/Grenada\r',1),(120,'America/Guadeloupe\r',1),(121,'America/Guatemala\r',1),(122,'America/Guayaquil\r',1),(123,'America/Guyana\r',1),(124,'America/Halifax\r',1),(125,'America/Havana\r',1),(126,'America/Hermosillo\r',1),(127,'America/Indiana/Indianapolis\r',1),(128,'America/Indiana/Knox\r',1),(129,'America/Indiana/Marengo\r',1),(130,'America/Indiana/Petersburg\r',1),(131,'America/Indiana/Tell_City\r',1),(132,'America/Indiana/Vevay\r',1),(133,'America/Indiana/Vincennes\r',1),(134,'America/Indiana/Winamac\r',1),(135,'America/Indianapolis\r',1),(136,'America/Inuvik\r',1),(137,'America/Iqaluit\r',1),(138,'America/Jamaica\r',1),(139,'America/Jujuy\r',1),(140,'America/Juneau\r',1),(141,'America/Kentucky/Louisville\r',1),(142,'America/Kentucky/Monticello\r',1),(143,'America/Knox_IN\r',1),(144,'America/Kralendijk\r',1),(145,'America/La_Paz\r',1),(146,'America/Lima\r',1),(147,'America/Los_Angeles\r',1),(148,'America/Louisville\r',1),(149,'America/Lower_Princes\r',1),(150,'America/Maceio\r',1),(151,'America/Managua\r',1),(152,'America/Manaus\r',1),(153,'America/Marigot\r',1),(154,'America/Martinique\r',1),(155,'America/Matamoros\r',1),(156,'America/Mazatlan\r',1),(157,'America/Mendoza\r',1),(158,'America/Menominee\r',1),(159,'America/Merida\r',1),(160,'America/Metlakatla\r',1),(161,'America/Mexico_City\r',1),(162,'America/Miquelon\r',1),(163,'America/Moncton\r',1),(164,'America/Monterrey\r',1),(165,'America/Montevideo\r',1),(166,'America/Montreal\r',1),(167,'America/Montserrat\r',1),(168,'America/Nassau\r',1),(169,'America/New_York\r',1),(170,'America/Nipigon\r',1),(171,'America/Nome\r',1),(172,'America/Noronha\r',1),(173,'America/North_Dakota/Beulah\r',1),(174,'America/North_Dakota/Center\r',1),(175,'America/North_Dakota/New_Salem\r',1),(176,'America/Ojinaga\r',1),(177,'America/Panama\r',1),(178,'America/Pangnirtung\r',1),(179,'America/Paramaribo\r',1),(180,'America/Phoenix\r',1),(181,'America/Port_of_Spain\r',1),(182,'America/Port-au-Prince\r',1),(183,'America/Porto_Acre\r',1),(184,'America/Porto_Velho\r',1),(185,'America/Puerto_Rico\r',1),(186,'America/Rainy_River\r',1),(187,'America/Rankin_Inlet\r',1),(188,'America/Recife\r',1),(189,'America/Regina\r',1),(190,'America/Resolute\r',1),(191,'America/Rio_Branco\r',1),(192,'America/Rosario\r',1),(193,'America/Santa_Isabel\r',1),(194,'America/Santarem\r',1),(195,'America/Santiago\r',1),(196,'America/Santo_Domingo\r',1),(197,'America/Sao_Paulo\r',1),(198,'America/Scoresbysund\r',1),(199,'America/Shiprock\r',1),(200,'America/Sitka\r',1),(201,'America/St_Barthelemy\r',1),(202,'America/St_Johns\r',1),(203,'America/St_Kitts\r',1),(204,'America/St_Lucia\r',1),(205,'America/St_Thomas\r',1),(206,'America/St_Vincent\r',1),(207,'America/Swift_Current\r',1),(208,'America/Tegucigalpa\r',1),(209,'America/Thule\r',1),(210,'America/Thunder_Bay\r',1),(211,'America/Tijuana\r',1),(212,'America/Toronto\r',1),(213,'America/Tortola\r',1),(214,'America/Vancouver\r',1),(215,'America/Virgin\r',1),(216,'America/Whitehorse\r',1),(217,'America/Winnipeg\r',1),(218,'America/Yakutat\r',1),(219,'America/Yellowknife\r',1),(220,'Antarctica/Casey\r',1),(221,'Antarctica/Davis\r',1),(222,'Antarctica/DumontDUrville\r',1),(223,'Antarctica/Macquarie\r',1),(224,'Antarctica/Mawson\r',1),(225,'Antarctica/McMurdo\r',1),(226,'Antarctica/Palmer\r',1),(227,'Antarctica/Rothera\r',1),(228,'Antarctica/South_Pole\r',1),(229,'Antarctica/Syowa\r',1),(230,'Antarctica/Vostok\r',1),(231,'Arctic/Longyearbyen\r',1),(232,'Asia/Aden\r',1),(233,'Asia/Almaty\r',1),(234,'Asia/Amman\r',1),(235,'Asia/Anadyr\r',1),(236,'Asia/Aqtau\r',1),(237,'Asia/Aqtobe\r',1),(238,'Asia/Ashgabat\r',1),(239,'Asia/Ashkhabad\r',1),(240,'Asia/Baghdad\r',1),(241,'Asia/Bahrain\r',1),(242,'Asia/Baku\r',1),(243,'Asia/Bangkok\r',1),(244,'Asia/Beirut\r',1),(245,'Asia/Bishkek\r',1),(246,'Asia/Brunei\r',1),(247,'Asia/Calcutta\r',1),(248,'Asia/Choibalsan\r',1),(249,'Asia/Chongqing\r',1),(250,'Asia/Chungking\r',1),(251,'Asia/Colombo\r',1),(252,'Asia/Dacca\r',1),(253,'Asia/Damascus\r',1),(254,'Asia/Dhaka\r',1),(255,'Asia/Dili\r',1),(256,'Asia/Dubai\r',1),(257,'Asia/Dushanbe\r',1),(258,'Asia/Gaza\r',1),(259,'Asia/Harbin\r',1),(260,'Asia/Hebron\r',1),(261,'Asia/Ho_Chi_Minh\r',1),(262,'Asia/Hong_Kong\r',1),(263,'Asia/Hovd\r',1),(264,'Asia/Irkutsk\r',1),(265,'Asia/Istanbul\r',1),(266,'Asia/Jakarta\r',1),(267,'Asia/Jayapura\r',1),(268,'Asia/Jerusalem\r',1),(269,'Asia/Kabul\r',1),(270,'Asia/Kamchatka\r',1),(271,'Asia/Karachi\r',1),(272,'Asia/Kashgar\r',1),(273,'Asia/Kathmandu\r',1),(274,'Asia/Katmandu\r',1),(275,'Asia/Kolkata\r',1),(276,'Asia/Krasnoyarsk\r',1),(277,'Asia/Kuala_Lumpur\r',1),(278,'Asia/Kuching\r',1),(279,'Asia/Kuwait\r',1),(280,'Asia/Macao\r',1),(281,'Asia/Macau\r',1),(282,'Asia/Magadan\r',1),(283,'Asia/Makassar\r',1),(284,'Asia/Manila\r',1),(285,'Asia/Muscat\r',1),(286,'Asia/Nicosia\r',1),(287,'Asia/Novokuznetsk\r',1),(288,'Asia/Novosibirsk\r',1),(289,'Asia/Omsk\r',1),(290,'Asia/Oral\r',1),(291,'Asia/Phnom_Penh\r',1),(292,'Asia/Pontianak\r',1),(293,'Asia/Pyongyang\r',1),(294,'Asia/Qatar\r',1),(295,'Asia/Qyzylorda\r',1),(296,'Asia/Rangoon\r',1),(297,'Asia/Riyadh\r',1),(298,'Asia/Saigon\r',1),(299,'Asia/Sakhalin\r',1),(300,'Asia/Samarkand\r',1),(301,'Asia/Seoul\r',1),(302,'Asia/Shanghai\r',1),(303,'Asia/Singapore\r',1),(304,'Asia/Taipei\r',1),(305,'Asia/Tashkent\r',1),(306,'Asia/Tbilisi\r',1),(307,'Asia/Tehran\r',1),(308,'Asia/Tel_Aviv\r',1),(309,'Asia/Thimbu\r',1),(310,'Asia/Thimphu\r',1),(311,'Asia/Tokyo\r',1),(312,'Asia/Ujung_Pandang\r',1),(313,'Asia/Ulaanbaatar\r',1),(314,'Asia/Ulan_Bator\r',1),(315,'Asia/Urumqi\r',1),(316,'Asia/Vientiane\r',1),(317,'Asia/Vladivostok\r',1),(318,'Asia/Yakutsk\r',1),(319,'Asia/Yekaterinburg\r',1),(320,'Asia/Yerevan\r',1),(321,'Atlantic/Azores\r',1),(322,'Atlantic/Bermuda\r',1),(323,'Atlantic/Canary\r',1),(324,'Atlantic/Cape_Verde\r',1),(325,'Atlantic/Faeroe\r',1),(326,'Atlantic/Faroe\r',1),(327,'Atlantic/Jan_Mayen\r',1),(328,'Atlantic/Madeira\r',1),(329,'Atlantic/Reykjavik\r',1),(330,'Atlantic/South_Georgia\r',1),(331,'Atlantic/St_Helena\r',1),(332,'Atlantic/Stanley\r',1),(333,'Australia/ACT\r',1),(334,'Australia/Adelaide\r',1),(335,'Australia/Brisbane\r',1),(336,'Australia/Broken_Hill\r',1),(337,'Australia/Canberra\r',1),(338,'Australia/Currie\r',1),(339,'Australia/Darwin\r',1),(340,'Australia/Eucla\r',1),(341,'Australia/Hobart\r',1),(342,'Australia/LHI\r',1),(343,'Australia/Lindeman\r',1),(344,'Australia/Lord_Howe\r',1),(345,'Australia/Melbourne\r',1),(346,'Australia/North\r',1),(347,'Australia/NSW\r',1),(348,'Australia/Perth\r',1),(349,'Australia/Queensland\r',1),(350,'Australia/South\r',1),(351,'Australia/Sydney\r',1),(352,'Australia/Tasmania\r',1),(353,'Australia/Victoria\r',1),(354,'Australia/West\r',1),(355,'Australia/Yancowinna\r',1),(356,'Brazil/Acre\r',1),(357,'Brazil/DeNoronha\r',1),(358,'Brazil/East\r',1),(359,'Brazil/West\r',1),(360,'Canada/Atlantic\r',1),(361,'Canada/Central\r',1),(362,'Canada/Eastern\r',1),(363,'Canada/East-Saskatchewan\r',1),(364,'Canada/Mountain\r',1),(365,'Canada/Newfoundland\r',1),(366,'Canada/Pacific\r',1),(367,'Canada/Saskatchewan\r',1),(368,'Canada/Yukon\r',1),(369,'CET\r',1),(370,'Chile/Continental\r',1),(371,'Chile/EasterIsland\r',1),(372,'CST6CDT\r',1),(373,'Cuba\r',1),(374,'EET\r',1),(375,'Egypt\r',1),(376,'Eire\r',1),(377,'EST\r',1),(378,'EST5EDT\r',1),(379,'Etc./GMT\r',1),(380,'Etc./GMT+0\r',1),(381,'Etc./UCT\r',1),(382,'Etc./Universal\r',1),(383,'Etc./UTC\r',1),(384,'Etc./Zulu\r',1),(385,'Europe/Amsterdam\r',1),(386,'Europe/Andorra\r',1),(387,'Europe/Athens\r',1),(388,'Europe/Belfast\r',1),(389,'Europe/Belgrade\r',1),(390,'Europe/Berlin\r',1),(391,'Europe/Bratislava\r',1),(392,'Europe/Brussels\r',1),(393,'Europe/Bucharest\r',1),(394,'Europe/Budapest\r',1),(395,'Europe/Chisinau\r',1),(396,'Europe/Copenhagen\r',1),(397,'Europe/Dublin\r',1),(398,'Europe/Gibraltar\r',1),(399,'Europe/Guernsey\r',1),(400,'Europe/Helsinki\r',1),(401,'Europe/Isle_of_Man\r',1),(402,'Europe/Istanbul\r',1),(403,'Europe/Jersey\r',1),(404,'Europe/Kaliningrad\r',1),(405,'Europe/Kiev\r',1),(406,'Europe/Lisbon\r',1),(407,'Europe/Ljubljana\r',1),(408,'Europe/London\r',1),(409,'Europe/Luxembourg\r',1),(410,'Europe/Madrid\r',1),(411,'Europe/Malta\r',1),(412,'Europe/Mariehamn\r',1),(413,'Europe/Minsk\r',1),(414,'Europe/Monaco\r',1),(415,'Europe/Moscow\r',1),(416,'Europe/Nicosia\r',1),(417,'Europe/Oslo\r',1),(418,'Europe/Paris\r',1),(419,'Europe/Podgorica\r',1),(420,'Europe/Prague\r',1),(421,'Europe/Riga\r',1),(422,'Europe/Rome\r',1),(423,'Europe/Samara\r',1),(424,'Europe/San_Marino\r',1),(425,'Europe/Sarajevo\r',1),(426,'Europe/Simferopol\r',1),(427,'Europe/Skopje\r',1),(428,'Europe/Sofia\r',1),(429,'Europe/Stockholm\r',1),(430,'Europe/Tallinn\r',1),(431,'Europe/Tirane\r',1),(432,'Europe/Tiraspol\r',1),(433,'Europe/Uzhgorod\r',1),(434,'Europe/Vaduz\r',1),(435,'Europe/Vatican\r',1),(436,'Europe/Vienna\r',1),(437,'Europe/Vilnius\r',1),(438,'Europe/Volgograd\r',1),(439,'Europe/Warsaw\r',1),(440,'Europe/Zagreb\r',1),(441,'Europe/Zaporozhye\r',1),(442,'Europe/Zurich\r',1),(443,'GB\r',1),(444,'GB-Eire\r',1),(445,'GMT\r',1),(446,'GMT+0\r',1),(447,'GMT0\r',1),(448,'GMT-0\r',1),(449,'Greenwich\r',1),(450,'Hong Kong\r',1),(451,'HST\r',1),(452,'Iceland\r',1),(453,'Indian/Antananarivo\r',1),(454,'Indian/Chagos\r',1),(455,'Indian/Christmas\r',1),(456,'Indian/Cocos\r',1),(457,'Indian/Comoro\r',1),(458,'Indian/Kerguelen\r',1),(459,'Indian/Mahe\r',1),(460,'Indian/Maldives\r',1),(461,'Indian/Mauritius\r',1),(462,'Indian/Mayotte\r',1),(463,'Indian/Reunion\r',1),(464,'Iran\r',1),(465,'Israel\r',1),(466,'Jamaica\r',1),(467,'Japan\r',1),(468,'JST-9\r',1),(469,'Kwajalein\r',1),(470,'Libya\r',1),(471,'MET\r',1),(472,'Mexico/BajaNorte\r',1),(473,'Mexico/BajaSur\r',1),(474,'Mexico/General\r',1),(475,'MST\r',1),(476,'MST7MDT\r',1),(477,'Navajo\r',1),(478,'NZ\r',1),(479,'NZ-CHAT\r',1),(480,'Pacific/Apia\r',1),(481,'Pacific/Auckland\r',1),(482,'Pacific/Chatham\r',1),(483,'Pacific/Chuuk\r',1),(484,'Pacific/Easter\r',1),(485,'Pacific/Efate\r',1),(486,'Pacific/Enderbury\r',1),(487,'Pacific/Fakaofo\r',1),(488,'Pacific/Fiji\r',1),(489,'Pacific/Funafuti\r',1),(490,'Pacific/Galapagos\r',1),(491,'Pacific/Gambier\r',1),(492,'Pacific/Guadalcanal\r',1),(493,'Pacific/Guam\r',1),(494,'Pacific/Honolulu\r',1),(495,'Pacific/Johnston\r',1),(496,'Pacific/Kiritimati\r',1),(497,'Pacific/Kosrae\r',1),(498,'Pacific/Kwajalein\r',1),(499,'Pacific/Majuro\r',1),(500,'Pacific/Marquesas\r',1),(501,'Pacific/Midway\r',1),(502,'Pacific/Nauru\r',1),(503,'Pacific/Niue\r',1),(504,'Pacific/Norfolk\r',1),(505,'Pacific/Noumea\r',1),(506,'Pacific/Pago_Pago\r',1),(507,'Pacific/Palau\r',1),(508,'Pacific/Pitcairn\r',1),(509,'Pacific/Pohnpei\r',1),(510,'Pacific/Ponape\r',1),(511,'Pacific/Port_Moresby\r',1),(512,'Pacific/Rarotonga\r',1),(513,'Pacific/Saipan\r',1),(514,'Pacific/Samoa\r',1),(515,'Pacific/Tahiti\r',1),(516,'Pacific/Tarawa\r',1),(517,'Pacific/Tongatapu\r',1),(518,'Pacific/Truk\r',1),(519,'Pacific/Wake\r',1),(520,'Pacific/Wallis\r',1),(521,'Pacific/Yap\r',1),(522,'Poland\r',1),(523,'Portugal\r',1),(524,'PRC\r',1),(525,'PST8PDT\r',1),(526,'ROC\r',1),(527,'ROK\r',1),(528,'Singapore\r',1),(529,'Turkey\r',1),(530,'UCT\r',1),(531,'Universal\r',1),(532,'US/Alaska\r',1),(533,'US/Aleutian\r',1),(534,'US/Arizona\r',1),(535,'US/Central\r',1),(536,'US/Eastern\r',1),(537,'US/East-Indiana\r',1),(538,'US/Hawaii\r',1),(539,'US/Indiana-Starke\r',1),(540,'US/Michigan\r',1),(541,'US/Mountain\r',1),(542,'US/Pacific\r',1),(543,'US/Pacific-New\r',1),(544,'US/Samoa\r',1),(545,'UTC\r',1),(546,'WET\r',1),(547,'W-SU\r',1),(548,'Zulu\r',1);

/*Table structure for table `db_twilio` */

DROP TABLE IF EXISTS `db_twilio`;

CREATE TABLE `db_twilio` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `account_sid` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `auth_token` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `twilio_phone` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_twilio_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_twilio` */

insert  into `db_twilio`(`id`,`store_id`,`account_sid`,`auth_token`,`twilio_phone`,`status`) values (1,1,'','','',0),(3,2,'','','',0);

/*Table structure for table `db_units` */

DROP TABLE IF EXISTS `db_units`;

CREATE TABLE `db_units` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `unit_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_units_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_units` */

/*Table structure for table `db_users` */

DROP TABLE IF EXISTS `db_users`;

CREATE TABLE `db_users` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` blob,
  `member_of` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` blob,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` blob,
  `postcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(5) DEFAULT NULL,
  `profile_picture` text COLLATE utf8mb4_unicode_ci,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` double DEFAULT NULL,
  `creater_id` int(5) DEFAULT NULL,
  `updater_id` int(5) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default_warehouse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_users_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_users` */

insert  into `db_users`(`id`,`store_id`,`username`,`first_name`,`last_name`,`password`,`member_of`,`firstname`,`lastname`,`mobile`,`email`,`photo`,`gender`,`dob`,`country`,`state`,`city`,`address`,`postcode`,`role_name`,`role_id`,`profile_picture`,`created_date`,`created_time`,`created_by`,`system_ip`,`system_name`,`status`,`creater_id`,`updater_id`,`updated_at`,`default_warehouse_id`) values (1,1,'super','Admin','Power','e10adc3949ba59abbe56e057f20f883e','',NULL,NULL,'','super@example.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'uploads/users/admin.png','2018-11-27','::1',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(2,2,'admin','Chris','Morris','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,'9999999999','admin@example.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'uploads/users/avatar1.png','2021-02-12','05:53:37 pm','','127.0.0.1','LAPTOP-I5OUIM4R',1,NULL,NULL,NULL,0);

/*Table structure for table `db_userswarehouses` */

DROP TABLE IF EXISTS `db_userswarehouses`;

CREATE TABLE `db_userswarehouses` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `warehouse_id` (`warehouse_id`),
  CONSTRAINT `db_userswarehouses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `db_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_userswarehouses_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_userswarehouses` */

/*Table structure for table `db_variants` */

DROP TABLE IF EXISTS `db_variants`;

CREATE TABLE `db_variants` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `variant_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_variants_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_variants_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_variants` */

/*Table structure for table `db_warehouse` */

DROP TABLE IF EXISTS `db_warehouse`;

CREATE TABLE `db_warehouse` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `warehouse_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `db_warehouse_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_warehouse` */

insert  into `db_warehouse`(`id`,`store_id`,`warehouse_type`,`warehouse_name`,`mobile`,`email`,`status`,`created_date`) values (1,1,'System','Warehouse-A','','warehouse_a@example.com',1,NULL),(2,2,'System','System Warehouse','','',1,NULL);

/*Table structure for table `db_warehouseitems` */

DROP TABLE IF EXISTS `db_warehouseitems`;

CREATE TABLE `db_warehouseitems` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `store_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `available_qty` double(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `db_warehouseitems_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `db_store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_warehouseitems_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `db_warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `db_warehouseitems_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `db_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `db_warehouseitems` */

/*Table structure for table `temp_holdinvoice` */

DROP TABLE IF EXISTS `temp_holdinvoice`;

CREATE TABLE `temp_holdinvoice` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(5) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `reference_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `item_qty` int(5) DEFAULT NULL,
  `item_price` double(10,2) DEFAULT NULL,
  `tax` double(10,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `temp_holdinvoice` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
