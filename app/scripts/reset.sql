# MySQL scripts for dropping existing tables and recreating the database table structure
# version  0.0.4; 14 March 2018
# Note: WebStorm throws an annoying error 'expecting one of the following: ALGORITHM DEFINER SQL VIEW'. This is an erroneous error and the script should run successfully despite this error.

# Tables must be dropped in a particular order due to referential constraints i.e. foreign keys.

DROP TABLE IF EXISTS bid;
DROP TABLE IF EXISTS photo;
DROP TABLE IF EXISTS listing;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS listing_user;

# Tables must be created in a particular order due to referential constraints i.e. foreign keys.

CREATE TABLE listing_user (
  user_id int(10) NOT NULL AUTO_INCREMENT,
  user_username varchar(50) NOT NULL,
  user_givenname varchar(50) NOT NULL,
  user_familyname varchar(50) NOT NULL,
  user_email varchar(320) NOT NULL,
  user_password varchar(512) NOT NULL,
  user_salt varchar(128) DEFAULT NULL,
  user_token varchar(32) DEFAULT NULL,
  user_accountbalance decimal(10,2) NOT NULL DEFAULT '0',
  user_reputation int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (user_id),
  UNIQUE KEY user_id (user_id),
  UNIQUE KEY user_email (user_email),
  UNIQUE KEY user_token (user_token),
  UNIQUE KEY user_username (user_username)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE category (
  category_id int(10) NOT NULL AUTO_INCREMENT,
  category_title varchar(50) NOT NULL,
  category_description varchar(256) DEFAULT NULL,
  PRIMARY KEY (category_id),
  UNIQUE KEY category_id (category_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE listing (
  listing_id int(10) NOT NULL AUTO_INCREMENT,
  listing_title varchar(128) NOT NULL,
  listing_categoryid int(10) NOT NULL,
  listing_description varchar(512) DEFAULT NULL,
  listing_reserveprice int(10) DEFAULT NULL,
  listing_startingprice int(10) NOT NULL,
  listing_creationdate datetime NOT NULL,
  listing_startingdate datetime NOT NULL,
  listing_endingdate datetime NOT NULL,
  listing_userid int(10) NOT NULL,
  listing_primaryphoto_URI varchar(128) DEFAULT NULL,
  listing_deactivated tinyint(1) DEFAULT NULL,
  PRIMARY KEY (listing_id),
  KEY fk_listing_category_id (listing_categoryid),
  KEY fk_listing_userid (listing_userid),
  CONSTRAINT fk_listing_userid FOREIGN KEY (listing_userid) REFERENCES listing_user (user_id),
  CONSTRAINT fk_listing_category_id FOREIGN KEY (listing_categoryid) REFERENCES category (category_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE photo (
  photo_id int(10) NOT NULL AUTO_INCREMENT,
  photo_listingid int(10) NOT NULL,
  photo_image_URI varchar(128) NOT NULL,
  photo_displayorder int NULL,
  PRIMARY KEY (photo_id),
  KEY fk_photo_listingid (photo_listingid),
  CONSTRAINT fk_photo_listingid FOREIGN KEY (photo_listingid) REFERENCES listing (listing_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE bid (
  bid_id int(10) NOT NULL AUTO_INCREMENT,
  bid_userid int(10) NOT NULL,
  bid_listingid int(10) NOT NULL,
  bid_amount int(10) NOT NULL,
  bid_datetime datetime NOT NULL,
  PRIMARY KEY (bid_id),
  KEY fk_bid_userid (bid_userid),
  KEY fk_listingid (bid_listingid),
  CONSTRAINT fk_listingid FOREIGN KEY (bid_listingid) REFERENCES listing (listing_id),
  CONSTRAINT fk_bid_userid FOREIGN KEY (bid_userid) REFERENCES listing_user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
