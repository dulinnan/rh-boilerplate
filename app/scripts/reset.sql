# MySQL scripts for dropping existing tables and recreating the database table structure
# version  0.0.1; 1 December 2018
# Note: WebStorm throws an annoying error 'expecting one of the following: ALGORITHM DEFINER SQL VIEW'. This is an erroneous error and the script should run successfully despite this error.

# Tables must be dropped in a particular order due to referential constraints i.e. foreign keys.

DROP TABLE IF EXISTS photo;
DROP TABLE IF EXISTS listing;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS admin_user;

# Tables must be created in a particular order due to referential constraints i.e. foreign keys.

CREATE TABLE admin_user (
  user_id int(10) NOT NULL AUTO_INCREMENT,
  user_givenname varchar(50) NOT NULL,
  user_familyname varchar(50) NOT NULL,
  user_email varchar(320) NOT NULL,
  user_password varchar(512) NOT NULL,
  user_salt varchar(128) DEFAULT NULL,
  user_token varchar(32) DEFAULT NULL,
  PRIMARY KEY (user_id),
  UNIQUE KEY user_id (user_id),
  UNIQUE KEY user_email (user_email),
  UNIQUE KEY user_token (user_token)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE category (
  category_id int(10) NOT NULL AUTO_INCREMENT,
  category_title varchar(50) NOT NULL,
  category_description varchar(256) DEFAULT NULL,
  PRIMARY KEY (category_id),
  UNIQUE KEY category_id (category_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE region (
  region_id int(10) NOT NULL AUTO_INCREMENT,
  region_title varchar(50) NOT NULL,
  region_description varchar(512) DEFAULT NULL,
  PRIMARY KEY (region_id),
  UNIQUE KEY region_id (region_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `listing` (
  `listing_id` int(10) NOT NULL AUTO_INCREMENT,
  `listing_categoryid` int(10) NOT NULL,
  `listing_rhcode` varchar(5) NOT NULL,
  `listing_location` varchar(128) NOT NULL,
  `listing_regionid` int(10) NOT NULL,
  `listing_description` varchar(512) DEFAULT NULL,
  `listing_config` varchar(512) DEFAULT NULL,
  `listing_extras` varchar(512) DEFAULT NULL,
  `listing_reserveprice` int(10) DEFAULT NULL,
  `listing_contactid` int(10) unsigned DEFAULT NULL,
  `listing_primaryphoto_URI` varchar(128) DEFAULT NULL,
  `listing_deactivated` tinyint(1) DEFAULT NULL,
  `listing_creationdate` datetime DEFAULT NULL,
  PRIMARY KEY (`listing_id`),
  KEY `fk_listing_category_id` (`listing_categoryid`),
  KEY `fk_listing_contact_id` (`listing_contactid`),
  KEY `fk_listing_region_id` (`listing_regionid`),
  CONSTRAINT `fk_listing_category_id` FOREIGN KEY (`listing_categoryid`) REFERENCES `category` (`category_id`),
  CONSTRAINT `fk_listing_contact_id` FOREIGN KEY (`listing_contactid`) REFERENCES `contacts` (`contact_id`),
  CONSTRAINT `fk_listing_region_id` FOREIGN KEY (`listing_regionid`) REFERENCES `region` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=729 DEFAULT CHARSET=latin1;

CREATE TABLE photo (
  photo_id int(10) NOT NULL AUTO_INCREMENT,
  photo_listingid int(10) NOT NULL,
  photo_image_URI varchar(128) NOT NULL,
  photo_displayorder int NULL,
  PRIMARY KEY (photo_id),
  KEY fk_photo_listingid (photo_listingid),
  CONSTRAINT fk_photo_listingid FOREIGN KEY (photo_listingid) REFERENCES listing (listing_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
