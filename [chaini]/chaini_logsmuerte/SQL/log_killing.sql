# Host: localhost  (Version 5.5.5-10.1.37-MariaDB)
# Date: 2019-07-03 02:06:22
# Generator: MySQL-Front 6.1  (Build 1.5)


#
# Structure for table "log_killing"
#

CREATE TABLE `log_killing` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(25) CHARACTER SET latin1 NOT NULL,
  `log` varchar(144) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
