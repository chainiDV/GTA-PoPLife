# Host: localhost  (Version 5.5.5-10.1.37-MariaDB)
# Date: 2019-07-03 02:07:17
# Generator: MySQL-Front 6.1  (Build 1.5)


#
# Structure for table "items"
#

CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `label` varchar(255) CHARACTER SET utf8 NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '-1',
  `rare` int(11) NOT NULL DEFAULT '0',
  `can_remove` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "items"
#

INSERT INTO `items` VALUES (19,'carbon','Carbón',-1,0,1),(20,'oro','Oro',-1,0,1),(21,'hierro','Hierro',-1,0,1),(22,'plata','Plata',-1,0,1);
