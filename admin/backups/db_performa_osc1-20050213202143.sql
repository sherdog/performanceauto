# osCommerce, Open Source E-Commerce Solutions
# http://www.oscommerce.com
#
# Database Backup For Performance Auto
# Copyright (c) 2005 Tom  Kirchhoff
#
# Database: performa_osc1
# Database Server: localhost
#
# Backup Date: 02/13/2005 20:21:43

drop table if exists address_book;
create table address_book (
  address_book_id int(11) not null auto_increment,
  customers_id int(11) default '0' not null ,
  entry_gender char(1) not null ,
  entry_company varchar(32) ,
  entry_firstname varchar(32) not null ,
  entry_lastname varchar(32) not null ,
  entry_street_address varchar(64) not null ,
  entry_suburb varchar(32) ,
  entry_postcode varchar(10) not null ,
  entry_city varchar(32) not null ,
  entry_state varchar(32) ,
  entry_country_id int(11) default '0' not null ,
  entry_zone_id int(11) default '0' not null ,
  PRIMARY KEY (address_book_id),
  KEY idx_address_book_customers_id (customers_id)
);

insert into address_book (address_book_id, customers_id, entry_gender, entry_company, entry_firstname, entry_lastname, entry_street_address, entry_suburb, entry_postcode, entry_city, entry_state, entry_country_id, entry_zone_id) values ('1', '1', 'm', 'ACME Inc.', 'John', 'Doe', '1 Way Street', '', '12345', 'NeverNever', '', '223', '12');
insert into address_book (address_book_id, customers_id, entry_gender, entry_company, entry_firstname, entry_lastname, entry_street_address, entry_suburb, entry_postcode, entry_city, entry_state, entry_country_id, entry_zone_id) values ('2', '2', 'm', '', 'KEVIN', 'SPECK', '1905 CEDAR ST.', '', '75154', 'RED OAK', '', '223', '57');
drop table if exists address_format;
create table address_format (
  address_format_id int(11) not null auto_increment,
  address_format varchar(128) not null ,
  address_summary varchar(48) not null ,
  PRIMARY KEY (address_format_id)
);

insert into address_format (address_format_id, address_format, address_summary) values ('1', '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country', '$city / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('2', '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country', '$city, $state / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('3', '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country', '$state / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('4', '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('5', '$firstname $lastname$cr$streets$cr$postcode $city$cr$country', '$city / $country');
drop table if exists banners;
create table banners (
  banners_id int(11) not null auto_increment,
  banners_title varchar(64) not null ,
  banners_url varchar(255) not null ,
  banners_image varchar(64) not null ,
  banners_group varchar(10) not null ,
  banners_html_text text ,
  expires_impressions int(7) default '0' ,
  expires_date datetime ,
  date_scheduled datetime ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  date_status_change datetime ,
  status int(1) default '1' not null ,
  PRIMARY KEY (banners_id)
);

insert into banners (banners_id, banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status) values ('1', 'osCommerce', 'http://www.oscommerce.com', 'banners/oscommerce.gif', '468x50', '', '0', NULL, NULL, '2005-01-27 17:14:43', NULL, '1');
drop table if exists banners_history;
create table banners_history (
  banners_history_id int(11) not null auto_increment,
  banners_id int(11) default '0' not null ,
  banners_shown int(5) default '0' not null ,
  banners_clicked int(5) default '0' not null ,
  banners_history_date datetime default '0000-00-00 00:00:00' not null ,
  PRIMARY KEY (banners_history_id)
);

insert into banners_history (banners_history_id, banners_id, banners_shown, banners_clicked, banners_history_date) values ('1', '1', '3', '0', '2005-01-27 17:14:48');
drop table if exists categories;
create table categories (
  categories_id int(11) not null auto_increment,
  categories_image varchar(64) ,
  parent_id int(11) default '0' not null ,
  sort_order int(3) ,
  date_added datetime ,
  last_modified datetime ,
  PRIMARY KEY (categories_id),
  KEY idx_categories_parent_id (parent_id)
);

insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('1', NULL, '0', '0', '2005-02-03 08:22:11', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('2', NULL, '0', '0', '2005-02-03 08:22:46', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('3', NULL, '0', '0', '2005-02-03 08:23:04', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('4', NULL, '0', '0', '2005-02-03 08:23:18', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('5', NULL, '0', '0', '2005-02-03 08:24:36', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('6', NULL, '0', '0', '2005-02-03 08:24:51', '2005-02-03 08:28:39');
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('7', NULL, '0', '0', '2005-02-03 08:25:14', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('8', NULL, '0', '0', '2005-02-03 08:25:26', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('9', NULL, '0', '0', '2005-02-03 08:25:56', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('10', NULL, '0', '0', '2005-02-03 08:26:16', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('11', NULL, '0', '0', '2005-02-03 08:26:46', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('12', NULL, '0', '0', '2005-02-03 08:27:00', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('13', NULL, '1', '0', '2005-02-03 08:31:01', '2005-02-03 08:32:03');
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('14', NULL, '5', '0', '2005-02-03 08:43:42', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('15', NULL, '11', '0', '2005-02-03 09:10:24', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('16', NULL, '2', '0', '2005-02-03 09:15:18', '2005-02-04 09:08:03');
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('17', NULL, '2', '0', '2005-02-03 09:21:22', '2005-02-04 09:10:24');
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('18', NULL, '2', '0', '2005-02-03 09:29:03', '2005-02-04 09:01:02');
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('19', NULL, '2', '0', '2005-02-03 09:54:53', '2005-02-04 09:09:45');
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('20', NULL, '10', '0', '2005-02-03 10:06:35', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('21', NULL, '2', '0', '2005-02-03 13:03:42', '2005-02-04 09:00:44');
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('22', NULL, '2', '0', '2005-02-04 09:02:27', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('23', NULL, '2', '0', '2005-02-04 09:05:28', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('24', NULL, '2', '0', '2005-02-04 09:05:50', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('25', NULL, '2', '0', '2005-02-04 09:06:05', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('26', NULL, '2', '0', '2005-02-04 09:06:23', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('27', NULL, '2', '0', '2005-02-04 09:06:46', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('28', NULL, '2', '0', '2005-02-04 09:08:29', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('29', NULL, '2', '0', '2005-02-04 09:09:05', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('30', NULL, '2', '0', '2005-02-04 09:10:53', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('31', NULL, '2', '0', '2005-02-04 09:11:09', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('32', NULL, '2', '0', '2005-02-04 09:11:56', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('33', NULL, '2', '0', '2005-02-04 09:12:24', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('34', NULL, '1', '0', '2005-02-04 09:13:14', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('35', NULL, '1', '0', '2005-02-04 09:13:30', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('36', NULL, '1', '0', '2005-02-04 09:13:46', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('37', NULL, '1', '0', '2005-02-04 09:13:59', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('38', NULL, '1', '0', '2005-02-04 09:14:16', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('39', NULL, '1', '0', '2005-02-04 09:16:22', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('40', NULL, '11', '0', '2005-02-04 09:17:17', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('41', NULL, '11', '0', '2005-02-04 09:17:40', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('42', NULL, '11', '0', '2005-02-04 09:18:03', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('43', NULL, '11', '0', '2005-02-04 09:18:22', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('44', NULL, '11', '0', '2005-02-04 09:18:39', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('45', NULL, '11', '0', '2005-02-04 09:18:55', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('46', NULL, '11', '0', '2005-02-04 09:19:07', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('47', NULL, '11', '0', '2005-02-04 09:19:23', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('48', NULL, '5', '0', '2005-02-04 09:21:18', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('49', NULL, '5', '0', '2005-02-04 09:21:33', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('50', NULL, '5', '0', '2005-02-04 09:22:05', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('51', NULL, '3', '0', '2005-02-04 09:23:10', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('52', NULL, '3', '0', '2005-02-04 09:23:21', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('53', NULL, '3', '0', '2005-02-04 09:23:34', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('54', NULL, '8', '0', '2005-02-04 09:24:00', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('55', NULL, '8', '0', '2005-02-04 09:24:14', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('56', NULL, '8', '0', '2005-02-04 09:24:28', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('57', NULL, '8', '0', '2005-02-04 09:24:39', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('58', NULL, '8', '0', '2005-02-04 09:24:49', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('59', NULL, '4', '0', '2005-02-04 11:09:43', '2005-02-04 11:17:00');
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('60', NULL, '4', '0', '2005-02-04 11:10:56', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('61', NULL, '4', '0', '2005-02-04 11:11:15', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('62', NULL, '4', '0', '2005-02-04 11:11:33', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('63', NULL, '4', '0', '2005-02-04 11:12:02', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('64', NULL, '4', '0', '2005-02-04 11:12:28', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('65', NULL, '4', '0', '2005-02-04 11:12:48', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('66', NULL, '4', '0', '2005-02-04 11:13:24', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('67', NULL, '4', '0', '2005-02-04 11:13:44', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('68', NULL, '4', '0', '2005-02-04 11:14:17', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('69', NULL, '4', '0', '2005-02-04 11:16:08', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('70', NULL, '4', '0', '2005-02-04 11:20:58', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('71', NULL, '6', '0', '2005-02-04 11:22:04', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('72', NULL, '6', '0', '2005-02-04 11:22:38', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('73', NULL, '6', '0', '2005-02-04 11:22:52', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('74', NULL, '6', '0', '2005-02-04 11:23:15', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('75', NULL, '7', '0', '2005-02-04 11:23:45', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('76', NULL, '7', '0', '2005-02-04 11:24:04', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('77', NULL, '7', '0', '2005-02-04 11:24:22', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('78', NULL, '7', '0', '2005-02-04 11:24:38', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('79', NULL, '7', '0', '2005-02-04 11:24:53', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('80', NULL, '7', '0', '2005-02-04 11:25:33', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('81', NULL, '7', '0', '2005-02-04 11:26:03', '2005-02-04 11:26:57');
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('82', NULL, '7', '0', '2005-02-04 11:27:26', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('83', NULL, '7', '0', '2005-02-04 11:27:43', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('84', NULL, '7', '0', '2005-02-04 11:27:59', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('85', NULL, '9', '0', '2005-02-04 11:29:35', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('86', NULL, '9', '0', '2005-02-04 11:29:50', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('87', NULL, '9', '0', '2005-02-04 11:30:04', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('88', NULL, '9', '0', '2005-02-04 11:30:14', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('89', NULL, '9', '0', '2005-02-04 11:30:28', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('90', NULL, '9', '0', '2005-02-04 11:30:43', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('91', NULL, '9', '0', '2005-02-04 11:30:53', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('92', NULL, '9', '0', '2005-02-04 11:31:07', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('93', NULL, '9', '0', '2005-02-04 11:31:18', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('94', NULL, '9', '0', '2005-02-04 11:31:30', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('95', NULL, '9', '0', '2005-02-04 11:31:41', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('96', NULL, '9', '0', '2005-02-04 11:32:14', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('97', NULL, '9', '0', '2005-02-04 11:32:37', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('98', NULL, '9', '0', '2005-02-04 11:33:14', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('99', NULL, '10', '0', '2005-02-04 11:34:00', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('100', NULL, '10', '0', '2005-02-04 11:34:21', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('101', NULL, '10', '0', '2005-02-04 11:43:07', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('102', NULL, '10', '0', '2005-02-04 11:43:27', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('103', NULL, '10', '0', '2005-02-04 11:43:47', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('104', NULL, '10', '0', '2005-02-04 11:44:13', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('105', NULL, '10', '0', '2005-02-04 11:44:33', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('106', NULL, '12', '0', '2005-02-04 11:45:10', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('107', NULL, '12', '0', '2005-02-04 11:45:25', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('108', NULL, '12', '0', '2005-02-04 11:45:41', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('109', NULL, '12', '0', '2005-02-04 11:45:55', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('110', NULL, '12', '0', '2005-02-04 11:46:26', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('111', NULL, '5', '0', '2005-02-04 12:16:05', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('112', NULL, '5', '0', '2005-02-04 12:16:22', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('113', NULL, '5', '0', '2005-02-04 12:16:40', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('114', NULL, '5', '0', '2005-02-04 12:17:02', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('135', NULL, '6', '0', '2005-02-08 09:44:39', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('116', NULL, '5', '0', '2005-02-04 12:18:04', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('117', NULL, '5', '0', '2005-02-04 12:18:25', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('118', NULL, '5', '0', '2005-02-04 12:18:40', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('119', NULL, '5', '0', '2005-02-04 12:18:54', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('120', NULL, '5', '0', '2005-02-04 12:19:13', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('121', NULL, '2', '0', '2005-02-04 12:32:40', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('122', NULL, '2', '0', '2005-02-04 12:49:36', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('123', NULL, '2', '0', '2005-02-04 12:49:57', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('124', NULL, '2', '0', '2005-02-04 12:50:18', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('125', NULL, '2', '0', '2005-02-04 12:50:45', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('126', NULL, '2', '0', '2005-02-04 12:51:05', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('127', NULL, '2', '0', '2005-02-04 12:51:39', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('128', NULL, '2', '0', '2005-02-04 13:18:10', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('137', NULL, '5', '0', '2005-02-08 10:09:11', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('136', NULL, '5', '0', '2005-02-08 10:08:52', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('132', NULL, '12', '0', '2005-02-08 09:09:01', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('133', NULL, '12', '0', '2005-02-08 09:12:29', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('134', NULL, '12', '0', '2005-02-08 09:15:16', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('138', NULL, '5', '0', '2005-02-08 10:17:28', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('139', NULL, '5', '0', '2005-02-08 11:45:56', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('140', NULL, '11', '0', '2005-02-11 09:28:00', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('141', NULL, '5', '0', '2005-02-11 10:37:20', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('142', NULL, '4', '0', '2005-02-11 11:27:41', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('143', NULL, '5', '0', '2005-02-13 09:13:23', NULL);
drop table if exists categories_description;
create table categories_description (
  categories_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  categories_name varchar(32) not null ,
  PRIMARY KEY (categories_id, language_id),
  KEY idx_categories_name (categories_name)
);

insert into categories_description (categories_id, language_id, categories_name) values ('1', '1', 'Cooling System');
insert into categories_description (categories_id, language_id, categories_name) values ('2', '1', 'Engine Parts - SBC');
insert into categories_description (categories_id, language_id, categories_name) values ('29', '1', 'Gaskets');
insert into categories_description (categories_id, language_id, categories_name) values ('3', '1', 'Exhaust');
insert into categories_description (categories_id, language_id, categories_name) values ('22', '1', 'Harmonic Balancers');
insert into categories_description (categories_id, language_id, categories_name) values ('4', '1', 'Fuel System');
insert into categories_description (categories_id, language_id, categories_name) values ('28', '1', 'Timing Sets');
insert into categories_description (categories_id, language_id, categories_name) values ('5', '1', 'Drive Train & Brakes');
insert into categories_description (categories_id, language_id, categories_name) values ('21', '1', 'Camshafts');
insert into categories_description (categories_id, language_id, categories_name) values ('6', '1', 'Gauges & Gauge Panels');
insert into categories_description (categories_id, language_id, categories_name) values ('7', '1', 'Ignition & Electronics');
insert into categories_description (categories_id, language_id, categories_name) values ('8', '1', 'Fasteners');
insert into categories_description (categories_id, language_id, categories_name) values ('27', '1', 'Valve Springs');
insert into categories_description (categories_id, language_id, categories_name) values ('20', '1', 'Steering Wheels');
insert into categories_description (categories_id, language_id, categories_name) values ('9', '1', 'Safety Equipment');
insert into categories_description (categories_id, language_id, categories_name) values ('26', '1', 'Rings');
insert into categories_description (categories_id, language_id, categories_name) values ('10', '1', 'Steering Components');
insert into categories_description (categories_id, language_id, categories_name) values ('25', '1', 'Lifters');
insert into categories_description (categories_id, language_id, categories_name) values ('19', '1', 'Valve Covers & Acces.');
insert into categories_description (categories_id, language_id, categories_name) values ('11', '1', 'Chassis & Suspension');
insert into categories_description (categories_id, language_id, categories_name) values ('18', '1', 'Pistons');
insert into categories_description (categories_id, language_id, categories_name) values ('12', '1', 'Tools');
insert into categories_description (categories_id, language_id, categories_name) values ('24', '1', 'Bearings');
insert into categories_description (categories_id, language_id, categories_name) values ('17', '1', 'Cylinder Heads');
insert into categories_description (categories_id, language_id, categories_name) values ('13', '1', 'Pulley & Belt Kits');
insert into categories_description (categories_id, language_id, categories_name) values ('16', '1', 'Intake Manifolds');
insert into categories_description (categories_id, language_id, categories_name) values ('14', '1', 'Master Cylinders');
insert into categories_description (categories_id, language_id, categories_name) values ('23', '1', 'Oil Pumps');
insert into categories_description (categories_id, language_id, categories_name) values ('15', '1', 'Shocks');
insert into categories_description (categories_id, language_id, categories_name) values ('30', '1', 'Crankshafts');
insert into categories_description (categories_id, language_id, categories_name) values ('31', '1', 'Connecting Rods');
insert into categories_description (categories_id, language_id, categories_name) values ('32', '1', 'Oil Filters');
insert into categories_description (categories_id, language_id, categories_name) values ('33', '1', 'Rocker Arms');
insert into categories_description (categories_id, language_id, categories_name) values ('34', '1', 'Radiators');
insert into categories_description (categories_id, language_id, categories_name) values ('35', '1', 'Radiator Caps');
insert into categories_description (categories_id, language_id, categories_name) values ('36', '1', 'Fans');
insert into categories_description (categories_id, language_id, categories_name) values ('37', '1', 'Fan Spacers');
insert into categories_description (categories_id, language_id, categories_name) values ('38', '1', 'Water Pumps');
insert into categories_description (categories_id, language_id, categories_name) values ('39', '1', 'Water Additives');
insert into categories_description (categories_id, language_id, categories_name) values ('40', '1', 'Shock Brackets');
insert into categories_description (categories_id, language_id, categories_name) values ('41', '1', 'Springs');
insert into categories_description (categories_id, language_id, categories_name) values ('42', '1', 'Weight Jacks');
insert into categories_description (categories_id, language_id, categories_name) values ('43', '1', 'Polyurethane Bushings');
insert into categories_description (categories_id, language_id, categories_name) values ('44', '1', 'Panhard Bars');
insert into categories_description (categories_id, language_id, categories_name) values ('45', '1', 'Swage Tubes');
insert into categories_description (categories_id, language_id, categories_name) values ('46', '1', 'Rod Ends');
insert into categories_description (categories_id, language_id, categories_name) values ('47', '1', 'Torque Links');
insert into categories_description (categories_id, language_id, categories_name) values ('48', '1', 'Spools - 9\" Ford');
insert into categories_description (categories_id, language_id, categories_name) values ('49', '1', 'Shifters');
insert into categories_description (categories_id, language_id, categories_name) values ('50', '1', 'Pedals');
insert into categories_description (categories_id, language_id, categories_name) values ('51', '1', 'Headers');
insert into categories_description (categories_id, language_id, categories_name) values ('52', '1', 'Mufflers');
insert into categories_description (categories_id, language_id, categories_name) values ('53', '1', 'Turndowns');
insert into categories_description (categories_id, language_id, categories_name) values ('54', '1', 'Cleco Kit');
insert into categories_description (categories_id, language_id, categories_name) values ('55', '1', 'Dzus Fasteners');
insert into categories_description (categories_id, language_id, categories_name) values ('56', '1', 'Hood Pin Kits');
insert into categories_description (categories_id, language_id, categories_name) values ('57', '1', 'Rivets');
insert into categories_description (categories_id, language_id, categories_name) values ('58', '1', 'Riveters');
insert into categories_description (categories_id, language_id, categories_name) values ('59', '1', 'Carburetors');
insert into categories_description (categories_id, language_id, categories_name) values ('60', '1', 'Fuel Filters');
insert into categories_description (categories_id, language_id, categories_name) values ('61', '1', 'Fuel Log');
insert into categories_description (categories_id, language_id, categories_name) values ('62', '1', 'Fuel Pumps');
insert into categories_description (categories_id, language_id, categories_name) values ('63', '1', 'Carb Spacers');
insert into categories_description (categories_id, language_id, categories_name) values ('64', '1', 'Fuel Line');
insert into categories_description (categories_id, language_id, categories_name) values ('65', '1', 'Jet Kits');
insert into categories_description (categories_id, language_id, categories_name) values ('66', '1', 'Carb Adapters');
insert into categories_description (categories_id, language_id, categories_name) values ('67', '1', 'Carb Kits');
insert into categories_description (categories_id, language_id, categories_name) values ('68', '1', 'Air Cleaners & Acces.');
insert into categories_description (categories_id, language_id, categories_name) values ('69', '1', 'Fittings');
insert into categories_description (categories_id, language_id, categories_name) values ('70', '1', 'Throttle Rods');
insert into categories_description (categories_id, language_id, categories_name) values ('71', '1', 'Gauges-Accutech');
insert into categories_description (categories_id, language_id, categories_name) values ('72', '1', 'Gauge Panels - Longacre');
insert into categories_description (categories_id, language_id, categories_name) values ('73', '1', 'Tachometers');
insert into categories_description (categories_id, language_id, categories_name) values ('74', '1', 'Tire Pressure Gauges');
insert into categories_description (categories_id, language_id, categories_name) values ('75', '1', 'Battery Box');
insert into categories_description (categories_id, language_id, categories_name) values ('76', '1', 'Battery Disconnects');
insert into categories_description (categories_id, language_id, categories_name) values ('77', '1', 'Ignition Coils');
insert into categories_description (categories_id, language_id, categories_name) values ('78', '1', 'Charging Posts');
insert into categories_description (categories_id, language_id, categories_name) values ('79', '1', 'Distributors');
insert into categories_description (categories_id, language_id, categories_name) values ('80', '1', 'Switches');
insert into categories_description (categories_id, language_id, categories_name) values ('81', '1', 'Ignition Switch Panels-Longacre');
insert into categories_description (categories_id, language_id, categories_name) values ('82', '1', 'Ignition Switch Panels-Rebco');
insert into categories_description (categories_id, language_id, categories_name) values ('83', '1', 'MSD Boxes');
insert into categories_description (categories_id, language_id, categories_name) values ('84', '1', 'Spark Plug Wires');
insert into categories_description (categories_id, language_id, categories_name) values ('85', '1', 'Arm Restraints');
insert into categories_description (categories_id, language_id, categories_name) values ('86', '1', 'Driving Suits');
insert into categories_description (categories_id, language_id, categories_name) values ('87', '1', 'Gloves');
insert into categories_description (categories_id, language_id, categories_name) values ('88', '1', 'Helmets');
insert into categories_description (categories_id, language_id, categories_name) values ('89', '1', 'Neck Braces');
insert into categories_description (categories_id, language_id, categories_name) values ('90', '1', 'Roll Bar Padding');
insert into categories_description (categories_id, language_id, categories_name) values ('91', '1', 'Seats');
insert into categories_description (categories_id, language_id, categories_name) values ('92', '1', 'Seat Belts');
insert into categories_description (categories_id, language_id, categories_name) values ('93', '1', 'Shoes');
insert into categories_description (categories_id, language_id, categories_name) values ('94', '1', 'Socks');
insert into categories_description (categories_id, language_id, categories_name) values ('95', '1', 'Underwear');
insert into categories_description (categories_id, language_id, categories_name) values ('96', '1', 'Window Nets');
insert into categories_description (categories_id, language_id, categories_name) values ('97', '1', 'Window Net Install. Kits');
insert into categories_description (categories_id, language_id, categories_name) values ('98', '1', 'Tearoffs');
insert into categories_description (categories_id, language_id, categories_name) values ('99', '1', 'Power Steering Kits');
insert into categories_description (categories_id, language_id, categories_name) values ('100', '1', 'Quick Disconnect Hubs');
insert into categories_description (categories_id, language_id, categories_name) values ('101', '1', 'Quick Steers');
insert into categories_description (categories_id, language_id, categories_name) values ('102', '1', 'Steering Shaft Heim');
insert into categories_description (categories_id, language_id, categories_name) values ('103', '1', 'Steering Shaft Mounts');
insert into categories_description (categories_id, language_id, categories_name) values ('104', '1', 'Steering U-Joints');
insert into categories_description (categories_id, language_id, categories_name) values ('105', '1', 'Steering Box Fittings');
insert into categories_description (categories_id, language_id, categories_name) values ('106', '1', 'Caster Camber Gauges');
insert into categories_description (categories_id, language_id, categories_name) values ('107', '1', 'Stagger Gauge');
insert into categories_description (categories_id, language_id, categories_name) values ('108', '1', 'Tire Pressure Gauges');
insert into categories_description (categories_id, language_id, categories_name) values ('109', '1', 'Temp Gun');
insert into categories_description (categories_id, language_id, categories_name) values ('110', '1', 'Riveters');
insert into categories_description (categories_id, language_id, categories_name) values ('111', '1', 'Braided Lines');
insert into categories_description (categories_id, language_id, categories_name) values ('112', '1', 'Brake Fluid');
insert into categories_description (categories_id, language_id, categories_name) values ('113', '1', 'Brake Line Fittings');
insert into categories_description (categories_id, language_id, categories_name) values ('114', '1', 'Brake Adjusters');
insert into categories_description (categories_id, language_id, categories_name) values ('136', '1', 'Clutch Slave Cylinders');
insert into categories_description (categories_id, language_id, categories_name) values ('116', '1', 'Plastic Brake Line Kits');
insert into categories_description (categories_id, language_id, categories_name) values ('117', '1', 'Caliper Brackets');
insert into categories_description (categories_id, language_id, categories_name) values ('118', '1', 'Calipers');
insert into categories_description (categories_id, language_id, categories_name) values ('119', '1', 'Rotors');
insert into categories_description (categories_id, language_id, categories_name) values ('120', '1', 'Bellhousings');
insert into categories_description (categories_id, language_id, categories_name) values ('121', '1', 'Pushrods');
insert into categories_description (categories_id, language_id, categories_name) values ('122', '1', 'Oil Pans');
insert into categories_description (categories_id, language_id, categories_name) values ('123', '1', 'Guideplates');
insert into categories_description (categories_id, language_id, categories_name) values ('124', '1', 'Valves');
insert into categories_description (categories_id, language_id, categories_name) values ('125', '1', 'Rocker Arm Studs');
insert into categories_description (categories_id, language_id, categories_name) values ('126', '1', 'Timing Covers');
insert into categories_description (categories_id, language_id, categories_name) values ('127', '1', 'Valve Spring Retainers');
insert into categories_description (categories_id, language_id, categories_name) values ('128', '1', 'Rering Kits');
insert into categories_description (categories_id, language_id, categories_name) values ('135', '1', 'Ignition Switch Panels');
insert into categories_description (categories_id, language_id, categories_name) values ('132', '1', 'Tire Accessories');
insert into categories_description (categories_id, language_id, categories_name) values ('133', '1', 'Bead Breaker');
insert into categories_description (categories_id, language_id, categories_name) values ('134', '1', 'Lug Wrench');
insert into categories_description (categories_id, language_id, categories_name) values ('137', '1', 'Clutches');
insert into categories_description (categories_id, language_id, categories_name) values ('138', '1', 'Throwout Bearings');
insert into categories_description (categories_id, language_id, categories_name) values ('139', '1', 'Lug Nuts');
insert into categories_description (categories_id, language_id, categories_name) values ('140', '1', 'Motor Mounts');
insert into categories_description (categories_id, language_id, categories_name) values ('141', '1', 'Wheel Studs');
insert into categories_description (categories_id, language_id, categories_name) values ('142', '1', 'Carb Linkage');
insert into categories_description (categories_id, language_id, categories_name) values ('143', '1', 'Pedal Assemblys');
drop table if exists configuration;
create table configuration (
  configuration_id int(11) not null auto_increment,
  configuration_title varchar(64) not null ,
  configuration_key varchar(64) not null ,
  configuration_value varchar(255) not null ,
  configuration_description varchar(255) not null ,
  configuration_group_id int(11) default '0' not null ,
  sort_order int(5) ,
  last_modified datetime ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  use_function varchar(255) ,
  set_function varchar(255) ,
  PRIMARY KEY (configuration_id)
);

insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1', 'Store Name', 'STORE_NAME', 'Performance Auto', 'The name of my store', '1', '1', '2005-02-13 19:36:59', '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2', 'Store Owner', 'STORE_OWNER', 'Tom  Kirchhoff', 'The name of my store owner', '1', '2', '2005-02-13 19:37:20', '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3', 'E-Mail Address', 'STORE_OWNER_EMAIL_ADDRESS', 'info@performanceauto.us', 'The e-mail address of my store owner', '1', '3', '2005-02-13 19:37:33', '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('4', 'E-Mail From', 'EMAIL_FROM', 'info@performanceauto.us', 'The e-mail address used in (sent) e-mails', '1', '4', '2005-02-13 19:37:42', '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('5', 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br><br><b>Note: Please remember to update the store zone.</b>', '1', '6', NULL, '2005-01-27 17:14:43', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('6', 'Zone', 'STORE_ZONE', '25', 'The zone my store is located in', '1', '7', '2005-02-13 19:37:51', '2005-01-27 17:14:43', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('7', 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', '1', '8', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'asc\', \'desc\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('8', 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', '1', '9', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'products_name\', \'date_expected\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('9', 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language\'s currency when it is changed', '1', '10', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('10', 'Send Extra Order Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', '1', '11', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('11', 'Use Search-Engine Safe URLs (still in development)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', '1', '12', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('12', 'Display Cart After Adding Product', 'DISPLAY_CART', 'true', 'Display the shopping cart after adding a product (or return back to their origin)', '1', '14', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('13', 'Allow Guest To Tell A Friend', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'Allow guests to tell a friend about a product', '1', '15', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('14', 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', '1', '17', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'and\', \'or\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('15', 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Performance Auto
2801 Falls Ave
Waterloo, IA', 'This is the Store Name, Address and Phone used on printable documents and displayed online', '1', '18', '2005-02-13 19:39:16', '2005-01-27 17:14:43', NULL, 'tep_cfg_textarea(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('16', 'Show Category Counts', 'SHOW_COUNTS', 'true', 'Count recursively how many products are in each category', '1', '19', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('17', 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', '1', '20', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('18', 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', '1', '21', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('19', 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', '2', '1', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('20', 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', '2', '2', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('21', 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', '2', '3', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('22', 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', '2', '4', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('23', 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', '2', '5', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('24', 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'Minimum length of company name', '2', '6', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('25', 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', '2', '7', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('26', 'City', 'ENTRY_CITY_MIN_LENGTH', '3', 'Minimum length of city', '2', '8', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('27', 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', '2', '9', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('28', 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', '2', '10', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('29', 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'Minimum length of password', '2', '11', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('30', 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', '2', '12', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('31', 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', '2', '13', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('32', 'Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of review text', '2', '14', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('33', 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', '2', '15', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('34', 'Also Purchased', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the \'This Customer Also Purchased\' box', '2', '16', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('35', 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', '3', '1', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('36', 'Search Results', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Amount of products to list', '3', '2', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('37', 'Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of \'number\' links use for page-sets', '3', '3', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('38', 'Special Products', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '0', 'Maximum number of products on special to display', '3', '4', '2005-02-03 10:50:25', '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('39', 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Maximum number of new products to display in a category', '3', '5', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('40', 'Products Expected', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Maximum number of products expected to display', '3', '6', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('41', 'Manufacturers List', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 'Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list', '3', '7', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('42', 'Manufacturers Select Size', 'MAX_MANUFACTURERS_LIST', '1', 'Used in manufacturers box; when this value is \'1\' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.', '3', '7', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('43', 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display', '3', '8', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('44', 'New Reviews', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Maximum number of new reviews to display', '3', '9', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('45', 'Selection of Random Reviews', 'MAX_RANDOM_SELECT_REVIEWS', '10', 'How many records to select from to choose one random product review', '3', '10', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('46', 'Selection of Random New Products', 'MAX_RANDOM_SELECT_NEW', '10', 'How many records to select from to choose one random new product to display', '3', '11', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('47', 'Selection of Products on Special', 'MAX_RANDOM_SELECT_SPECIALS', '0', 'How many records to select from to choose one random product special to display', '3', '12', '2005-02-03 10:48:21', '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('48', 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'How many categories to list per row', '3', '13', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('49', 'New Products Listing', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Maximum number of new products to display in new products page', '3', '14', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('50', 'Best Sellers', 'MAX_DISPLAY_BESTSELLERS', '10', 'Maximum number of best sellers to display', '3', '15', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('51', 'Also Purchased', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Maximum number of products to display in the \'This Customer Also Purchased\' box', '3', '16', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('52', 'Customer Order History Box', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Maximum number of products to display in the customer order history box', '3', '17', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('53', 'Order History', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Maximum number of orders to display in the order history page', '3', '18', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('54', 'Small Image Width', 'SMALL_IMAGE_WIDTH', '100', 'The pixel width of small images', '4', '1', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('55', 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '80', 'The pixel height of small images', '4', '2', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('56', 'Heading Image Width', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images', '4', '3', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('57', 'Heading Image Height', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images', '4', '4', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('58', 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'The pixel width of subcategory images', '4', '5', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('59', 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'The pixel height of subcategory images', '4', '6', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('60', 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', '4', '7', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('61', 'Image Required', 'IMAGE_REQUIRED', 'false', 'Enable to display broken images. Good for development.', '4', '8', '2005-02-03 14:05:23', '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('62', 'Gender', 'ACCOUNT_GENDER', 'true', 'Display gender in the customers account', '5', '1', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('63', 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth in the customers account', '5', '2', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('64', 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company in the customers account', '5', '3', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('65', 'Suburb', 'ACCOUNT_SUBURB', 'false', 'Display suburb in the customers account', '5', '4', '2005-02-13 19:39:54', '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('66', 'State', 'ACCOUNT_STATE', 'true', 'Display state in the customers account', '5', '5', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('67', 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'cc.php;paypal.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cc.php;cod.php;paypal.php)', '6', '0', '2005-02-13 19:43:15', '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('68', 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', '6', '0', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('69', 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'fedex1.php;flat.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', '6', '0', '2005-02-13 20:07:28', '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('152', 'Your Fedex Meter ID', 'MODULE_SHIPPING_FEDEX1_METER', 'NONE', 'Enter the Fedex MeterID assigned to you, set to NONE to obtain a new meter number', '6', '12', NULL, '2005-02-13 20:07:27', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('151', 'Your Fedex Account Number', 'MODULE_SHIPPING_FEDEX1_ACCOUNT', 'NONE', 'Enter the fedex Account Number assigned to you, required', '6', '11', NULL, '2005-02-13 20:07:27', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('150', 'Display Transit Times', 'MODULE_SHIPPING_FEDEX1_TRANSIT', 'True', 'Do you want to show transit times for ground or home delivery rates?', '6', '10', NULL, '2005-02-13 20:07:27', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('149', 'Enable Fedex Shipping', 'MODULE_SHIPPING_FEDEX1_STATUS', 'True', 'Do you want to offer Fedex shipping?', '6', '10', NULL, '2005-02-13 20:07:27', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('74', 'Enable Credit Card Module', 'MODULE_PAYMENT_CC_STATUS', 'True', 'Do you want to accept credit card payments?', '6', '0', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('75', 'Split Credit Card E-Mail Address', 'MODULE_PAYMENT_CC_EMAIL', '', 'If an e-mail address is entered, the middle digits of the credit card number will be sent to the e-mail address (the outside digits are stored in the database with the middle digits censored)', '6', '0', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('76', 'Sort order of display.', 'MODULE_PAYMENT_CC_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('77', 'Payment Zone', 'MODULE_PAYMENT_CC_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', '6', '2', NULL, '2005-01-27 17:14:43', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('78', 'Set Order Status', 'MODULE_PAYMENT_CC_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', '6', '0', NULL, '2005-01-27 17:14:43', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('79', 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', '6', '0', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('80', 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', '6', '0', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('81', 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', '6', '0', NULL, '2005-01-27 17:14:43', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('82', 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', '6', '0', NULL, '2005-01-27 17:14:43', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('83', 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', '6', '0', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('84', 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', '6', '0', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('85', 'Default Language', 'DEFAULT_LANGUAGE', 'en', 'Default Language', '6', '0', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('86', 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', '6', '0', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('87', 'Display Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Do you want to display the order shipping cost?', '6', '1', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('88', 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '2', 'Sort order of display.', '6', '2', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('89', 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', '6', '3', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('90', 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', '6', '4', NULL, '2005-01-27 17:14:43', 'currencies->format', NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('91', 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', '6', '5', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'national\', \'international\', \'both\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('92', 'Display Sub-Total', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Do you want to display the order sub-total cost?', '6', '1', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('93', 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'Sort order of display.', '6', '2', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('94', 'Display Tax', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Do you want to display the order tax value?', '6', '1', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('95', 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '3', 'Sort order of display.', '6', '2', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('96', 'Display Total', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Do you want to display the total order value?', '6', '1', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('97', 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '4', 'Sort order of display.', '6', '2', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('98', 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', '7', '1', NULL, '2005-01-27 17:14:43', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('99', 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.', '7', '2', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('100', 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', '7', '3', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('101', 'Package Tare weight.', 'SHIPPING_BOX_WEIGHT', '3', 'What is the weight of typical packaging of small to medium packages?', '7', '4', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('102', 'Larger packages - percentage increase.', 'SHIPPING_BOX_PADDING', '10', 'For 10% enter 10', '7', '5', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('103', 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', '8', '1', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('104', 'Display Product Manufaturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', '8', '2', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('105', 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', '8', '3', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('106', 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', '8', '4', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('107', 'Display Product Price', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price', '8', '5', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('108', 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', '8', '6', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('109', 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', '8', '7', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('110', 'Display Buy Now column', 'PRODUCT_LIST_BUY_NOW', '4', 'Do you want to display the Buy Now column?', '8', '8', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('111', 'Display Category/Manufacturer Filter (0=disable; 1=enable)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', '8', '9', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('112', 'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '2', 'Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', '8', '10', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('113', 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', '9', '1', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('114', 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', '9', '2', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('115', 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', '9', '3', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('116', 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', '9', '4', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('117', 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', '9', '5', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('118', 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', '10', '1', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('119', 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log', 'Directory and filename of the page parse time log', '10', '2', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('120', 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', '10', '3', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('121', 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'true', 'Display the page parse time (store page parse time must be enabled)', '10', '4', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('122', 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log (PHP4 only)', '10', '5', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('123', 'Use Cache', 'USE_CACHE', 'false', 'Use caching features', '11', '1', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('124', 'Cache Directory', 'DIR_FS_CACHE', '/tmp/', 'The directory where the cached files are saved', '11', '2', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('125', 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'sendmail', 'Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.', '12', '1', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('126', 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', '12', '2', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'LF\', \'CRLF\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('127', 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', '12', '3', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('128', 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', '12', '4', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('129', 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', '12', '5', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('130', 'Enable download', 'DOWNLOAD_ENABLED', 'false', 'Enable the products download functions.', '13', '1', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('131', 'Download by redirect', 'DOWNLOAD_BY_REDIRECT', 'false', 'Use browser redirection for download. Disable on non-Unix systems.', '13', '2', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('132', 'Expiry delay (days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', '13', '3', NULL, '2005-01-27 17:14:43', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('133', 'Maximum number of downloads', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', '13', '4', NULL, '2005-01-27 17:14:43', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('134', 'Enable GZip Compression', 'GZIP_COMPRESSION', 'false', 'Enable HTTP GZip compression.', '14', '1', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('135', 'Compression Level', 'GZIP_LEVEL', '5', 'Use this compression level 0-9 (0 = minimum, 9 = maximum).', '14', '2', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('136', 'Session Directory', 'SESSION_WRITE_DIRECTORY', '/tmp', 'If sessions are file based, store them in this directory.', '15', '1', NULL, '2005-01-27 17:14:43', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('137', 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', '15', '2', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('138', 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', '15', '3', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('139', 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', '15', '4', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('140', 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', '15', '5', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('141', 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'False', 'Prevent known spiders from starting a session.', '15', '6', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('142', 'Recreate Session', 'SESSION_RECREATE', 'False', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', '15', '7', NULL, '2005-01-27 17:14:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('143', 'Enable PayPal Module', 'MODULE_PAYMENT_PAYPAL_STATUS', 'True', 'Do you want to accept PayPal payments?', '6', '3', NULL, '2005-02-13 19:41:14', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('144', 'E-Mail Address', 'MODULE_PAYMENT_PAYPAL_ID', 'tommyk2801@yahoo.com', 'The e-mail address to use for the PayPal service', '6', '4', NULL, '2005-02-13 19:41:14', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('145', 'Transaction Currency', 'MODULE_PAYMENT_PAYPAL_CURRENCY', 'Selected Currency', 'The currency to use for credit card transactions', '6', '6', NULL, '2005-02-13 19:41:14', NULL, 'tep_cfg_select_option(array(\'Selected Currency\',\'Only USD\',\'Only CAD\',\'Only EUR\',\'Only GBP\',\'Only JPY\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('146', 'Sort order of display.', 'MODULE_PAYMENT_PAYPAL_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2005-02-13 19:41:14', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('147', 'Payment Zone', 'MODULE_PAYMENT_PAYPAL_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', '6', '2', NULL, '2005-02-13 19:41:14', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('148', 'Set Order Status', 'MODULE_PAYMENT_PAYPAL_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', '6', '0', NULL, '2005-02-13 19:41:14', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('153', 'cURL Path', 'MODULE_SHIPPING_FEDEX1_CURL', 'NONE', 'Enter the path to the cURL program, normally, leave this set to NONE to execute cURL using PHP', '6', '12', NULL, '2005-02-13 20:07:27', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('154', 'Debug Mode', 'MODULE_SHIPPING_FEDEX1_DEBUG', 'False', 'Turn on Debug', '6', '19', NULL, '2005-02-13 20:07:27', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('155', 'Weight Units', 'MODULE_SHIPPING_FEDEX1_WEIGHT', 'LBS', 'Weight Units:', '6', '19', NULL, '2005-02-13 20:07:27', NULL, 'tep_cfg_select_option(array(\'LBS\', \'KGS\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('156', 'First line of street address', 'MODULE_SHIPPING_FEDEX1_ADDRESS_1', 'NONE', 'Enter the first line of your ship from street address, required', '6', '13', NULL, '2005-02-13 20:07:27', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('157', 'Second line of street address', 'MODULE_SHIPPING_FEDEX1_ADDRESS_2', 'NONE', 'Enter the second line of your ship from street address, leave set to NONE if you do not need to specify a second line', '6', '14', NULL, '2005-02-13 20:07:27', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('158', 'City name', 'MODULE_SHIPPING_FEDEX1_CITY', 'NONE', 'Enter the city name for the ship from street address, required', '6', '15', NULL, '2005-02-13 20:07:27', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('159', 'State or Province name', 'MODULE_SHIPPING_FEDEX1_STATE', 'NONE', 'Enter the 2 letter state or province name for the ship from street address, required for Canada and US', '6', '16', NULL, '2005-02-13 20:07:27', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('160', 'Postal code', 'MODULE_SHIPPING_FEDEX1_POSTAL', 'NONE', 'Enter the postal code for the ship from street address, required', '6', '17', NULL, '2005-02-13 20:07:27', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('161', 'Phone number', 'MODULE_SHIPPING_FEDEX1_PHONE', 'NONE', 'Enter a contact phone number for your company, required', '6', '18', NULL, '2005-02-13 20:07:27', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('162', 'Which server to use', 'MODULE_SHIPPING_FEDEX1_SERVER', 'production', 'You must have an account with Fedex', '6', '19', NULL, '2005-02-13 20:07:27', NULL, 'tep_cfg_select_option(array(\'test\', \'production\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('163', 'Drop off type', 'MODULE_SHIPPING_FEDEX1_DROPOFF', '1', 'Dropoff type (1 = Regular pickup, 2 = request courier, 3 = drop box, 4 = drop at BSC, 5 = drop at station)?', '6', '20', NULL, '2005-02-13 20:07:27', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('164', 'Fedex surcharge?', 'MODULE_SHIPPING_FEDEX1_SURCHARGE', '0', 'Surcharge amount to add to shipping charge?', '6', '21', NULL, '2005-02-13 20:07:27', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('165', 'Show List Rates?', 'MODULE_SHIPPING_FEDEX1_LIST_RATES', 'False', 'Show LIST Rates?', '6', '21', NULL, '2005-02-13 20:07:27', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('166', 'Residential surcharge?', 'MODULE_SHIPPING_FEDEX1_RESIDENTIAL', '0', 'Residential Surcharge (in addition to other surcharge) for Express packages within US, or ground packages within Canada?', '6', '21', NULL, '2005-02-13 20:07:27', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('167', 'Insurance?', 'MODULE_SHIPPING_FEDEX1_INSURE', 'NONE', 'Insure packages over what dollar amount?', '6', '22', NULL, '2005-02-13 20:07:27', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('168', 'Enable Envelope Rates?', 'MODULE_SHIPPING_FEDEX1_ENVELOPE', 'False', 'Do you want to offer Fedex Envelope rates? All items under 1/2 LB (.23KG) will quote using the envelope rate if True.', '6', '10', NULL, '2005-02-13 20:07:27', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('169', 'Sort rates:', 'MODULE_SHIPPING_FEDEX1_WEIGHT_SORT', 'High to Low', 'Sort rates top to bottom:', '6', '19', NULL, '2005-02-13 20:07:27', NULL, 'tep_cfg_select_option(array(\'High to Low\', \'Low to High\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('170', 'Timeout in Seconds', 'MODULE_SHIPPING_FEDEX1_TIMEOUT', 'NONE', 'Enter the maximum time in seconds you would wait for a rate request from Fedex? Leave NONE for default timeout.', '6', '22', NULL, '2005-02-13 20:07:27', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('171', 'Tax Class', 'MODULE_SHIPPING_FEDEX1_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', '6', '23', NULL, '2005-02-13 20:07:27', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('172', 'Sort Order', 'MODULE_SHIPPING_FEDEX1_SORT_ORDER', '0', 'Sort order of display.', '6', '24', NULL, '2005-02-13 20:07:27', NULL, NULL);
drop table if exists configuration_group;
create table configuration_group (
  configuration_group_id int(11) not null auto_increment,
  configuration_group_title varchar(64) not null ,
  configuration_group_description varchar(255) not null ,
  sort_order int(5) ,
  visible int(1) default '1' ,
  PRIMARY KEY (configuration_group_id)
);

insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('1', 'My Store', 'General information about my store', '1', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('2', 'Minimum Values', 'The minimum values for functions / data', '2', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('3', 'Maximum Values', 'The maximum values for functions / data', '3', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('4', 'Images', 'Image parameters', '4', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('5', 'Customer Details', 'Customer account configuration', '5', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('6', 'Module Options', 'Hidden from configuration', '6', '0');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('7', 'Shipping/Packaging', 'Shipping options available at my store', '7', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('8', 'Product Listing', 'Product Listing    configuration options', '8', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('9', 'Stock', 'Stock configuration options', '9', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('10', 'Logging', 'Logging configuration options', '10', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('11', 'Cache', 'Caching configuration options', '11', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('12', 'E-Mail Options', 'General setting for E-Mail transport and HTML E-Mails', '12', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('13', 'Download', 'Downloadable products options', '13', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('14', 'GZip Compression', 'GZip compression options', '14', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('15', 'Sessions', 'Session options', '15', '1');
drop table if exists counter;
create table counter (
  startdate char(8) ,
  counter int(12) 
);

insert into counter (startdate, counter) values ('20050127', '3');
drop table if exists counter_history;
create table counter_history (
  month char(8) ,
  counter int(12) 
);

drop table if exists countries;
create table countries (
  countries_id int(11) not null auto_increment,
  countries_name varchar(64) not null ,
  countries_iso_code_2 char(2) not null ,
  countries_iso_code_3 char(3) not null ,
  address_format_id int(11) default '0' not null ,
  PRIMARY KEY (countries_id),
  KEY IDX_COUNTRIES_NAME (countries_name)
);

insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('223', 'United States', 'US', 'USA', '2');
drop table if exists currencies;
create table currencies (
  currencies_id int(11) not null auto_increment,
  title varchar(32) not null ,
  code char(3) not null ,
  symbol_left varchar(12) ,
  symbol_right varchar(12) ,
  decimal_point char(1) ,
  thousands_point char(1) ,
  decimal_places char(1) ,
  value float(13,8) ,
  last_updated datetime ,
  PRIMARY KEY (currencies_id)
);

insert into currencies (currencies_id, title, code, symbol_left, symbol_right, decimal_point, thousands_point, decimal_places, value, last_updated) values ('1', 'US Dollar', 'USD', '$', '', '.', ',', '2', '1.00000000', '2005-01-27 17:14:43');
drop table if exists customers;
create table customers (
  customers_id int(11) not null auto_increment,
  customers_gender char(1) not null ,
  customers_firstname varchar(32) not null ,
  customers_lastname varchar(32) not null ,
  customers_dob datetime default '0000-00-00 00:00:00' not null ,
  customers_email_address varchar(96) not null ,
  customers_default_address_id int(11) default '0' not null ,
  customers_telephone varchar(32) not null ,
  customers_fax varchar(32) ,
  customers_password varchar(40) not null ,
  customers_newsletter char(1) ,
  PRIMARY KEY (customers_id)
);

insert into customers (customers_id, customers_gender, customers_firstname, customers_lastname, customers_dob, customers_email_address, customers_default_address_id, customers_telephone, customers_fax, customers_password, customers_newsletter) values ('1', 'm', 'John', 'doe', '2001-01-01 00:00:00', 'root@localhost', '1', '12345', '', 'd95e8fa7f20a009372eb3477473fcd34:1c', '0');
insert into customers (customers_id, customers_gender, customers_firstname, customers_lastname, customers_dob, customers_email_address, customers_default_address_id, customers_telephone, customers_fax, customers_password, customers_newsletter) values ('2', 'm', 'KEVIN', 'SPECK', '1967-04-01 00:00:00', 'RACERX086@SBCGLOBAL.NET', '2', '972-935-3733', '', '3845cbce8f0895eefea1a0f9a6b3a666:03', '1');
drop table if exists customers_basket;
create table customers_basket (
  customers_basket_id int(11) not null auto_increment,
  customers_id int(11) default '0' not null ,
  products_id tinytext not null ,
  customers_basket_quantity int(2) default '0' not null ,
  final_price decimal(15,4) default '0.0000' not null ,
  customers_basket_date_added varchar(8) ,
  PRIMARY KEY (customers_basket_id)
);

insert into customers_basket (customers_basket_id, customers_id, products_id, customers_basket_quantity, final_price, customers_basket_date_added) values ('1', '2', '103', '1', '0.0000', '20050212');
insert into customers_basket (customers_basket_id, customers_id, products_id, customers_basket_quantity, final_price, customers_basket_date_added) values ('2', '2', '22{3}13', '1', '0.0000', '20050212');
insert into customers_basket (customers_basket_id, customers_id, products_id, customers_basket_quantity, final_price, customers_basket_date_added) values ('3', '2', '111', '1', '0.0000', '20050212');
insert into customers_basket (customers_basket_id, customers_id, products_id, customers_basket_quantity, final_price, customers_basket_date_added) values ('4', '2', '92', '1', '0.0000', '20050212');
insert into customers_basket (customers_basket_id, customers_id, products_id, customers_basket_quantity, final_price, customers_basket_date_added) values ('5', '2', '93', '1', '0.0000', '20050212');
insert into customers_basket (customers_basket_id, customers_id, products_id, customers_basket_quantity, final_price, customers_basket_date_added) values ('6', '2', '95', '1', '0.0000', '20050212');
insert into customers_basket (customers_basket_id, customers_id, products_id, customers_basket_quantity, final_price, customers_basket_date_added) values ('7', '2', '35', '1', '0.0000', '20050212');
insert into customers_basket (customers_basket_id, customers_id, products_id, customers_basket_quantity, final_price, customers_basket_date_added) values ('8', '2', '37', '1', '0.0000', '20050212');
insert into customers_basket (customers_basket_id, customers_id, products_id, customers_basket_quantity, final_price, customers_basket_date_added) values ('9', '2', '36', '1', '0.0000', '20050212');
insert into customers_basket (customers_basket_id, customers_id, products_id, customers_basket_quantity, final_price, customers_basket_date_added) values ('10', '2', '100', '1', '0.0000', '20050212');
insert into customers_basket (customers_basket_id, customers_id, products_id, customers_basket_quantity, final_price, customers_basket_date_added) values ('11', '2', '39', '1', '0.0000', '20050212');
drop table if exists customers_basket_attributes;
create table customers_basket_attributes (
  customers_basket_attributes_id int(11) not null auto_increment,
  customers_id int(11) default '0' not null ,
  products_id tinytext not null ,
  products_options_id int(11) default '0' not null ,
  products_options_value_id int(11) default '0' not null ,
  PRIMARY KEY (customers_basket_attributes_id)
);

insert into customers_basket_attributes (customers_basket_attributes_id, customers_id, products_id, products_options_id, products_options_value_id) values ('1', '2', '22{3}13', '3', '13');
drop table if exists customers_info;
create table customers_info (
  customers_info_id int(11) default '0' not null ,
  customers_info_date_of_last_logon datetime ,
  customers_info_number_of_logons int(5) ,
  customers_info_date_account_created datetime ,
  customers_info_date_account_last_modified datetime ,
  global_product_notifications int(1) default '0' ,
  PRIMARY KEY (customers_info_id)
);

insert into customers_info (customers_info_id, customers_info_date_of_last_logon, customers_info_number_of_logons, customers_info_date_account_created, customers_info_date_account_last_modified, global_product_notifications) values ('1', '0000-00-00 00:00:00', '0', '2005-01-27 17:14:43', '0000-00-00 00:00:00', '0');
insert into customers_info (customers_info_id, customers_info_date_of_last_logon, customers_info_number_of_logons, customers_info_date_account_created, customers_info_date_account_last_modified, global_product_notifications) values ('2', '2005-02-12 20:00:07', '1', '2005-02-12 13:39:31', NULL, '0');
drop table if exists geo_zones;
create table geo_zones (
  geo_zone_id int(11) not null auto_increment,
  geo_zone_name varchar(32) not null ,
  geo_zone_description varchar(255) not null ,
  last_modified datetime ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  PRIMARY KEY (geo_zone_id)
);

insert into geo_zones (geo_zone_id, geo_zone_name, geo_zone_description, last_modified, date_added) values ('1', 'Florida', 'Florida local sales tax zone', NULL, '2005-01-27 17:14:43');
drop table if exists languages;
create table languages (
  languages_id int(11) not null auto_increment,
  name varchar(32) not null ,
  code char(2) not null ,
  image varchar(64) ,
  directory varchar(32) ,
  sort_order int(3) ,
  PRIMARY KEY (languages_id),
  KEY IDX_LANGUAGES_NAME (name)
);

insert into languages (languages_id, name, code, image, directory, sort_order) values ('1', 'English', 'en', 'icon.gif', 'english', '1');
drop table if exists manufacturers;
create table manufacturers (
  manufacturers_id int(11) not null auto_increment,
  manufacturers_name varchar(32) not null ,
  manufacturers_image varchar(64) ,
  date_added datetime ,
  last_modified datetime ,
  PRIMARY KEY (manufacturers_id),
  KEY IDX_MANUFACTURERS_NAME (manufacturers_name)
);

insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('1', 'Mr. Gasket', NULL, '2005-02-03 07:58:28', '2005-02-03 07:59:20');
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('3', 'Fel-Pro', NULL, '2005-02-03 07:59:39', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('4', 'Moroso', NULL, '2005-02-03 07:59:58', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('5', 'Cloyes', NULL, '2005-02-03 08:00:17', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('6', 'PBM', NULL, '2005-02-03 08:00:29', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('7', 'Melling', NULL, '2005-02-03 08:00:42', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('8', 'Simpson', NULL, '2005-02-03 08:00:56', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('9', 'R.J.S.', NULL, '2005-02-03 08:01:18', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('10', 'K&N', NULL, '2005-02-03 08:01:31', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('11', 'RCI', NULL, '2005-02-03 08:01:44', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('12', 'Ultra Shield', NULL, '2005-02-03 08:02:02', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('13', 'Crane', NULL, '2005-02-03 08:02:17', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('14', 'TCI', NULL, '2005-02-03 08:02:26', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('15', 'Wilwood', NULL, '2005-02-03 08:02:39', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('16', 'MSD', NULL, '2005-02-03 08:02:52', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('17', 'Red Line', NULL, '2005-02-03 08:03:09', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('18', 'Taylor', NULL, '2005-02-03 08:03:20', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('19', 'Schoenfeld', NULL, '2005-02-03 08:03:34', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('20', 'Longacre', NULL, '2005-02-03 08:03:47', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('21', 'Scat', NULL, '2005-02-03 08:03:58', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('22', 'Eagle', NULL, '2005-02-03 08:04:09', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('23', 'Rebco', NULL, '2005-02-03 08:04:30', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('24', 'Intercomp', NULL, '2005-02-03 08:04:51', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('25', 'POP', NULL, '2005-02-03 08:05:00', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('26', 'Aeroquip', NULL, '2005-02-03 08:05:13', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('27', 'Afco', NULL, '2005-02-03 08:05:24', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('28', 'Sweet', NULL, '2005-02-03 08:05:35', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('29', 'KRC', NULL, '2005-02-03 08:09:30', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('30', 'PBM', NULL, '2005-02-03 08:09:40', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('31', 'Comp Cams', NULL, '2005-02-03 08:09:55', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('32', 'Hastings', NULL, '2005-02-03 08:10:07', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('33', 'Clevite', NULL, '2005-02-03 08:10:20', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('34', 'Speed Pro', NULL, '2005-02-03 08:10:34', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('35', 'Sealed Power', NULL, '2005-02-03 08:10:59', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('36', 'Barry Grant', NULL, '2005-02-03 08:11:14', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('37', 'Holley', NULL, '2005-02-03 08:11:25', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('38', 'ARP', NULL, '2005-02-03 08:11:35', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('39', 'Rebco', NULL, '2005-02-03 08:11:46', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('40', 'PRO Shocks', NULL, '2005-02-03 08:12:03', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('41', 'Bilstein', NULL, '2005-02-03 08:12:15', '2005-02-03 08:12:22');
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('42', 'Professional Products', NULL, '2005-02-03 08:12:44', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('43', 'Weiand', NULL, '2005-02-03 08:12:56', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('44', 'Dart', NULL, '2005-02-03 09:26:59', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('45', 'Howe', NULL, '2005-02-03 10:30:42', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('46', 'Hypereutectic', NULL, '2005-02-03 12:55:37', NULL);
drop table if exists manufacturers_info;
create table manufacturers_info (
  manufacturers_id int(11) default '0' not null ,
  languages_id int(11) default '0' not null ,
  manufacturers_url varchar(255) not null ,
  url_clicked int(5) default '0' not null ,
  date_last_click datetime ,
  PRIMARY KEY (manufacturers_id, languages_id)
);

insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('1', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('3', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('4', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('5', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('6', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('7', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('8', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('9', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('10', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('11', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('12', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('13', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('14', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('15', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('16', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('17', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('18', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('19', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('20', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('21', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('22', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('23', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('24', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('25', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('26', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('27', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('28', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('29', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('30', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('31', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('32', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('33', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('34', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('35', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('36', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('37', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('38', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('39', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('40', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('41', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('46', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('42', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('45', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('43', '1', '', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('44', '1', '', '0', NULL);
drop table if exists newsletters;
create table newsletters (
  newsletters_id int(11) not null auto_increment,
  title varchar(255) not null ,
  content text not null ,
  module varchar(255) not null ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  date_sent datetime ,
  status int(1) ,
  locked int(1) default '0' ,
  PRIMARY KEY (newsletters_id)
);

drop table if exists orders;
create table orders (
  orders_id int(11) not null auto_increment,
  customers_id int(11) default '0' not null ,
  customers_name varchar(64) not null ,
  customers_company varchar(32) ,
  customers_street_address varchar(64) not null ,
  customers_suburb varchar(32) ,
  customers_city varchar(32) not null ,
  customers_postcode varchar(10) not null ,
  customers_state varchar(32) ,
  customers_country varchar(32) not null ,
  customers_telephone varchar(32) not null ,
  customers_email_address varchar(96) not null ,
  customers_address_format_id int(5) default '0' not null ,
  delivery_name varchar(64) not null ,
  delivery_company varchar(32) ,
  delivery_street_address varchar(64) not null ,
  delivery_suburb varchar(32) ,
  delivery_city varchar(32) not null ,
  delivery_postcode varchar(10) not null ,
  delivery_state varchar(32) ,
  delivery_country varchar(32) not null ,
  delivery_address_format_id int(5) default '0' not null ,
  billing_name varchar(64) not null ,
  billing_company varchar(32) ,
  billing_street_address varchar(64) not null ,
  billing_suburb varchar(32) ,
  billing_city varchar(32) not null ,
  billing_postcode varchar(10) not null ,
  billing_state varchar(32) ,
  billing_country varchar(32) not null ,
  billing_address_format_id int(5) default '0' not null ,
  payment_method varchar(32) not null ,
  cc_type varchar(20) ,
  cc_owner varchar(64) ,
  cc_number varchar(32) ,
  cc_expires varchar(4) ,
  last_modified datetime ,
  date_purchased datetime ,
  orders_status int(5) default '0' not null ,
  orders_date_finished datetime ,
  currency char(3) ,
  currency_value decimal(14,6) ,
  PRIMARY KEY (orders_id)
);

drop table if exists orders_products;
create table orders_products (
  orders_products_id int(11) not null auto_increment,
  orders_id int(11) default '0' not null ,
  products_id int(11) default '0' not null ,
  products_model varchar(12) ,
  products_name varchar(64) not null ,
  products_price decimal(15,4) default '0.0000' not null ,
  final_price decimal(15,4) default '0.0000' not null ,
  products_tax decimal(7,4) default '0.0000' not null ,
  products_quantity int(2) default '0' not null ,
  PRIMARY KEY (orders_products_id)
);

drop table if exists orders_products_attributes;
create table orders_products_attributes (
  orders_products_attributes_id int(11) not null auto_increment,
  orders_id int(11) default '0' not null ,
  orders_products_id int(11) default '0' not null ,
  products_options varchar(32) not null ,
  products_options_values varchar(32) not null ,
  options_values_price decimal(15,4) default '0.0000' not null ,
  price_prefix char(1) not null ,
  PRIMARY KEY (orders_products_attributes_id)
);

drop table if exists orders_products_download;
create table orders_products_download (
  orders_products_download_id int(11) not null auto_increment,
  orders_id int(11) default '0' not null ,
  orders_products_id int(11) default '0' not null ,
  orders_products_filename varchar(255) not null ,
  download_maxdays int(2) default '0' not null ,
  download_count int(2) default '0' not null ,
  PRIMARY KEY (orders_products_download_id)
);

drop table if exists orders_status;
create table orders_status (
  orders_status_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  orders_status_name varchar(32) not null ,
  PRIMARY KEY (orders_status_id, language_id),
  KEY idx_orders_status_name (orders_status_name)
);

insert into orders_status (orders_status_id, language_id, orders_status_name) values ('1', '1', 'Pending');
insert into orders_status (orders_status_id, language_id, orders_status_name) values ('2', '1', 'Processing');
insert into orders_status (orders_status_id, language_id, orders_status_name) values ('3', '1', 'Delivered');
drop table if exists orders_status_history;
create table orders_status_history (
  orders_status_history_id int(11) not null auto_increment,
  orders_id int(11) default '0' not null ,
  orders_status_id int(5) default '0' not null ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  customer_notified int(1) default '0' ,
  comments text ,
  PRIMARY KEY (orders_status_history_id)
);

drop table if exists orders_total;
create table orders_total (
  orders_total_id int(10) unsigned not null auto_increment,
  orders_id int(11) default '0' not null ,
  title varchar(255) not null ,
  text varchar(255) not null ,
  value decimal(15,4) default '0.0000' not null ,
  class varchar(32) not null ,
  sort_order int(11) default '0' not null ,
  PRIMARY KEY (orders_total_id),
  KEY idx_orders_total_orders_id (orders_id)
);

drop table if exists products;
create table products (
  products_id int(11) not null auto_increment,
  products_quantity int(4) default '0' not null ,
  products_model varchar(12) ,
  products_image varchar(64) ,
  products_price decimal(15,4) default '0.0000' not null ,
  products_date_added datetime default '0000-00-00 00:00:00' not null ,
  products_last_modified datetime ,
  products_date_available datetime ,
  products_weight decimal(5,2) default '0.00' not null ,
  products_status tinyint(1) default '0' not null ,
  products_tax_class_id int(11) default '0' not null ,
  manufacturers_id int(11) ,
  products_ordered int(11) default '0' not null ,
  PRIMARY KEY (products_id),
  KEY idx_products_date_added (products_date_added)
);

insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('1', '0', '95470', 'PULLEY_BELT_KIT_SP_1_1.jpg', '79.9900', '2005-02-03 08:42:44', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('2', '0', '1304', 'WILWOOD CLUTCH M.C.jpg', '44.9900', '2005-02-03 08:49:48', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('4', '0', '95480', 'PULLEY_BELT_KIT_LP_RED.jpg', '89.9900', '2005-02-03 09:09:04', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('17', '0', 'AK1043', 'BILSTEIN AK1043.jpg', '59.9900', '2005-02-03 12:32:20', NULL, NULL, '0.00', '1', '0', '41', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('18', '0', 'Ak1044', 'BILSTEIN AK1044.jpg', '59.9900', '2005-02-03 12:35:09', NULL, NULL, '0.00', '1', '0', '41', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('7', '0', '', 'DART SS 67CC.jpg', '629.0000', '2005-02-03 09:28:36', NULL, NULL, '0.00', '1', '0', '44', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('8', '0', 'H860CP', 'S PRO H860CP.jpg', '184.0000', '2005-02-03 09:36:20', NULL, NULL, '0.00', '1', '0', '34', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('9', '0', 'H635CP', 'S PRO H635CP.jpg', '184.0000', '2005-02-03 09:46:14', NULL, NULL, '0.00', '1', '0', '34', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('10', '0', '882202', '350_882 HEADS 202.jpg', '399.0000', '2005-02-03 09:54:02', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('13', '0', '', 'STEERING WHEEL STEEL.jpg', '39.9900', '2005-02-03 10:16:12', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('12', '0', '', 'STEERING WHEEL STEEL.jpg', '39.9900', '2005-02-03 10:05:32', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('14', '0', '', 'STEERING WHEEL STEEL.jpg', '39.9900', '2005-02-03 10:17:58', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('15', '0', '6270Z', 'V COVERS GOLD.jpg', '29.9900', '2005-02-03 10:25:33', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('19', '0', '52031', 'INTAKE P.PROD.jpg', '139.9900', '2005-02-03 12:38:21', '2005-02-03 12:38:52', NULL, '0.00', '1', '0', '42', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('20', '0', '', 'MASTER CYL HOWE.jpg', '54.9900', '2005-02-03 12:42:57', NULL, NULL, '0.00', '1', '0', '45', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('21', '0', '15410', 'PULLEY_BELT_KIT_SP_1_1.jpg', '89.9900', '2005-02-03 12:50:50', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('22', '0', 'H345NP', 'S PRO H345NP.jpg', '89.9900', '2005-02-03 12:59:02', NULL, NULL, '0.00', '1', '0', '35', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('23', '0', 'H140CL', 'S PRO H140CL.jpg', '224.0000', '2005-02-03 13:02:59', NULL, NULL, '0.00', '1', '0', '34', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('24', '0', 'MWMS2', 'CAMSHAFT.jpg', '69.9900', '2005-02-03 13:11:56', '2005-02-13 16:18:53', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('25', '0', 'MWMS7', 'CAMSHAFT.jpg', '69.9900', '2005-02-03 13:14:46', '2005-02-03 13:46:34', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('26', '0', 'H624CP', 'S PRO H624CP.jpg', '184.0000', '2005-02-03 13:19:16', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('27', '0', 'H631CP', 'S PRO H631CP.jpg', '159.9900', '2005-02-03 13:23:01', NULL, NULL, '0.00', '1', '0', '34', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('28', '0', 'MWMS3', 'CAMSHAFT.jpg', '69.9900', '2005-02-03 13:33:39', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('29', '0', 'MWMS8', 'CAMSHAFT.jpg', '69.9900', '2005-02-03 13:37:14', '2005-02-13 16:18:13', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('30', '0', 'MWMS5', 'CAMSHAFT.jpg', '69.9900', '2005-02-03 13:41:47', '2005-02-13 16:20:07', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('31', '0', 'MWMS4', 'CAMSHAFT.jpg', '69.9900', '2005-02-03 13:45:14', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('32', '0', 'MWMS6', 'CAMSHAFT.jpg', '69.9900', '2005-02-03 13:49:54', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('33', '0', 'MWMSSP', 'CAMSHAFT.jpg', '69.9900', '2005-02-03 13:54:38', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('34', '0', '711B', 'BATTERY BOX.jpg', '24.9900', '2005-02-07 11:40:40', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('35', '0', '9-1100SP', 'CLOYES 9-1100SP.jpg', '39.9900', '2005-02-07 11:50:40', NULL, NULL, '0.00', '1', '0', '5', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('36', '0', 'KS2600', 'FEL PRO 350 GASKET SET.jpg', '34.9900', '2005-02-07 11:52:51', NULL, NULL, '0.00', '1', '0', '3', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('37', '0', '', 'LIFTERS HYDRAULIC.jpg', '49.9900', '2005-02-07 11:55:22', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('38', '0', '59010B', 'POWER STEERING KIT.jpg', '209.9900', '2005-02-07 12:05:34', NULL, NULL, '0.00', '1', '0', '29', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('39', '0', '', 'ROCKER ARMS 1.jpg', '39.9900', '2005-02-07 12:08:46', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('40', '0', '', 'STEERING WHEEL ALUM.jpg', '49.9900', '2005-02-07 12:12:09', '2005-02-07 12:12:38', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('41', '0', 'SA-2000', 'RCI M2000 HELMET.jpg', '199.0000', '2005-02-07 12:20:14', NULL, NULL, '0.00', '1', '0', '11', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('42', '0', '', 'window net mesh.jpg', '17.9900', '2005-02-07 12:24:10', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('43', '0', '', 'window net ribbon.jpg', '17.9900', '2005-02-07 12:25:44', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('44', '0', '', 'ultrashield high top shoes.jpg', '69.9900', '2005-02-07 12:28:48', NULL, NULL, '0.00', '1', '0', '12', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('45', '0', '', 'ultrashield bl gloves.jpg', '36.9900', '2005-02-07 12:37:29', NULL, NULL, '0.00', '1', '0', '12', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('46', '0', '6130P', 'VALVE COVERS CT.jpg', '26.9900', '2005-02-07 12:44:23', '2005-02-07 12:45:11', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('47', '0', '', 'MSD PLUG WIRES.jpg', '59.9900', '2005-02-07 12:54:27', NULL, NULL, '0.00', '1', '0', '16', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('49', '0', 'SH290s', 'CLEVITE_SH290S.jpg', '18.9900', '2005-02-07 13:06:10', '2005-02-13 15:24:40', NULL, '0.00', '1', '0', '33', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('50', '0', 'MS1038P', 'CLEVITE_MS1038P.jpg', '46.9900', '2005-02-07 13:08:32', '2005-02-13 15:22:39', NULL, '0.00', '1', '0', '33', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('51', '0', 'MS909H', 'CLEVITE_MS909H.jpg', '59.9900', '2005-02-07 13:12:21', '2005-02-13 15:17:04', NULL, '0.00', '1', '0', '33', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('52', '0', 'E243X', 'SEALED_POWER_RINGS.jpg', '37.9900', '2005-02-07 13:15:46', '2005-02-08 13:14:12', NULL, '0.00', '1', '0', '35', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('53', '0', '7547-1', 'IMCA SC INTAKE.jpg', '149.9900', '2005-02-07 13:19:49', NULL, NULL, '0.00', '1', '0', '43', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('54', '0', '', 'CLUTCH PEDAL WIL.jpg', '57.9900', '2005-02-07 13:26:17', NULL, NULL, '0.00', '1', '0', '15', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('55', '0', '', 'BRAKE PEDAL WILWOOD.jpg', '96.9900', '2005-02-07 13:28:14', NULL, NULL, '0.00', '1', '0', '15', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('56', '0', '', 'BRAKE_PEDAL_KIT_128.jpg', '189.9900', '2005-02-07 13:34:06', '2005-02-13 13:32:13', NULL, '0.00', '1', '0', '15', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('57', '0', '22103', 'W PUMP_STEWART_22103.jpg', '159.9900', '2005-02-07 13:37:37', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('58', '0', '', 'simpson high top shoes.jpg', '99.9900', '2005-02-07 13:40:42', NULL, NULL, '0.00', '1', '0', '8', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('59', '0', '', 'QUICK STEER HOWE.jpg', '148.9900', '2005-02-07 13:43:46', NULL, NULL, '0.00', '1', '0', '45', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('60', '0', '', 'LIFTERS SOLID.jpg', '69.9900', '2005-02-07 13:47:11', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('61', '0', '', 'rjs seat belt assem.jpg', '69.9900', '2005-02-07 13:51:25', NULL, NULL, '0.00', '1', '0', '9', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('62', '0', 'M4891', 'FUEL PUMP CARTER.jpg', '69.9900', '2005-02-07 14:09:02', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('63', '0', '170007', 'FUEL PUMP BG.jpg', '109.9900', '2005-02-07 14:11:29', '2005-02-07 14:17:43', NULL, '0.00', '1', '0', '36', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('64', '0', '12440', 'SHIFTER 2 LEVER.jpg', '59.9900', '2005-02-07 14:24:39', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('65', '0', '036-28', 'MINI SPOOL 28.jpg', '22.9900', '2005-02-08 08:41:31', '2005-02-13 09:55:13', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('66', '0', '036-31', 'MINI SPOOL 31.jpg', '22.9900', '2005-02-08 08:43:19', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('73', '0', '416194', '68CC_305_HEADS.jpg', '399.0000', '2005-02-08 09:41:53', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('68', '0', '679', 'AIR RIVETER.jpg', '69.9900', '2005-02-08 09:00:43', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('69', '0', '', 'ARM RESTRAINTS.jpg', '24.9900', '2005-02-08 09:05:56', NULL, NULL, '0.00', '1', '0', '12', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('70', '0', '9545', 'BEAD BREAKER.jpg', '44.9900', '2005-02-08 09:14:43', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('71', '0', '82315', 'LUG NUT WRENCH.jpg', '34.9900', '2005-02-08 09:19:19', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('72', '0', 'PB1012ST', 'BALANCER 6 INCH LW.jpg', '84.9900', '2005-02-08 09:29:02', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('74', '0', '44801', 'IGN. PNL.jpg', '24.9900', '2005-02-08 09:59:16', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('75', '0', '1333', 'WILWOOD CLUTCH M.C.jpg', '54.9900', '2005-02-08 10:13:11', NULL, NULL, '0.00', '1', '0', '15', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('76', '0', '', 'CLUTCH ASSEMBLY.jpg', '157.9900', '2005-02-08 10:16:29', NULL, NULL, '0.00', '1', '0', '15', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('77', '0', '82870', 'HYD. T.O.jpg', '149.9900', '2005-02-08 10:20:26', '2005-02-08 10:45:40', NULL, '0.00', '1', '0', '45', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('78', '0', '233902', 'TACH 233902.jpg', '119.9900', '2005-02-08 10:26:02', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('79', '0', '', 'STAGGER GAGE.jpg', '44.9900', '2005-02-08 10:29:49', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('80', '0', '', 'VAL;VE SPRINGS Z28.jpg', '24.9900', '2005-02-08 10:33:11', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('81', '0', '', 'ultrashield 360 neck collar.jpg', '26.9900', '2005-02-08 10:38:27', NULL, NULL, '0.00', '1', '0', '12', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('82', '0', '8288', 'HYD. T.O. BRG.jpg', '119.9900', '2005-02-08 10:44:16', '2005-02-13 09:56:17', NULL, '0.00', '1', '0', '45', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('83', '0', '78260', 'CASTER CAMBER LA.jpg', '129.9900', '2005-02-08 10:49:39', NULL, NULL, '0.00', '1', '0', '20', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('84', '0', '44831', 'ign.jpg', '30.9900', '2005-02-08 10:53:44', NULL, NULL, '0.00', '1', '0', '20', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('85', '0', '', 'AC STD HOUSING.jpg', '27.5000', '2005-02-08 11:03:49', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('86', '0', '28980', 'automatic shifter.jpg', '69.9900', '2005-02-08 11:06:19', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('87', '0', '139', 'HASTINGS_CAST_RINGS.jpg', '25.9900', '2005-02-08 11:12:24', '2005-02-08 13:12:40', NULL, '0.00', '1', '0', '32', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('88', '0', 'KS2614', 'FEL PRO GASKET SBC GASKET SET.jpg', '49.9900', '2005-02-08 11:15:56', NULL, NULL, '0.00', '1', '0', '3', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('89', '0', 'R9968', NULL, '119.9900', '2005-02-08 11:18:23', '2005-02-08 13:05:00', NULL, '0.00', '1', '0', '34', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('90', '0', 'R10375', NULL, '119.9900', '2005-02-08 11:20:46', '2005-02-08 13:07:59', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('91', '0', 'C5532', 'HASTINGS_CAST_RINGS.jpg', '69.9900', '2005-02-08 11:23:31', '2005-02-08 13:13:13', NULL, '0.00', '1', '0', '32', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('92', '0', 'MS909P', 'CLEVITE_MS909P.jpg', '25.9900', '2005-02-08 11:26:00', '2005-02-13 15:12:54', NULL, '0.00', '1', '0', '33', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('93', '0', 'CB663P', 'CLEVITE_CB663P.jpg', '20.9900', '2005-02-08 11:28:20', '2005-02-13 15:23:12', NULL, '0.00', '1', '0', '33', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('94', '0', 'CB663H', 'CLEVITE_CB663H.jpg', '59.9900', '2005-02-08 11:30:26', '2005-02-13 15:23:41', NULL, '0.00', '1', '0', '33', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('95', '0', 'E251K', 'SEALED_POWER_RINGS.jpg', '36.9900', '2005-02-08 11:38:48', '2005-02-08 13:01:38', NULL, '0.00', '1', '0', '35', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('96', '0', 'R9902', NULL, '99.9900', '2005-02-08 11:41:30', '2005-02-08 13:12:06', NULL, '0.00', '1', '0', '34', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('97', '0', '', 'LUG NUT SET.jpg', '0.9500', '2005-02-08 11:47:24', '2005-02-13 09:40:47', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('98', '0', '5620', 'SPACER_BEARINGS.jpg', '59.9900', '2005-02-08 11:49:47', '2005-02-13 15:25:29', NULL, '0.00', '1', '0', '33', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('99', '0', 'M55', 'MELLING_M55HV.jpg', '19.9900', '2005-02-08 11:51:16', '2005-02-08 12:19:54', NULL, '0.00', '1', '0', '7', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('100', '0', 'M-55HV', 'MELLING_M55HV.jpg', '24.9900', '2005-02-08 12:25:28', NULL, NULL, '0.00', '1', '0', '7', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('101', '0', '3-ICR5700', 'SCAT_3_ICR5700_RODS', '209.9900', '2005-02-09 09:55:53', '2005-02-13 16:43:56', NULL, '0.00', '1', '0', '21', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('102', '0', '3-ICR6000P', 'SCAT_3_ICR5700_RODS', '209.9900', '2005-02-09 10:03:23', '2005-02-13 16:46:37', NULL, '0.00', '1', '0', '21', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('103', '0', '3-ICR5700P', 'SCAT_3_ICR5700_RODS', '199.9900', '2005-02-09 10:10:05', '2005-02-13 16:44:54', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('104', '0', '3-ICR6000P', 'SCAT_3_ICR5700_RODS', '199.9900', '2005-02-09 10:12:02', '2005-02-13 16:47:44', NULL, '0.00', '1', '0', '21', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('105', '0', '2ICR-6000716', 'SCAT 2_ICR6000.jpg', '289.9900', '2005-02-09 10:35:12', '2005-02-13 16:41:23', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('106', '0', '2ICR5700716', 'SCAT 2_ICR6000.jpg', '289.9900', '2005-02-09 10:45:50', '2005-02-13 16:39:32', NULL, '0.00', '1', '0', '21', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('107', '0', 'SIR 5700BBLW', 'EAGLE_RODS.jpg', '209.9900', '2005-02-09 11:00:01', '2005-02-13 16:33:56', NULL, '0.00', '1', '0', '22', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('108', '0', 'SIR 6000BBLW', 'EAGLE_RODS.jpg', '209.9900', '2005-02-09 11:04:56', '2005-02-13 16:36:22', NULL, '0.00', '1', '0', '22', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('109', '0', '70000', 'PBM_CRANK.jpg', '219.9900', '2005-02-09 11:55:31', NULL, NULL, '0.00', '1', '0', '30', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('110', '0', '70004', 'PBM_CRANK.jpg', '219.9900', '2005-02-09 12:03:52', NULL, NULL, '0.00', '1', '0', '30', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('111', '0', '75000', 'PBM_CRANK.jpg', '169.0000', '2005-02-09 12:07:20', NULL, NULL, '0.00', '1', '0', '6', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('112', '0', '1412-16', 'COMP_CAMS_1412_16_ROLLER_TIP_ROCKERS.jpg', '159.9900', '2005-02-09 12:14:22', NULL, NULL, '0.00', '1', '0', '31', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('113', '0', 'C-3023XSP', 'CLOYES_C_3023XSP_TIMING_SET.jpg', '19.9900', '2005-02-09 12:18:20', NULL, NULL, '0.00', '1', '0', '5', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('114', '0', '9-3100A', 'CLOYES_9_3100A_TIMING_SET.jpg', '129.9900', '2005-02-09 12:30:32', NULL, NULL, '0.00', '1', '0', '5', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('115', '0', 'HP-2002', 'KN_OILFILTER_SHORT.jpg', '10.9900', '2005-02-09 12:36:29', NULL, NULL, '0.00', '1', '0', '10', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('116', '0', 'HP-3002', 'KN_OIL_FILTER_LONG.jpg', '10.9900', '2005-02-09 12:40:02', NULL, NULL, '0.00', '1', '0', '10', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('117', '0', '1615/1617/16', 'FAN_STEEL_RACING.jpg', '22.9900', '2005-02-09 12:46:43', '2005-02-13 09:03:07', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('118', '0', '1715/1717/17', 'FAN_STEEL_RACING.jpg', '30.9900', '2005-02-09 12:55:50', '2005-02-13 09:01:02', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('119', '0', '80204', 'WATER_WETTER.jpg', '8.9900', '2005-02-09 12:57:55', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('120', '0', 'FS200', 'FS212_FAN_SPACER.jpg', '23.9900', '2005-02-09 13:01:59', '2005-02-13 08:50:48', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('121', '0', 'FS212', 'FS212_FAN_SPACER.jpg', '24.9900', '2005-02-09 13:06:44', '2005-02-13 08:49:54', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('122', '0', 'FS300', 'FS212_FAN_SPACER.jpg', '25.9900', '2005-02-09 13:08:45', '2005-02-13 08:52:20', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('123', '0', '12103', 'STEWART_IRON_WATER_PUMP_LONG.jpg', '74.9900', '2005-02-09 13:20:13', '2005-02-13 09:08:27', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('124', '0', '13113', 'STEWART_IRON_WATER_PUMP_LONG.jpg', '74.9900', '2005-02-09 13:27:05', '2005-02-13 09:09:36', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('125', '0', '112ME', 'CALIPER_BRKT_WELD_METRIC.jpg', '11.9900', '2005-02-11 09:09:50', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('126', '0', '112GM', 'CALIPER_BRKT_WELD_FULLSIZE.jpg', '11.9900', '2005-02-11 09:12:46', '2005-02-13 09:11:20', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('127', '0', '114GM', 'CALIPER_BRKT_CLAMP_FULL_SIZE.jpg', '31.9900', '2005-02-11 09:16:27', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('128', '0', '114ME', 'CALIPER_BRKT_CLAMP_METRIC.jpg', '31.9900', '2005-02-11 09:20:02', '2005-02-13 09:10:33', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('129', '0', '75524', 'MOTORMOUNTS_FRONT_STEEL.jpg', '16.9900', '2005-02-11 09:31:16', '2005-02-13 08:47:41', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('130', '0', '75525', 'MOTORMOUNTS_REAR_STEEL.jpg', '24.9900', '2005-02-11 09:33:11', '2005-02-13 08:46:35', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('131', '0', '70152', 'SWEET_70152_STEERING_WHEEL.jpg', '64.9900', '2005-02-11 09:38:37', NULL, NULL, '0.00', '1', '0', '28', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('132', '0', '90906', 'WINDOW_NET_INSTALL_KIT_BUCKLE.jpg', '29.9900', '2005-02-11 09:50:21', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('133', '0', '360059', 'INTERCOMP_360059_TIRE_GAUGE.jpg', '49.9900', '2005-02-11 09:59:32', NULL, NULL, '0.00', '1', '0', '24', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('134', '0', '360063', 'INTERCOMP_360063.jpg', '29.9900', '2005-02-11 10:02:50', '2005-02-11 10:03:33', NULL, '0.00', '1', '0', '24', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('135', '0', '360069', 'INTERCOMP_360069.jpg', '39.9900', '2005-02-11 10:07:56', NULL, NULL, '0.00', '1', '0', '24', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('136', '0', '45761', 'LONGACRE_45761_BATT_DISCONNECT.jpg', '29.9900', '2005-02-11 10:16:37', NULL, NULL, '0.00', '1', '0', '20', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('137', '0', '46215', 'ACCUTECH_46215_GAUGE.jpg', '42.9900', '2005-02-11 10:23:17', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('138', '0', '46220', 'ACCUTECH_46220_GAUGE.jpg', '44.9900', '2005-02-11 10:26:54', '2005-02-11 10:32:04', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('139', '0', '46205', 'ACCUTECH_46205_GAUGE.jpg', '30.9900', '2005-02-11 10:29:18', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('140', '0', '46210', 'ACCUTECH_46210_GAUGE.jpg', '28.9900', '2005-02-11 10:31:07', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('141', '0', '03914S', 'WHEEL_STUDS_039145.jpg', '2.8900', '2005-02-11 10:40:49', '2005-02-13 10:00:13', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('142', '0', '30303', 'AFCO_STEERING_U-JOINT.jpg', '46.9900', '2005-02-11 10:48:56', NULL, NULL, '0.00', '1', '0', '27', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('143', '0', '30305', 'AFCO_STEERING_U-JOINT.jpg', '48.9900', '2005-02-11 10:51:40', NULL, NULL, '0.00', '1', '0', '27', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('144', '0', '30306', 'AFCO_STEERING_U-JOINT.jpg', '48.9900', '2005-02-11 10:54:47', NULL, NULL, '0.00', '1', '0', '27', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('145', '0', '30307', 'AFCO_STEERING_U-JOINT.jpg', '48.9900', '2005-02-11 10:57:06', NULL, NULL, '0.00', '1', '0', '27', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('146', '0', '30308', 'AFCO_STEERING_U-JOINT.jpg', '48.9900', '2005-02-11 10:59:15', NULL, NULL, '0.00', '1', '0', '27', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('147', '0', '3400', 'REBCO_IGN_PANEL_3400.jpg', '26.9900', '2005-02-11 11:07:11', NULL, NULL, '0.00', '1', '0', '23', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('148', '0', '3410', 'REBCO_IGN_PANEL_3410.jpg', '31.9900', '2005-02-11 11:08:29', '2005-02-11 11:09:03', NULL, '0.00', '1', '0', '23', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('149', '0', '44611', 'LONGACRE_IGN_PANEL_44611.jpg', '35.9900', '2005-02-11 11:14:04', NULL, NULL, '0.00', '1', '0', '20', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('150', '0', '01201', 'ULTRASHIELD_TEAROFFS.jpg', '14.9900', '2005-02-11 11:19:27', NULL, NULL, '0.00', '1', '0', '12', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('151', '0', '01202', 'ULTRASHIELD_TEAROFFS.jpg', '14.9900', '2005-02-11 11:22:24', '2005-02-11 11:23:24', NULL, '0.00', '1', '0', '12', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('152', '0', '3270', 'LONGACRE_3270_CARBLINKAGE_KIT.jpg', '29.9900', '2005-02-11 11:33:35', NULL, NULL, '0.00', '1', '0', '20', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('153', '0', '10392', 'RADIATER_CAP_10372.jpg', '18.9900', '2005-02-11 11:42:14', '2005-02-13 09:03:48', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('154', '0', '8630', 'REBCO_DISCONNECT_HUB_QDH.jpg', '44.9900', '2005-02-11 11:53:39', NULL, NULL, '0.00', '1', '0', '23', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('155', '0', 'QDH', 'REBCO_DISCONNECT_HUB_QDH.jpg', '20.9900', '2005-02-11 12:01:18', NULL, NULL, '0.00', '1', '0', '23', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('156', '0', '120040', 'STEERING_SHAFT_BRKT_120040.jpg', '14.9900', '2005-02-11 12:04:27', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('157', '0', 'CMR757', 'STEERING_SHAFT_ROD_END.jpg', '12.9900', '2005-02-11 12:09:00', NULL, NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('158', '0', '04112', 'BRAIDED_LINE_4_STRAIGHT.jpg', '10.9900', '2005-02-11 12:15:03', '2005-02-11 12:20:00', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('159', '0', '04912', 'BRAIDED_LINE_4_90.jpg', '13.9900', '2005-02-11 12:17:08', '2005-02-11 12:19:27', NULL, '0.00', '1', '0', '0', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('160', '0', '', NULL, '169.9900', '2005-02-13 10:33:34', NULL, NULL, '0.00', '1', '0', '19', '0');
drop table if exists products_attributes;
create table products_attributes (
  products_attributes_id int(11) not null auto_increment,
  products_id int(11) default '0' not null ,
  options_id int(11) default '0' not null ,
  options_values_id int(11) default '0' not null ,
  options_values_price decimal(15,4) default '0.0000' not null ,
  price_prefix char(1) not null ,
  PRIMARY KEY (products_attributes_id)
);

insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('1', '27', '3', '11', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('2', '27', '3', '10', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('3', '27', '3', '12', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('4', '27', '3', '13', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('5', '22', '3', '11', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('6', '22', '3', '10', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('7', '22', '3', '12', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('8', '22', '3', '13', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('9', '26', '3', '11', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('10', '26', '3', '10', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('13', '9', '3', '11', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('12', '26', '3', '13', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('14', '9', '3', '10', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('15', '9', '3', '12', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('16', '9', '3', '13', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('17', '8', '3', '11', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('18', '8', '3', '10', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('19', '8', '3', '12', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('20', '8', '3', '13', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('21', '23', '3', '11', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('22', '23', '3', '12', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('23', '23', '3', '13', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('24', '14', '4', '14', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('25', '14', '4', '15', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('28', '24', '6', '31', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('29', '24', '6', '30', '60.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('30', '33', '6', '31', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('31', '33', '6', '30', '60.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('32', '28', '6', '31', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('33', '28', '6', '30', '60.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('34', '31', '6', '31', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('35', '31', '6', '30', '60.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('36', '30', '6', '31', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('37', '30', '6', '30', '60.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('38', '32', '6', '31', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('39', '32', '6', '30', '60.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('40', '25', '6', '31', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('41', '25', '6', '30', '60.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('42', '29', '6', '31', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('43', '29', '6', '30', '60.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('44', '20', '7', '32', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('45', '20', '7', '33', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('46', '20', '7', '34', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('47', '118', '4', '14', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('48', '118', '4', '15', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('49', '118', '4', '46', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('50', '117', '4', '14', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('51', '117', '4', '15', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('52', '117', '4', '46', '2.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('53', '57', '10', '47', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('54', '57', '10', '32', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('55', '97', '11', '48', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('56', '97', '11', '49', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('57', '97', '11', '50', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('58', '97', '11', '51', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('59', '56', '8', '35', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('60', '56', '8', '36', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('61', '56', '7', '32', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('62', '56', '7', '33', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('63', '56', '7', '34', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('64', '55', '8', '35', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('65', '55', '8', '36', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('66', '54', '8', '35', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('67', '54', '8', '36', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('68', '76', '8', '35', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('69', '76', '8', '36', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('70', '92', '5', '10', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('71', '92', '5', '16', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('72', '92', '5', '17', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('73', '92', '5', '11', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('74', '51', '5', '10', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('75', '51', '5', '16', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('76', '51', '5', '17', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('77', '50', '5', '10', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('78', '50', '5', '16', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('79', '50', '5', '17', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('80', '50', '5', '11', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('81', '93', '5', '10', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('82', '93', '5', '16', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('83', '93', '5', '17', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('84', '93', '11', '11', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('85', '94', '5', '10', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('86', '94', '5', '16', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('87', '94', '5', '17', '0.0000', '+');
drop table if exists products_attributes_download;
create table products_attributes_download (
  products_attributes_id int(11) default '0' not null ,
  products_attributes_filename varchar(255) not null ,
  products_attributes_maxdays int(2) default '0' ,
  products_attributes_maxcount int(2) default '0' ,
  PRIMARY KEY (products_attributes_id)
);

drop table if exists products_description;
create table products_description (
  products_id int(11) not null auto_increment,
  language_id int(11) default '1' not null ,
  products_name varchar(64) not null ,
  products_description text ,
  products_url varchar(255) ,
  products_viewed int(5) default '0' ,
  PRIMARY KEY (products_id, language_id),
  KEY products_name (products_name)
);

insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('1', '1', 'Aluminum Pulley And Belt Kit/Short Water Pump', 'Small block chevy aluminum pulley and belt kit,for short water pump,25% reduction,upper pulley fits 5/8\" or 3/4\" water pump shaft. Kit includes 2 groove upper and 2 groove lower pulley and pair of belts.', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('2', '1', 'Wilwood 3/4\" Master Cylinder', 'Wilwood girling style aluminum master cylinder, 3/4\" bore. Ideal for operating clutch slave cylinders or hydraulic throwout bearings.', '', '4');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('4', '1', 'Aluminum Pulley And Belt Kit/Long Water Pump', 'Small block chevy aluminum pulley and belt kit,for long water pump,25% reduction,upper pulley fits 5/8\" or 3/4\" water pump shaft. Kit includes 2 groove upper and 2 groove lower pulley and pair of belts', '', '3');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('17', '1', 'Bilstein-Street Stock Shock GM Front', 'Pair of Bilstein AK 1043 Shocks,mono-tube gas pressure shocks, IMCA legal. Bilstein shocks will not fade like ordinary twin tube shocks. Fits front of 73 - 88 Chevelle, Monte Carlo, Buick Regal.', '', '4');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('18', '1', 'Bilstein-Street Stock Shock GM Rear', 'Pair of Bilstein AK 1044 Shocks, mono-tube gas pressure shocks, IMCA legal. Bilstein shocks will not fade like ordinary twin tube shocks. Fits rear of 73 - 88 Chevelle, Monte Carlo, Buick Regal.', '', '7');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('7', '1', 'Dart Iron Eagle SS 67cc 2.02/ 1.60 Cylinder Heads', 'Description 

Pair of assembled Dart SS cylinder heads for carbureted small block 327, 350, 377, 383 or 400 engines. (377 & 400 applications for street would require steam holes to be drilled) 67cc, heart shaped combustion chambers with spark plug located closer to the chamber roof for better flame travel. Straight plug design. High flow 170cc intake runners. Integral valve guides. These heads are assembled in our machine shop. Seat concentricy is checked, mild bowl blending is done to remove any casting intrusions. Assembled with premium stainless 2.02 intake valves and 1.60 exhaust valves with necked down stems. New .550 lift Z-28 valve springs, new steel retainers, hardened locks, and umbrella valve seals. Screw in rocker arm studs (3/8\") and guideplates are also included. All machine work is done in our own shop on quality equipment', '', '7');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('8', '1', 'Pistons 383 Flat Top Coated Skirts-Balanced Set', 'Set of 8 Speed Pro #H860CP .030 hypereutectic pistons. Piston set is fully balanced in our machine shop to within 1 gram. Teflon coated skirts. Flat top pistons with 2 valve reliefs. 5/64\", 5/64\", 3/16\" ring grooves. For use with 5.7 length rods. Compression with 64cc heads is approx. 10 to 1, with 76cc heads is approx. 9 to 1. Includes snap rings, pistons can be pressed or full floated. Gram weights between sets vary but are approx. 535 grams piston weight and 132 grams pin weight.', '', '4');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('9', '1', 'Pistons - 383-.200 Dome-Coated Skirts-Balanced Set', 'set of 8 Speed Pro #H635CP .030 pistons. Piston set is fully balanced in our machine shop to within 1 gram. Teflon coated skirts. Pistons have .200 dome. 5/64, 5/64, 3/16 ring grooves. For use with 5.7 length rods. Compression with 64cc heads is approx. 12.4 to 1, with 76cc heads is approx. 10.7 to 1. Includes snap rings, pistons can be pressed or full floated. Gram weights between sets vary buy are approx. 545 grams piston weight and 160 grams pin weight.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('10', '1', '350 Chevy Performance Heads 2.02/1.60', 'Pair of casting #882 heads with intake valve size increased to 2.02, 1.60 exhaust valves. Approx. 76cc combustion chamber. These heads will work on the street with unleaded fuel and have bolt holes on ends of heads for all accessories. These heads are for carbureted engins. Three angle valve job, surfaced, new valve guides,assembled with new premium stainless 2.02 intake valves and 1.60 exhaust valves with necked down stems. New .550 lift Z-28 valve springs, new steel retainers and hardened valve locks, umbrella valve seals. Heads have 3/8\" press in rocker studs. All machine work is done in our own shop on quality equipment.', '', '10');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('14', '1', 'Steel Steering Wheel', 'Steel steering wheel, 3\" dish, your choice of 15\" or 17\" diameter.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('15', '1', 'SB Chevy CT Valve Covers-Gold', 'Pair of steel, SBC tall circle track valve covers. Tall enough to clear stud girdles. Two baffeled 1 1/2\" breather tubes on one valve cover.', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('19', '1', 'SBC Aluminum Intake-Hurricane', 'Small block chevy Professional Products #52031 Intake Manifold.', '', '3');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('20', '1', 'Howe Aluminum Master Cylinder', 'Aluminum Howe Master Cylinder. Stainless steel bore. Your choice of 3/4\", 7/8\" or 1\" bore size.', '', '3');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('21', '1', 'Aluminum Pulley & Belt Kit/Short Water Pump 1:1', 'Small block chevy polished aluminum pulley and belt kit for short water pump. 1 to 1 pulleys. Upper pulley fits 5/8\" or 3/4\" water pump shaft. Kit includes 2 groove upper pulley and 2 groove lower pulley and pair of belts.', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('22', '1', 'Pistons - 350 Flat Top Hyper. - Balanced Set', 'Set of 8 Sealed Power #H345NP  hypereutectic pistons. Piston set is fully balanced in our machine shop to within 1 gram. (These pistons sell for $160.00 a set at Jegs and are not balanced this closely.) Flat top pistons with 4 valve reliefs. 5/64\", 5/64\", 3/16\" ring grooves. For use with 5.7\" rods(stock 350 rod length). Compression with 64cc heads is approx. 9.4 to 1, with 76cc heads is approx. 8.4 to 1. Pistons are for press fit rods only. Gram weights between sets vary but are approx. 557 grams piston weight and 145 grams pin weight.', '', '9');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('23', '1', 'Pistons-350 6IN Rod FT-Coated Skirts- Balanced Set', 'Set of Speed Pro #H140CL  lightweight CNC machined 350 Chevy hypereutectic pistons. Piston set is fully balanced in our machine shop to within 1 gram. For use with 6.0\" rods. Teflon coated skirts. 1/16\", 1/16\", 1/8\" ring grooves. Compression with 64cc heads is approx. 9.7 to 1, with 76cc heads is approx. 8.6 to 1. Includes snap rings, pistons can be pressed or full floated. Gram weights between sets vary but are approx. 466 grams piston weight and 126 grams pin weight.', '', '9');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('24', '1', 'SBC #2 Solid Lifter Cam', 'SBChevy # 2 solid lifter camshaft . Specs on cam are 256 deg. intake duration at .050, 264 deg. exhaust duration at .050, .545 intake lift, .563 exhaust lift. 105 deg. lobe seperation. Compression of 11.5 to 1 or higher recommended, 3000 - 7000 rpm. Save $$$ add a set of solid lifters for only $60.00.', '', '9');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('25', '1', 'SBC #7 Solid Lifter Cam', 'SB Chevy# 7 solid lifter camshaft . Specs on cam are 256 deg. intake duration at .050, 260 deg. exhaust duration at .050, 552 intake lift, 563 exhaust lift. 102 lobe separation. Compression of 11.1 recommended, light car, 4000-7100 RPM. Save $$$ add a set of solid lifters for only $60.00.', '', '7');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('26', '1', 'Pistons - 383-.100 Dome-Coated Skirts-Balanced Set', 'Set of 8 Speed Pro # H624CP  pistons. Piston set is balanced in our machine shop to within 1 gram. Teflon coated skirts. Pistons have .100 dome. 5/64\", 5/64\", 3/16\" ring grooves. For use with 5.7\" length rods. Compression with 64cc heads is approx. 11.5 to 1, wiyh 76cc heads is approx. 10 to 1. Includes snap rings, pistons can be pressed or full floated. Gram weights between sets vary but are approx. 531 grams piston weight and 160 grams pin weight.', '', '4');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('27', '1', 'Pistons - 350 - FT 2 Valve Relief Coated Pistons - Balanced Set', 'Set of 8 Speed Pro #H631CP hypereutectic pistons. Piston set is fully balanced in our machine shop to within 1 gram. Teflon coated skirts. Flat top pistons with 2 valve reliefs. 5/64\", 5/64\", 3/16\" ring grooves. For use with 5.7 length rods. Compression with 64cc heads is approx. 9.7 to 1, with 76cc heads is approx. 8.6 to 1. Includes snap rings, pistons can be pressed or full floated. Gram weights between sets vary but are approx. 579 grams piston weight and 160 grams pin weight.', '', '14');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('32', '1', 'SBC #6 Solid Lifter Cam', 'SB Chevy #6 solid lifter camshaft . Specs on cam are 252 deg. intake duration at .050, 256 deg. exhaust duration at .050, .542 intake lift, .552 exhaust lift. 102 deg. lobe seperation. Recommended compression of 11.1 or lower, 3500-6500 RPM. Save $$$ add a set of 16 solid lifters for only $60.00.', '', '10');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('28', '1', 'SBC #3 Solid Lifter Cam', 'SB Chevy # 3 solid lifter camshaft . Specs on cam are 250 deg intake duration at .050, 260 deg exhaust duration at .050, .532 intake lift, .555 exhaust lift. 106 deg lobe seperation. Compression of 12-1 or higher recommended, 2 Barrel applications, 2800-6500 RPM. Save $$$ add a set of 16 solid lifters for only $60.00.', '', '4');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('29', '1', 'SBC #8 Solid Lifter Cam', 'SB Chevy# 8 solid lifter camshaft. Specs on cam are 248 deg intake duration at .050, 252 deg exhaust duration at .050, .530 intake lift, .542 exhaust lift, 106 deg. lobe seperation. Monster torque cam, 2700-7000 RPM. Save $$$ add a set of 16 solid lifters for only $60.00.', '', '6');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('30', '1', 'SBC #5 Solid Lifter Cam', 'SB Chevy# 5 solid lifter camshaft . Specs on cam are .249 deg. intake duration at .050, 249 deg. exhaust duration at .050, .508 intake lift, .508 exhaust lift. 106 deg. lobe separation. Recommended for 9.1 compression motors, 3600-7000 RPM. Save $$$ add a set of 16 solid lifters for only $60.00.', '', '6');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('31', '1', 'SBC #4 Solid Lifter Cam', 'SB Chevy # 4 solid lifter camshaft . Specs on cam are 251 deg intake duration at .050, 265 deg exhaust duration .050, .535 intake lift, .525 exhaust lift. 106 deg lobe seperation. Compression of 12 to 1 recommended, 3500-7200 RPM. Save $$$ add a set of 16 solid lifters for only $60.00.', '', '5');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('33', '1', 'SBC SP Solid Lifter Cam', 'SB Chevy #SP solid lifter camshaft . Specs on cam are 255 deg intake duration at .050, 265 deg exhaust duration at .050, .535 intake lift, .555 exhaust lift. 106 deg lobe seperation. Compression of 11.5 or higher recommended, 3200-7200 RPM. Save $$$ add a set of 16 solid lifters for only $60.00.', '', '8');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('34', '1', 'Circle Track Battery Box', 'Circle Track Battery Box, measures 7\"x11\". Hold down swivels out of the way for easy battery installation.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('35', '1', 'Cloyes Street True Roller Timing Set', 'Cloyes #9-1100SP street true roller timing chain and gear set for pre 87 small block chevy engines. Double row true roller chain with .250 diameter rollers, cast iron cam gear, billet steel 3 keyway crank gear with 0, 4 degree advance and 4 degree retard keyways.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('36', '1', 'Fel Pro 350 Overhaul Gasjet Set', 'Fel Pro # KS2600 350 Chevy overhaul gasket set, fits 69 - 79 350 engines and also older 283 & 327 engines.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('37', '1', 'Hydraulic Lifters', 'Set of 16 hydraulic lifters for small block chevy.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('38', '1', 'GM-KRC V-Belt P.S. Kit / Steel Pump', 'Complete with all new steel pump, head or block bracket, reservoir and a reservoir bracket. Your choice of conventional V-belt or a serpentine pulley!! The reservoir uses a #6 fitting on the side and a #10 on the bottom.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('39', '1', 'SBC Long Slot Rocker Arms', 'Set of SBC long slot, 1.5 ratio, stamped steel rocker arms. Includes 16 rocker arms, 16 grooved balls, and 16 3/8\" nuts.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('40', '1', 'Aluminum Steering Wheel', 'Aluminum steering wheel. 3\" dish. Your choice of 15\" or 17\" diameter.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('41', '1', 'RCI- SA2000 Helmet', 'RCI SFI certified SA2000 Helmet.Available in white only. Your choice of size Small - 7, Medium - 7 1/4, Large - 7 1/2,  XL - 7 3/4. This helmet sells for $249.95 at Summit.  Multi laminated fiberglass shell, form fitting fire resistant Nomex liner, Kevlar chin strap, large countoured eyeport, clear .125 lexan shield with thumb tab, fully adjustable detent shield pivot with tearoff posts, adjustable chin and forehead fresh air vents. Tearoffs also available.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('42', '1', 'Window Net, Mesh Style', 'Mesh window net. 24\"x17\". This is a quality SFI certified net. Your choice of black,red or blue. SFI spec is 27.1.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('43', '1', 'Window Net, Ribbon Style', 'Ribbon window net. 18\"x24\". This is a quality SFI certified net. Your choice of black, blue, red , yellow, orange, purple, or gray. SFI spec is 27.1.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('44', '1', 'Ultra Shield High Top Driving Shoes', 'Pair of black Ultrashield driving shoes,SFI spec 3.3/5.Your choice of size 9,10,11,12,or 13.', '', '3');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('45', '1', 'Ultra Shield Single Layer Driving Gloves', 'Pair of Ultrashield single layer driving gloves,SFI spec 3.3/1.Your choice of black, blue, or red. Sizes S,M,L or XL.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('46', '1', 'SB Chevy Valve Covers-Black', 'Pair of steel, SBC tall circle track valve covers. Tall enough to clear stud girdles. Two baffeled 1 1/2\" breather tubes on one valve cover.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('47', '1', 'SBC-MSD 8MM Spark Plug Wires', 'MSD 8mm small block Chevy spark plug wire set. Your choice of over the valve cover or extra long under the header routing,preteminated HEI style distributor ends, 90 degree angle spark plug ends. Blue in color. Includes coil wire for remote mounted coils.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('49', '1', 'Clevite SBC-Cam Bearings', 'Clevite 77 small Block Chevy cam bearings.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('50', '1', 'Clevite Main Bearings-400 Chevy', 'Clevite 77 P series small block Chevy 400 Main bearing set. Available in Std., .010, .020 or .030  undersize.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('51', '1', 'Clevite Main Bearings-350/383 Chevy-H Series', 'Clevite 77 H series main bearing set for 350/383 Small Block Chevy engines. Chamfered to work with aftermarket cranks. Unplated hardened steel back for better dimensional accuracy and bore contact. High crush for better seating. Available in Std., .010 or .020. undersize.', '', '3');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('52', '1', 'Sealed Power Cast Rings- 400 Chevy 5/16-5/64-3/16', 'Sealed Power rings, 400 Chevy.Ring widths are 5/16-5/64-3/16. Set of Sealed Power #E243X cast rings for 377/400 Chevy engines. Ring widths are 5/64\", 5/64\", 3/16\". Available sizes are std., .30, .40 or .60.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('53', '1', 'SBC Aluminum Intake-IMCA', 'Weiand #7547-1 intake manifold. IMCA approved for stock car class. Fits small block chevy.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('54', '1', 'Wilwood Clutch Pedal', 'Wilwood Clutch Pedal. Lightweight aluminum pedal with non-slip foot pad. Your choice of floor mount or swing mount.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('55', '1', 'Wilwood Brake Pedal w/Balance Bar', 'Wilwood brake pedal with balance bar. Lightweight anodized aluminum pedal with a nonslip foot pad. Your choice of floor mount or swing mount.', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('56', '1', 'Wilwood Brake Pedal Kit', 'Assembly includes Wilwood brake pedal with balance bar and 2 Howe master cylinders. Lightweigt anodized aluminum pedal with a non slip foot pad. Your choice or floor or swing mount pedal and master cylinder bore sizes of 3/4\", 7/8\" or 1\".', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('57', '1', 'Stewart Aluminum Water Pump', 'Short style SBC Stewart Components Stage 2 aluminum water pump. 356-T6 heat-treated aluminum castings, heavy duty bearing + hub, more efficient impeller, your choice of #22103 with 5/8\" dia. shaft or #22203 with 3/4\" dia. shaft. Guranteed for one year.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('58', '1', 'Simpson High Top Shoes', 'Pair of Black Simpson high top driving shoes. SFI spec 3.3/5. Your choice of size - 9,9 1/2, 10, 10 1/2,11, 12 or 13.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('59', '1', 'Howe Quick Steer', 'Howe Quick Steer Box. Your choice of 1.5:1 or 2:1. Heat treated internal gears and shafts. Weighs 3.5 lbs.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('60', '1', 'Solid Lifters', 'Set of 16 solid lifters for small block chevy.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('61', '1', 'Seat Belt Kit-R.J.S. V-Style', 'RJS seat belt kit. SFI spec 16.1. Includes 3\" lap belt, 3\" V style shoulder harness, and sub belt. Your choice of black, blue, purple, red, or gray.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('62', '1', 'SBC-Carter Fuel Pump', 'SBC Strip super pump, 1/4\" NPT inlet and outlet, 120 gallons per minute, Clockable- allows rotation of inlet and outlet, Light weight aluminum-dissipates heat.', '', '4');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('63', '1', 'SBC- Barry Grant Alcohol Pump', 'Delivers up to 130 gallons per hour, 15PSI, Alcohol 6 valve fuel pump 1/2\" NPT, requires fuel pressure regulator.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('64', '1', '2 Lever Deluxe Shifter', '2 Lever Deluxe Shifter. Complete with rods and heims, 1 - 24\" long rod, 1 - 18\" long rod.', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('65', '1', 'Mini Spool - 9\" Ford - 28 Spline', '9\" Ford 28 Spline Mini Spool. Top quality mini spool we have sold for years, dirt track proven. Not for street or drag racing use.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('66', '1', 'Mini Spool- 9\" Ford- 31 Spline', '9\" Ford 31\" Spline Mini Spool. Top quality mini spool we have sold for years,dirt track proven. Nor for street or drag racing use.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('73', '1', '350 Chevy Performance Heads-68cc', 'Pair of casting #416 heads with intake valve size increased to 1.94, 1.50 exhaust valves, combustion chamber walls are cut around valves to clear domed pistons and unshroud valves for better air flow, combustion chamber size is approx. 68cc for increased compression ratio. These heads will work on the street with unleaded fuel and have bolt holes on ends of heads for all accesories. These heads are for carbureted engines. Three angle valve job, surfaced, new valve guides, assembled with new premium stainless valves with necked down stems, new .550 lift Z-28 valve springs, new steel retainers and hardened valve locks, umbrella valve seals. These heads have 3/8\" press in studs.', '', '7');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('68', '1', 'Air Riveter', 'Air Riveter. Pulls 1/8\", 5/32\" and 3/16\" rivets. 1 year warranty.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('69', '1', 'Arm Restraints', 'Ultrashield Arm Restraints,Black, individual style.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('70', '1', 'Bead Breaker', 'Bead Breaker, gold anodized, wide foot for easier tire breakdown.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('71', '1', 'Lug Nut Wrench', 'Quick change lug nut wrench. Chrome plated, center handle spins freely for quick lug nut removal. Fits 1\" lug nuts.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('72', '1', 'SBC 6 1/8\" Lightweight Balancer', 'Lightweight 6 1/8\" balancer, only 4.6 lbs. Fits small block Chevy, internal balance. Powerbonded steel outer ring to withstand higher RPM\'s. Etched timing marks.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('74', '1', 'Longacre Ignition Switch Panel W/ Lite', 'Longacre Ignition Switch Panel, prewired, 40 amp, rubber switch covers.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('75', '1', 'Wilwood Clutch Slave Cylinder', 'Wilwood girling style aluminum master cylinder, 3/4\" bore. Ideal for operating clutch slave cylinders or hydraulic throwout bearings.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('76', '1', 'Wilwood Clutch Assembly', 'Assembly includes new Wilwood aluminum pedal (your choice of floor or swing mount), 3/4\" aluminum master cylinder, and pull type slave cylinder.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('77', '1', 'Howe Stock Clutch Hydraulic Throwout Bearing', 'Howe # 82870 throwout bearing for stock clutch .789 travel. Made to work with Saginaw, Muncie and T-10 transmissions. Works with a 3/4\" master cylinder.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('78', '1', 'Autometer 5\" Memory Tach', '5\" recall tach, Autogage by Autometer #233902. Peak rpm memory, switch built in tach face.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('79', '1', 'Tire Stagger Gauge', 'Tire Stagger Gauge. Polished aluminum gauge measures tires 65\" to 115\".', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('80', '1', 'SBC Z-28 Valve Springs', 'Set of 16, Z-28 valve springs. Fits small block Chevy, stock diameter, 1.250 O.D., maximum lift .550.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('81', '1', 'Ultra Shield 360 Neck Collar', 'Ultrashield 360 degree neck collar. SFI spec 3.3. Your choice of black,red,or blue.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('82', '1', 'Howe Hydraulic Throwout Bearing', 'Howe #8288 Hydraulic throwout bearing. Use with stock Chevy or Ford transmissions (Saginaw, Muncie,Ford T10) .375 travel. Works with 3/4\" master cylinder. (will not work with stock or ram clutch or an 5.5\" clutch).', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('83', '1', 'Longacre Caster/Camber Gauge', 'Longacre caster/camber gauge with magnetic adapter and case. Reads caster from +8 degrees to -8 degrees , and camber from +6 degrees to -6 degrees in 1/4 degree increments. Includes foam lined case.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('84', '1', 'Longacre Ignition Switch Panel W/lite', 'Longacre Switch Panel, prewired, 40 amp, rubber switch covers, indicator light.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('85', '1', 'Aluminum Air Cleaner Housing', 'Spun aluminum air cleaner housing. Includes 14\" diameter lid and base, 1 3/8\" drop.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('86', '1', 'Automatic Shifter', 'Automatic Shifter. Positive detents, shifter rod is 20\" long, weighs only 9 oz..', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('87', '1', 'Hastings Cast Rings 5/64 5/64 3/16', 'Hastings cast rings for SBC 350/383. Ring widths are 1/16, 1/16, 3/16. Available 30,40, 60.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('88', '1', 'Fel Pro 400 Overhaul Gasket Set', '', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('89', '1', 'Speed Pro -Plasma Moly Rings -350 Chevy 1/16 1/16 1/8', 'Set of Speed Pro # R9902 plasma moly rings 350/383 chevy engines. Ring widths are 1/16, 1/16, 3/16. Available in std., .30, .40, .60.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('90', '1', 'Speed Pro -Plasma Moly Rings- 400 Chevy 1/16 1/16 3/16', 'Set of Speed Pro #10375 plsma moly rings for 400 Chevy engines. Ring widths are 1/16, 1/16, 3/16. Available in .30, .40, .60.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('91', '1', 'Hastings Cast Rings- 350 Chevy 1/16- 1/16- 3/16', 'Hastings cast rings for SBC 350. Ring widths are 1/16, 1/16, 3/16. Available in 30, 40, 60.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('92', '1', 'Clevite Main Bearings - 350/383 Chevy', 'Clevite 77 P series main bearing set for Small Block Chevy 350/383.
Available in Std., .010, .020 or .030 undersize.', '', '4');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('93', '1', 'Clevite Rod Bearings - 350/400 Chevy', 'Set of 8 Clevite 77 P series rod bearings for small block Chevy 350/400 engines. Available in Std., .010, .020, or .030 undersizes.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('94', '1', 'Clevite Rod Bearings - 350/400 Chevy- H Series', 'Set of 8 Clevite 77 H series rod bearings for small block Chevy 350/400 engines. H series bearings are chamfered to work with aftermarket cranks. Unplated hardened steel back for better dimensional accuracy and bore contact. High crush for better seating. Available in Std., .010,  or .020 undersize.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('95', '1', 'Sealed Power Moly Rings - 350 Chevy - 5/64, 5/64, 3/16', 'Set of Sealed Power # E251K moly rings for 350/383 carburated engines. Ring widths are 5/64, 5/64, 3/16. Available sizes are std., .30, .40, or .60.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('96', '1', 'Speed Pro-Plasma Moly Rings- 350 Chevy 1/16, 1/16, 3/16', 'Set of  Speed Pro R9968 plasma moly rings. Ring widths are 1/16, 1/16, 1/8. Available in std., .30 or .60.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('97', '1', 'Lug Nuts 1\" Hex -Steel', '1\" Hex steel lug nuts. Available in 7/16\" RH fine, 1/2\" RH fine, 5/8\" RH fine or coarse.  7/16\" fits most GM midsize, 1/2\" fits most Ford & Mopar, 5/8\" fits most aftermarket. Sold each.', '', '3');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('98', '1', 'Spacer Bearings - 377 Chevy', 'Spacer bearings to use 350 crank in a 400 block.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('99', '1', 'Melling Oil Pump - SB Chevy', 'Melling small block Chevy oil pump, standard volume and pressure.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('100', '1', 'Melling Oil Pump - SB Chevy-High Volume', 'Melling SBC pump, high volume and high pressure, includes standard pressure spring. (requires oil pump shaft with steel sleeve.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('101', '1', 'Scat-SB Chevy 5.7\"-I-Beam Rods-Bushed', 'Set of 8 -5.7\" long connecting rods. 4340 steel. Lightweight I-beam construction. Bushed pin end for full floating pins.  Sized and balanced to +/- 1 gram. 190,000 psi, ARP wave loc bolts. Each rod is double checked in our machine shop for roundness and pin fit. Rods are for large journal-1968 and newer cranks. Cam clearancing available for large stroke applications.', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('102', '1', 'Scat-SB Chevy 6.0\"-I-Beam Rods-Bushed', 'Set of 8- 6.0\" long connecting rods. 4340 steel. Lightweight I-beam construction. Bushed pin end for full floating pins. Sized and balanced to +/- 1 gram. 190,000 psi, ARP wave loc bolts. Each rod is double checked in our shop for roundness and pin fit. Rods are for large journal -1968 and newer cranks. Cam clearancing available for large stroke applications.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('103', '1', 'Scat-SB Chevy 5.7\"-I-Beam Rods-Press Fit', 'Set of 8 - 5.7\" long connecting rods. 4340 steel. Lightweight I-beam construction. Designed for press fit pin applications. Sized and balanced to +/- 1 gram. 190,000 psi ARP bolts. Each rod set is double checked in our machine shop for roundness and pin fit. Rods are for large journal - 1968 and newer cranks. Cam clearancing available for large stroke applications.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('104', '1', 'Scat-SB Chevy 6.0\"-I-Beam Rods-Press Fit', 'Set of 8 - 6.0\" long connecting rods. 4340 steel. Lightweight I-beam construction. Designed for press fit pin applications. Sized and balanced to +/- 1 gram. 190,000 psi ARP wave loc bolts. Each set is double checked in our machine shop for roundness and pin fit. Rods are for large journal - 1968 and newer cranks. Cam clearancing available for large stroke applications.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('105', '1', 'Scat SB Chevy 6.0\" I-Beam Rods-Bushed-7/16\" Capscrew', 'Set of 8 - 6.0\" long connecting rods. 4340 steel. Lightweight I-beam construction. Bushed pin end for full floating pins. Sized and balanced to +/- 1 gram. 210,000 psi 7/16\" cap screws. Dowelled cap for superior fit. Each Rod set is double checked in our machine shop for roundness and pin fit. Rods are for large journal - 1968 and newer cranks. Cam clearancing available for large stroke applications.', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('106', '1', 'Scat SB Chevy 5.7\" I-Beam Rods Bushed 7/16\" Capscrew', 'Set of 8 - 5.7\" long connecting rods. 4340 steel. Lightweight I-beam construction. Bushed pin end for full floating pins. Sized and balanced to +/- 1 gram. 210,000 psi ARP 7/16\" capscrews. Dowelled cap for superior fit. Each set is double checked in our machine shop for roundness and pin fit. Rods are for large journal - 1968 and newer cranks. Cam clearancing available for large stroke applications.', '', '4');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('107', '1', 'Eagle- SB Chevy 5.7\" I-beam Rods-Bushed', 'Set of 8 - 5.7\" long connecting rods. 5140 steel. Lightweight I-beam construction. Bushed pin end for full floatng pins. Sized and balanced to +/- 1 gram. 190,000 psi ARP capscrews. Each rod set is double checked in our machine shop for roundness and pin fit. Rods are for large journal 1968 and newer cranks. Cam clearancing is avaiable for large stroke applications.', '', '4');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('108', '1', 'Eagle-SB Chevy 6.0\" I-Beam Rods-Bushed', 'Set of 8 - 6.0\" long connecting rods. 5140 steel. Lightweight I-beam construction. Bushed pin end for full floating pins. Sized and balanced to +/- 1 gram. Each rod set is double checked in our machine shop for roundness and pin fit. Rods are for large journal - 1968 and newer cranks. Cam clearancing available for large stroke applications.', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('109', '1', '383 Chevy Cast Crankshaft', '383 Chevy cast crankshaft. Knife edged and profiled counterweights. Designed for 2 piece rear main seal blocks. For use with 5.7\" or longer rods. Externally balanced.', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('110', '1', '400 Chevy Cast Crankshaft', '400 Chevy cast crankshaft. Knife edged and profiled counterweights. Desined for 2 piece rear main seal blocks. For use with 5.7\" or longer rods. Externally balanced.', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('111', '1', '350 Chevy Cast Crankshaft', '350 Chevy cast crankshaft. Knife edged and profiled counterweights. designed for 2 piece rear main seal blocks. Internally balanced.', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('112', '1', 'SBC Comp Cams-Magnum Roller tip rocker arms', 'Set of 16 SB Chevy Comp Cams Magnum roller tip rocker arms. Fits 55 - 87 small block chevy engines. Made from 8620 chrome moly steel, 1.52 ratio, 3/8\" studs, includes 16 rockers, 16 grooved balls and 16 nuts. We have found these to be the strongest roller tip rocker available.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('113', '1', 'SBC Cloyes-HD Timing Set', 'SBC Cloyes heavy duty roller timing chain and gearset. 3 keyway crank sprocket. Fits 55 - 87 small block Chevy engines except factory rollercam.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('114', '1', 'Cloyes - Hexadjust True Roller Timing Set', 'With a cloyes Hex-a-just timing system, infinitely adjustable cam timing is as simple as turning an allen wrench. Consisting of billet steel cam and crank sprockets and a Cloyes True roller timing chain, the system uses a special hex head bushing installed on your cam\'s dowel pin. This bushing lines up with drgree marks on the cam sprocket. You can adjust timing in fractions of a degree (up to plus or minus six degrees) by loosening the cam bolts and turning the bushing with an allen wrench. The Hex-a-Just system fits under your stock timing cover. A torrington needle thrust bearing is also included. NOTE: Must be used with cam button and locking plate.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('115', '1', 'K&N Oil Filte-SB Chevy Short', 'High flow oil filter, a must for high oil pressure racing engines, 550lb burst strength, 1\" wrench nut for easy removal. Fits small block chevy engines.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('116', '1', 'K&N Oil Filter - SB Chevy Long', 'High flow oil filter, a must for high oil pressure racing engines, 550lb burst strength, 1\" wrench nut for easy removal. Fits Small block Chevy engines.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('117', '1', 'Racing Fan- Steel Blades', 'All steel fan with 6 blades. These fans pull a lot of air. Available in 15\" diameter (4.0 lbs.)  17\" diameter (4.3 lbs.) or 18\" diameter (4.7 lbs.)', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('118', '1', 'Racing Fan- Aluminum Blades', 'Fan has steel center with 6 aluminum blades. These fans pull a lot of air. Available in 15\" (3.0 lbs.),  17\" (3.11 lbs.),  or 18\" (3.2 lbs.) diameters.', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('119', '1', 'Redline Water Wetter', 'Redline water wetter helps reduce coolant temperature by up to 30 degrees.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('120', '1', 'Billet Aluminum Fan Spacer - 2\"', 'Billet Aluminum fan spacer - 2\". Complete with bolts, washers and hub bushing. Fits both 5/8\" or 3/4\" hub.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('121', '1', 'Billet Aluminum Fan Spacer - 2 1/2\"', 'Billet aluminum fan spacer - 2 1/2\". Complete with bolts, washers and hub bushing. Fits both 5/8\" or 3/4\" hub.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('122', '1', 'Billet Aluminum Fan Spacer 3\"', 'Billet aluminum fan spacer - 3\". Complete with bolts, washers and hub bushing. Fits both 5/8\" or 3/4\" hub.', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('123', '1', 'Stewart Stage 1 Cast Iron SB Chevy Water Pump - Short', 'Stewart Components high flow cast water pump. New OEM cast iron castings that are machined and assembled to exact standards, then are modified for performance and reliability. 3/4\" bearing with a 5/8\" shaft. 
Heavy duty bearing and hub. Guaranteed for one year. Short pump for small block chevy measures  5 7/8\" from leg of pump to face of fan hub .', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('124', '1', 'Stewart Stage 1 Cast Iron SB Chevy Water Pump-Long', 'Stewart Components high flow cast water pump. New OEM cast iron castings that are machined and assembled to exact standards, then are modified for performance and reliability. 3/4\" bearing with a 5/8\" shaft. Heavy duty bearing and hub. Guranteed for one year. Long pump for small block chevy measures 7\" from leg of pump to face of fan hub.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('125', '1', 'GM Weld on Caliper Brackets Metric', 'Mounts GM caliper to any rearend with 3\" tubes. Made of 1/4\" plate steel. Works with any 11.75\" rotor.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('126', '1', 'GM Weld on Caliper Bracket - Fullsize', 'Mounts GM caliper to any rearend with 3\" tubes. Made of 1/4\" plate steel. Works with any 11.75\" rotor.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('127', '1', 'GM Clamp on Caliper Bracket Fullsize', 'Bracket slides over 3\" rearend tube and clamps on. Must be tack welded or drilled and tapped. Made of 1/4\" steel , works with any 11.75\" rotor.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('128', '1', 'GM clamp on Caliper Bracket -Metric', 'Bracket slides over 3\" rearend tube and clamps on. Must be tack welded or drilled and tapped. Made of 1/4\" steel, Works with any 11.75\" rotor.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('129', '1', 'SBC Motor Mounts - Front - Steel', 'Pair of plated steel front motor mounts. For SB Chevys.', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('130', '1', 'SBC Motor Mounts -Rear - Steel', 'Pair of rear motor mounts for SB Chevys.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('131', '1', 'Sweet Steering Wheel', 'These ultra-lightweight 15\\\" aluminum steering wheels are manufactured by Sweet manufacturing. Desined with welded nubs on the back of the wheel for improved finger grips.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('132', '1', 'Window-Net-Install Kit- Buckle', 'Everything you need to do a professional job.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('133', '1', 'Intercomp 3 1/2\" Tire Pressure Gauge', '3 1/2\" glow in the dark tire gauge 0-30 PSI increments.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('134', '1', 'Intercomp 2\" White Faced Tire Gauge', '2\" white faced tire gauge, 0-15 in 1 \" increments.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('135', '1', 'Intercomp 2 1/2\" Glow in The Dark Tire Gauge', '2 1/@\" Glow in the dark tire gauge, 0-30 PSI in 1 inch increments.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('136', '1', 'Longacre Disconnect Switch', 'Most sanctioning bodies require these for emergency cutoff switch.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('137', '1', 'Accutech Water Temperature Gauge', '2 5/8\" face gauge. Water temp 100 deg. to 280 deg.. w/6\' capillary tube.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('138', '1', 'Accutech Oil Temperature Gauge', '2 5/8\" face oil temp 140-340 deg. w/6\' capillary tube. Mechanical gauge.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('139', '1', 'Accutech Fuel Pressure Gauge', '2 5/8\" face fuel pressure gauge. 0-15 PSI.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('140', '1', 'Accutech Oil Pressure Gauge', '2 5/8\" face oil pressure gauge. 1-100 PSI.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('141', '1', 'Wheel Studs - 5/8\" Coarse', '5/8\" coarse, 2 3/4\" overall  length, 1 5/8\" thread length, .685\" knurl diameter, .375\" knurl length. For installation of 5/8\" studs use a 43/64 drill bit.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('142', '1', 'Afco Steering U-joint - Smooth', 'Smooth on both ends.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('143', '1', 'Afco Steering U-joint - GM Std.,Pinto PS', 'GM Std., Pinto power steering - Quickner - 36 spline.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('144', '1', 'Afco Steering U-joint - GM Power Steering', '\'76 & earlier GM power steering - 36 spline.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('145', '1', 'Afco Steering U-Joint - Pinto/Mustang II Manual', 'Fits Pinto/ Mustang II manual - 26 spline.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('146', '1', 'Afco Steering U-joint - \'77 &newer GM PS', '\'77 & newer GM p.s. - Appleton P.S. - 30 sline.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('147', '1', 'Rebco Std. Ignition Panel', 'All panels are assembled with 30 amp ignition switch, Heavy duty starter button and thick walled, high temperature Rebel wiring that withstands prolonged heat without melting or fusing! These panels have waterproof switch covers and pre-wired for easy installation.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('148', '1', 'Rebco Std. Ignition Panel W/light', 'All panels are assembled with 30 amp ignition switch, Heavy duty starter button and thick walled, high temperature Rebel wiring that withstands prolonged heat without melting or fusing! These panels have waterproof switch covers and pre-wired for easy installation.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('149', '1', 'Longacre Ignition Switch Panel W/ Light', 'Longacre switch panels come prewired, 40amp @ 12V DC, and all connections are soldered and heat-shrinked. They have silicone rubber switch covers on the accessory switches. They also all plug into the Longacre wiring harness.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('150', '1', 'Ultra-Shield Tearoffs', 'Box of 200. Fits Simpson Voyager. Straight tearoffs.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('151', '1', 'Ultra-Shield Tearoffs', '12 3/8\" post centers. Banana tearoffs. Fits Bell G-Force and RCI SA2000 Helmets. 200 per box.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('152', '1', 'Longacre Carb. Linkage Kit', 'Longacre carb. linkage kit. Complete with rod ends, aircraft aluminum Tube, Holley carb bushing, 2 return springs, bolts and nuts. Hassle free, just bend to clear air cleaner, cut to length and thread one end using 1/4\" -28 tap. 22 7/8\" long.', '', '0');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('153', '1', 'Stant Racing Radiator Cap', '21 - 25 lb. pressure. A good cap is a must.', '', '3');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('154', '1', 'Rebco Quick Disconnect Hub', '360 Degree quick disconnect hub. Splined steel shaft welds on 3/4\" shaft. Aluminum hub can be released with either hand from any side of wheel.', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('155', '1', 'Rebco Button Type Quick Disconnect Hub', 'Steel hex type shaft welds on 3/4\" shaft. Aluminum hub with spring loaded button. No pin to lose!!', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('156', '1', 'Steering Shaft Hanger', '1/8\" steel, 8\" long, welds to dash bar.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('157', '1', 'Steering Shaft Heim', 'Fits over 3/4\" steering shaft.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('158', '1', 'Stainless Steel Braided Lines- 2 Straight Ends', '12\" line, These lines work great for brake lines, clutch lines, fuel pressure lines and oil pressure lines. 2 straight ends. Available up to 60\".', '', '2');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('159', '1', 'Stainless Steel Braided Lines with 1-90 & 1-Straight', '12\". These lines work great for brake lines, clutch lines, fuel pressure lines and oil pressure lines. One straight end and one 90 degree.', '', '1');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('160', '1', 'Schoenfeld Street Stock Headers', '1972-86 Monte Carlo --- 1977-86 Grand Prix --- Olds Cutlass, Buick Regal --- 1970-81 Camaro --- 1964-77 Chevelle. Can use solid side and rear mounts. Will fit angle or straight plug heads. Will not clear stock manual clutch linkage ball located behind the #7 cylinder. Stand port only. MEASURES: 1 3/4\" primary with 3 1/2\" collector.', '', '0');
drop table if exists products_notifications;
create table products_notifications (
  products_id int(11) default '0' not null ,
  customers_id int(11) default '0' not null ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  PRIMARY KEY (products_id, customers_id)
);

drop table if exists products_options;
create table products_options (
  products_options_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  products_options_name varchar(32) not null ,
  PRIMARY KEY (products_options_id, language_id)
);

insert into products_options (products_options_id, language_id, products_options_name) values ('1', '1', 'Color');
insert into products_options (products_options_id, language_id, products_options_name) values ('2', '1', 'Size');
insert into products_options (products_options_id, language_id, products_options_name) values ('7', '1', 'M.C. Bore');
insert into products_options (products_options_id, language_id, products_options_name) values ('6', '1', 'Add Lifters');
insert into products_options (products_options_id, language_id, products_options_name) values ('5', '1', 'Undersize');
insert into products_options (products_options_id, language_id, products_options_name) values ('4', '1', 'Diameter');
insert into products_options (products_options_id, language_id, products_options_name) values ('3', '1', 'Oversize');
insert into products_options (products_options_id, language_id, products_options_name) values ('8', '1', 'Pedal Style');
insert into products_options (products_options_id, language_id, products_options_name) values ('9', '1', 'Ratio');
insert into products_options (products_options_id, language_id, products_options_name) values ('10', '1', 'Shaft Size');
insert into products_options (products_options_id, language_id, products_options_name) values ('11', '1', 'Threads');
drop table if exists products_options_values;
create table products_options_values (
  products_options_values_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  products_options_values_name varchar(64) not null ,
  PRIMARY KEY (products_options_values_id, language_id)
);

insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('20', '1', '8 1/2');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('21', '1', '9');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('22', '1', '9 1/2');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('23', '1', '10');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('24', '1', '10 1/2');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('14', '1', '15\"');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('15', '1', '17\"');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('16', '1', '.010');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('17', '1', '.020');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('18', '1', 'Purple');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('19', '1', '8');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('1', '1', 'Red');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('13', '1', '.060');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('10', '1', 'STD.');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('2', '1', 'Black');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('12', '1', '.040');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('9', '1', 'XXX-Large');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('3', '1', 'Blue');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('11', '1', '.030');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('4', '1', 'Small');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('5', '1', 'Medium');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('6', '1', 'Large');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('7', '1', 'X-Large');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('8', '1', 'XX-Large');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('25', '1', '11');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('26', '1', '11 1/2');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('27', '1', '12');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('28', '1', '12 1/2');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('29', '1', '13');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('30', '1', 'Set of 16');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('31', '1', 'No');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('32', '1', '3/4\"');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('33', '1', '7/8\"');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('34', '1', '1\"');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('35', '1', 'Floor Mount');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('36', '1', 'Swing Mount');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('37', '1', '1.5 to 1');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('38', '1', '2 to 1');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('39', '1', '7');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('40', '1', '7 1/8');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('41', '1', '7 1/4');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('42', '1', '7 3/8');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('43', '1', '7 1/2');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('44', '1', '7 5/8');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('45', '1', '7 3/4');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('46', '1', '18\"');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('47', '1', '5/8\"');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('48', '1', '7/16\"');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('49', '1', '1/2\"');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('50', '1', '5/8\" Coarse');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('51', '1', '5/8\" Fine');
drop table if exists products_options_values_to_products_options;
create table products_options_values_to_products_options (
  products_options_values_to_products_options_id int(11) not null auto_increment,
  products_options_id int(11) default '0' not null ,
  products_options_values_id int(11) default '0' not null ,
  PRIMARY KEY (products_options_values_to_products_options_id)
);

insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('14', '1', '1');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('15', '1', '2');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('16', '1', '3');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('17', '2', '4');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('18', '2', '5');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('19', '2', '6');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('20', '2', '7');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('21', '2', '8');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('22', '2', '9');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('24', '3', '11');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('23', '3', '10');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('25', '3', '12');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('26', '3', '13');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('27', '4', '14');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('28', '4', '15');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('29', '5', '16');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('30', '5', '17');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('31', '1', '18');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('32', '2', '19');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('33', '2', '20');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('34', '2', '21');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('35', '2', '22');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('36', '2', '23');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('37', '2', '24');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('38', '2', '25');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('39', '2', '26');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('40', '2', '27');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('41', '2', '28');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('42', '2', '29');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('43', '6', '30');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('44', '6', '31');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('45', '7', '32');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('46', '7', '33');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('47', '7', '34');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('48', '8', '35');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('49', '8', '36');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('50', '9', '37');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('51', '9', '38');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('52', '2', '39');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('53', '2', '40');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('54', '2', '41');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('55', '2', '42');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('56', '2', '43');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('57', '2', '44');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('58', '2', '45');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('59', '4', '46');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('60', '10', '47');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('61', '11', '48');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('62', '11', '49');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('63', '11', '50');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('64', '11', '51');
drop table if exists products_to_categories;
create table products_to_categories (
  products_id int(11) default '0' not null ,
  categories_id int(11) default '0' not null ,
  PRIMARY KEY (products_id, categories_id)
);

insert into products_to_categories (products_id, categories_id) values ('1', '13');
insert into products_to_categories (products_id, categories_id) values ('2', '14');
insert into products_to_categories (products_id, categories_id) values ('4', '13');
insert into products_to_categories (products_id, categories_id) values ('7', '17');
insert into products_to_categories (products_id, categories_id) values ('8', '18');
insert into products_to_categories (products_id, categories_id) values ('9', '18');
insert into products_to_categories (products_id, categories_id) values ('10', '17');
insert into products_to_categories (products_id, categories_id) values ('12', '10');
insert into products_to_categories (products_id, categories_id) values ('13', '10');
insert into products_to_categories (products_id, categories_id) values ('14', '20');
insert into products_to_categories (products_id, categories_id) values ('15', '19');
insert into products_to_categories (products_id, categories_id) values ('17', '15');
insert into products_to_categories (products_id, categories_id) values ('18', '15');
insert into products_to_categories (products_id, categories_id) values ('19', '16');
insert into products_to_categories (products_id, categories_id) values ('20', '14');
insert into products_to_categories (products_id, categories_id) values ('21', '13');
insert into products_to_categories (products_id, categories_id) values ('22', '18');
insert into products_to_categories (products_id, categories_id) values ('23', '18');
insert into products_to_categories (products_id, categories_id) values ('24', '21');
insert into products_to_categories (products_id, categories_id) values ('25', '21');
insert into products_to_categories (products_id, categories_id) values ('26', '18');
insert into products_to_categories (products_id, categories_id) values ('27', '18');
insert into products_to_categories (products_id, categories_id) values ('28', '21');
insert into products_to_categories (products_id, categories_id) values ('29', '21');
insert into products_to_categories (products_id, categories_id) values ('30', '21');
insert into products_to_categories (products_id, categories_id) values ('31', '21');
insert into products_to_categories (products_id, categories_id) values ('32', '21');
insert into products_to_categories (products_id, categories_id) values ('33', '21');
insert into products_to_categories (products_id, categories_id) values ('34', '75');
insert into products_to_categories (products_id, categories_id) values ('35', '28');
insert into products_to_categories (products_id, categories_id) values ('36', '29');
insert into products_to_categories (products_id, categories_id) values ('37', '25');
insert into products_to_categories (products_id, categories_id) values ('38', '99');
insert into products_to_categories (products_id, categories_id) values ('39', '33');
insert into products_to_categories (products_id, categories_id) values ('40', '20');
insert into products_to_categories (products_id, categories_id) values ('41', '88');
insert into products_to_categories (products_id, categories_id) values ('42', '96');
insert into products_to_categories (products_id, categories_id) values ('43', '96');
insert into products_to_categories (products_id, categories_id) values ('44', '93');
insert into products_to_categories (products_id, categories_id) values ('45', '87');
insert into products_to_categories (products_id, categories_id) values ('46', '19');
insert into products_to_categories (products_id, categories_id) values ('47', '84');
insert into products_to_categories (products_id, categories_id) values ('49', '24');
insert into products_to_categories (products_id, categories_id) values ('50', '24');
insert into products_to_categories (products_id, categories_id) values ('51', '24');
insert into products_to_categories (products_id, categories_id) values ('52', '26');
insert into products_to_categories (products_id, categories_id) values ('53', '16');
insert into products_to_categories (products_id, categories_id) values ('54', '50');
insert into products_to_categories (products_id, categories_id) values ('55', '50');
insert into products_to_categories (products_id, categories_id) values ('56', '143');
insert into products_to_categories (products_id, categories_id) values ('57', '38');
insert into products_to_categories (products_id, categories_id) values ('58', '93');
insert into products_to_categories (products_id, categories_id) values ('59', '101');
insert into products_to_categories (products_id, categories_id) values ('60', '25');
insert into products_to_categories (products_id, categories_id) values ('61', '92');
insert into products_to_categories (products_id, categories_id) values ('62', '62');
insert into products_to_categories (products_id, categories_id) values ('63', '62');
insert into products_to_categories (products_id, categories_id) values ('64', '49');
insert into products_to_categories (products_id, categories_id) values ('65', '48');
insert into products_to_categories (products_id, categories_id) values ('66', '48');
insert into products_to_categories (products_id, categories_id) values ('68', '110');
insert into products_to_categories (products_id, categories_id) values ('69', '85');
insert into products_to_categories (products_id, categories_id) values ('70', '133');
insert into products_to_categories (products_id, categories_id) values ('71', '134');
insert into products_to_categories (products_id, categories_id) values ('72', '22');
insert into products_to_categories (products_id, categories_id) values ('73', '17');
insert into products_to_categories (products_id, categories_id) values ('74', '6');
insert into products_to_categories (products_id, categories_id) values ('75', '136');
insert into products_to_categories (products_id, categories_id) values ('76', '143');
insert into products_to_categories (products_id, categories_id) values ('77', '138');
insert into products_to_categories (products_id, categories_id) values ('78', '73');
insert into products_to_categories (products_id, categories_id) values ('79', '107');
insert into products_to_categories (products_id, categories_id) values ('80', '27');
insert into products_to_categories (products_id, categories_id) values ('81', '89');
insert into products_to_categories (products_id, categories_id) values ('82', '138');
insert into products_to_categories (products_id, categories_id) values ('83', '106');
insert into products_to_categories (products_id, categories_id) values ('84', '81');
insert into products_to_categories (products_id, categories_id) values ('85', '68');
insert into products_to_categories (products_id, categories_id) values ('86', '49');
insert into products_to_categories (products_id, categories_id) values ('87', '26');
insert into products_to_categories (products_id, categories_id) values ('88', '29');
insert into products_to_categories (products_id, categories_id) values ('89', '26');
insert into products_to_categories (products_id, categories_id) values ('90', '26');
insert into products_to_categories (products_id, categories_id) values ('91', '26');
insert into products_to_categories (products_id, categories_id) values ('92', '24');
insert into products_to_categories (products_id, categories_id) values ('93', '24');
insert into products_to_categories (products_id, categories_id) values ('94', '24');
insert into products_to_categories (products_id, categories_id) values ('95', '26');
insert into products_to_categories (products_id, categories_id) values ('96', '26');
insert into products_to_categories (products_id, categories_id) values ('97', '139');
insert into products_to_categories (products_id, categories_id) values ('98', '24');
insert into products_to_categories (products_id, categories_id) values ('99', '23');
insert into products_to_categories (products_id, categories_id) values ('100', '23');
insert into products_to_categories (products_id, categories_id) values ('101', '31');
insert into products_to_categories (products_id, categories_id) values ('102', '31');
insert into products_to_categories (products_id, categories_id) values ('103', '31');
insert into products_to_categories (products_id, categories_id) values ('104', '31');
insert into products_to_categories (products_id, categories_id) values ('105', '31');
insert into products_to_categories (products_id, categories_id) values ('106', '31');
insert into products_to_categories (products_id, categories_id) values ('107', '31');
insert into products_to_categories (products_id, categories_id) values ('108', '31');
insert into products_to_categories (products_id, categories_id) values ('109', '30');
insert into products_to_categories (products_id, categories_id) values ('110', '30');
insert into products_to_categories (products_id, categories_id) values ('111', '30');
insert into products_to_categories (products_id, categories_id) values ('112', '33');
insert into products_to_categories (products_id, categories_id) values ('113', '28');
insert into products_to_categories (products_id, categories_id) values ('114', '28');
insert into products_to_categories (products_id, categories_id) values ('115', '32');
insert into products_to_categories (products_id, categories_id) values ('116', '32');
insert into products_to_categories (products_id, categories_id) values ('117', '36');
insert into products_to_categories (products_id, categories_id) values ('118', '36');
insert into products_to_categories (products_id, categories_id) values ('119', '39');
insert into products_to_categories (products_id, categories_id) values ('120', '37');
insert into products_to_categories (products_id, categories_id) values ('121', '37');
insert into products_to_categories (products_id, categories_id) values ('122', '37');
insert into products_to_categories (products_id, categories_id) values ('123', '38');
insert into products_to_categories (products_id, categories_id) values ('124', '38');
insert into products_to_categories (products_id, categories_id) values ('125', '117');
insert into products_to_categories (products_id, categories_id) values ('126', '117');
insert into products_to_categories (products_id, categories_id) values ('127', '117');
insert into products_to_categories (products_id, categories_id) values ('128', '117');
insert into products_to_categories (products_id, categories_id) values ('129', '140');
insert into products_to_categories (products_id, categories_id) values ('130', '140');
insert into products_to_categories (products_id, categories_id) values ('131', '20');
insert into products_to_categories (products_id, categories_id) values ('132', '97');
insert into products_to_categories (products_id, categories_id) values ('133', '108');
insert into products_to_categories (products_id, categories_id) values ('134', '108');
insert into products_to_categories (products_id, categories_id) values ('135', '108');
insert into products_to_categories (products_id, categories_id) values ('136', '76');
insert into products_to_categories (products_id, categories_id) values ('137', '71');
insert into products_to_categories (products_id, categories_id) values ('138', '71');
insert into products_to_categories (products_id, categories_id) values ('139', '71');
insert into products_to_categories (products_id, categories_id) values ('140', '71');
insert into products_to_categories (products_id, categories_id) values ('141', '141');
insert into products_to_categories (products_id, categories_id) values ('142', '104');
insert into products_to_categories (products_id, categories_id) values ('143', '104');
insert into products_to_categories (products_id, categories_id) values ('144', '104');
insert into products_to_categories (products_id, categories_id) values ('145', '104');
insert into products_to_categories (products_id, categories_id) values ('146', '104');
insert into products_to_categories (products_id, categories_id) values ('147', '82');
insert into products_to_categories (products_id, categories_id) values ('148', '82');
insert into products_to_categories (products_id, categories_id) values ('149', '82');
insert into products_to_categories (products_id, categories_id) values ('150', '98');
insert into products_to_categories (products_id, categories_id) values ('151', '98');
insert into products_to_categories (products_id, categories_id) values ('152', '142');
insert into products_to_categories (products_id, categories_id) values ('153', '35');
insert into products_to_categories (products_id, categories_id) values ('154', '100');
insert into products_to_categories (products_id, categories_id) values ('155', '100');
insert into products_to_categories (products_id, categories_id) values ('156', '103');
insert into products_to_categories (products_id, categories_id) values ('157', '102');
insert into products_to_categories (products_id, categories_id) values ('158', '111');
insert into products_to_categories (products_id, categories_id) values ('159', '111');
insert into products_to_categories (products_id, categories_id) values ('160', '51');
drop table if exists reviews;
create table reviews (
  reviews_id int(11) not null auto_increment,
  products_id int(11) default '0' not null ,
  customers_id int(11) ,
  customers_name varchar(64) not null ,
  reviews_rating int(1) ,
  date_added datetime ,
  last_modified datetime ,
  reviews_read int(5) default '0' not null ,
  PRIMARY KEY (reviews_id)
);

insert into reviews (reviews_id, products_id, customers_id, customers_name, reviews_rating, date_added, last_modified, reviews_read) values ('1', '19', '1', 'John doe', '5', '2005-01-27 17:14:43', '0000-00-00 00:00:00', '0');
drop table if exists reviews_description;
create table reviews_description (
  reviews_id int(11) default '0' not null ,
  languages_id int(11) default '0' not null ,
  reviews_text text not null ,
  PRIMARY KEY (reviews_id, languages_id)
);

insert into reviews_description (reviews_id, languages_id, reviews_text) values ('1', '1', 'this has to be one of the funniest movies released for 1999!');
drop table if exists sessions;
create table sessions (
  sesskey varchar(32) not null ,
  expiry int(11) unsigned default '0' not null ,
  value text not null ,
  PRIMARY KEY (sesskey)
);

insert into sessions (sesskey, expiry, value) values ('5082f0d058bcba030986eeab7feac3ad', '1108335862', 'cart|O:12:\"shoppingcart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationhistory\":2:{s:4:\"path\";a:1:{i:0;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:1:{s:5:\"cPath\";s:1:\"2\";}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}');
insert into sessions (sesskey, expiry, value) values ('d2c040d512bef976a57650e271801888', '1108337569', 'cart|O:12:\"shoppingcart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationhistory\":2:{s:4:\"path\";a:4:{i:0;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:1;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:5:\"cPath\";s:1:\"2\";s:6:\"osCsid\";s:32:\"d2c040d512bef976a57650e271801888\";}s:4:\"post\";a:0:{}}i:2;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:5:\"cPath\";s:4:\"2_24\";s:6:\"osCsid\";s:32:\"d2c040d512bef976a57650e271801888\";}s:4:\"post\";a:0:{}}i:3;a:4:{s:4:\"page\";s:16:\"product_info.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:3:{s:5:\"cPath\";s:4:\"2_24\";s:11:\"products_id\";s:2:\"51\";s:6:\"osCsid\";s:32:\"d2c040d512bef976a57650e271801888\";}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}');
insert into sessions (sesskey, expiry, value) values ('c2830b5edb8f6eed0dc3dbbb0a10722f', '1108335674', 'cart|O:12:\"shoppingcart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationhistory\":2:{s:4:\"path\";a:1:{i:0;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:1:{s:5:\"cPath\";s:2:\"12\";}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}');
insert into sessions (sesskey, expiry, value) values ('b05b2822f4b3f7562cac1c65bfd6ded8', '1108339510', 'cart|O:12:\"shoppingcart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationhistory\":2:{s:4:\"path\";a:1:{i:0;a:4:{s:4:\"page\";s:16:\"product_info.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:1:{s:11:\"products_id\";s:3:\"154\";}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}');
insert into sessions (sesskey, expiry, value) values ('1f4824287c6a3592ea50f1999046a32a', '1108339995', 'cart|O:12:\"shoppingcart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationhistory\":2:{s:4:\"path\";a:2:{i:0;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:1;a:4:{s:4:\"page\";s:14:\"contact_us.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:1:{s:6:\"osCsid\";s:32:\"1f4824287c6a3592ea50f1999046a32a\";}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}');
insert into sessions (sesskey, expiry, value) values ('45f755632bd35d1d7c90d2bab8565701', '1108340114', 'cart|O:12:\"shoppingcart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationhistory\":2:{s:4:\"path\";a:1:{i:0;a:4:{s:4:\"page\";s:16:\"product_info.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:1:{s:11:\"products_id\";s:3:\"151\";}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}');
insert into sessions (sesskey, expiry, value) values ('d68c9cd206e5d2089d60c70d269b90e9', '1108340120', 'cart|O:12:\"shoppingcart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationhistory\":2:{s:4:\"path\";a:1:{i:0;a:4:{s:4:\"page\";s:16:\"product_info.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:1:{s:11:\"products_id\";s:3:\"158\";}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}');
insert into sessions (sesskey, expiry, value) values ('432036e9086bb2d707c05fbf185d319d', '1108340157', 'cart|O:12:\"shoppingcart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationhistory\":2:{s:4:\"path\";a:1:{i:0;a:4:{s:4:\"page\";s:16:\"product_info.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:1:{s:11:\"products_id\";s:3:\"157\";}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}');
insert into sessions (sesskey, expiry, value) values ('db2877693fe530f89a062cf9c409d778', '1108341042', 'cart|O:12:\"shoppingcart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationhistory\":2:{s:4:\"path\";a:1:{i:0;a:4:{s:4:\"page\";s:16:\"product_info.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:1:{s:11:\"products_id\";s:3:\"155\";}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}');
insert into sessions (sesskey, expiry, value) values ('387c7c63bacc2470f9ddea46a6dc92ba', '1108341607', 'cart|O:12:\"shoppingcart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationhistory\":2:{s:4:\"path\";a:4:{i:0;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:1;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:5:\"cPath\";s:1:\"2\";s:6:\"osCsid\";s:32:\"387c7c63bacc2470f9ddea46a6dc92ba\";}s:4:\"post\";a:0:{}}i:2;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:5:\"cPath\";s:4:\"2_21\";s:6:\"osCsid\";s:32:\"387c7c63bacc2470f9ddea46a6dc92ba\";}s:4:\"post\";a:0:{}}i:3;a:4:{s:4:\"page\";s:14:\"contact_us.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:1:{s:6:\"osCsid\";s:32:\"387c7c63bacc2470f9ddea46a6dc92ba\";}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}');
insert into sessions (sesskey, expiry, value) values ('0663f3f94b1b047096ba018634d27e75', '1108342269', 'cart|O:12:\"shoppingcart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationhistory\":2:{s:4:\"path\";a:4:{i:0;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:1;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:5:\"cPath\";s:1:\"2\";s:6:\"osCsid\";s:32:\"0663f3f94b1b047096ba018634d27e75\";}s:4:\"post\";a:0:{}}i:2;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:5:\"cPath\";s:4:\"2_31\";s:6:\"osCsid\";s:32:\"0663f3f94b1b047096ba018634d27e75\";}s:4:\"post\";a:0:{}}i:3;a:4:{s:4:\"page\";s:16:\"product_info.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:3:{s:5:\"cPath\";s:4:\"2_31\";s:11:\"products_id\";s:3:\"101\";s:6:\"osCsid\";s:32:\"0663f3f94b1b047096ba018634d27e75\";}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}');
insert into sessions (sesskey, expiry, value) values ('3b95c04aceed221c065643810e612f6e', '1108341965', 'cart|O:12:\"shoppingcart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationhistory\":2:{s:4:\"path\";a:1:{i:0;a:4:{s:4:\"page\";s:16:\"product_info.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:1:{s:11:\"products_id\";s:3:\"153\";}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}');
insert into sessions (sesskey, expiry, value) values ('b6e907455dfc8e308038e27d77cd9d10', '1108353592', 'cart|O:12:\"shoppingcart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationhistory\":2:{s:4:\"path\";a:2:{i:0;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:1;a:4:{s:4:\"page\";s:16:\"product_info.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:11:\"products_id\";s:3:\"158\";s:6:\"osCsid\";s:32:\"b6e907455dfc8e308038e27d77cd9d10\";}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}');
insert into sessions (sesskey, expiry, value) values ('1298f5406cd1f4e7246d3d91d39c87b8', '1108355904', 'cart|O:12:\"shoppingcart\":5:{s:8:\"contents\";a:1:{i:159;a:1:{s:3:\"qty\";i:1;}}s:5:\"total\";d:13.9900000000000002131628207280300557613372802734375;s:6:\"weight\";d:0;s:6:\"cartID\";s:5:\"17018\";s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationhistory\":2:{s:4:\"path\";a:5:{i:0;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:5:\"cPath\";s:1:\"5\";s:6:\"osCsid\";s:32:\"1298f5406cd1f4e7246d3d91d39c87b8\";}s:4:\"post\";a:0:{}}i:1;a:4:{s:4:\"page\";s:16:\"product_info.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:3:{s:11:\"products_id\";s:3:\"159\";s:6:\"action\";s:11:\"add_product\";s:6:\"osCsid\";s:32:\"1298f5406cd1f4e7246d3d91d39c87b8\";}s:4:\"post\";a:4:{s:6:\"osCsid\";s:32:\"1298f5406cd1f4e7246d3d91d39c87b8\";s:11:\"products_id\";s:3:\"159\";s:1:\"x\";s:2:\"39\";s:1:\"y\";s:2:\"11\";}}i:2;a:4:{s:4:\"page\";s:17:\"shopping_cart.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:1:{s:6:\"osCsid\";s:32:\"1298f5406cd1f4e7246d3d91d39c87b8\";}s:4:\"post\";a:0:{}}i:3;a:4:{s:4:\"page\";s:21:\"checkout_shipping.php\";s:4:\"mode\";s:3:\"SSL\";s:3:\"get\";a:1:{s:6:\"osCsid\";s:32:\"1298f5406cd1f4e7246d3d91d39c87b8\";}s:4:\"post\";a:0:{}}i:4;a:4:{s:4:\"page\";s:9:\"login.php\";s:4:\"mode\";s:3:\"SSL\";s:3:\"get\";a:1:{s:6:\"osCsid\";s:32:\"1298f5406cd1f4e7246d3d91d39c87b8\";}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:4:{s:4:\"page\";s:21:\"checkout_shipping.php\";s:4:\"mode\";s:3:\"SSL\";s:3:\"get\";a:1:{s:6:\"osCsid\";s:32:\"1298f5406cd1f4e7246d3d91d39c87b8\";}s:4:\"post\";a:0:{}}}');
insert into sessions (sesskey, expiry, value) values ('933b61e1375dfdd7716bef9fa7937bdc', '1108355511', 'cart|O:12:\"shoppingcart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationhistory\":2:{s:4:\"path\";a:2:{i:0;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:1;a:4:{s:4:\"page\";s:14:\"contact_us.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:1:{s:6:\"osCsid\";s:32:\"933b61e1375dfdd7716bef9fa7937bdc\";}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}');
drop table if exists specials;
create table specials (
  specials_id int(11) not null auto_increment,
  products_id int(11) default '0' not null ,
  specials_new_products_price decimal(15,4) default '0.0000' not null ,
  specials_date_added datetime ,
  specials_last_modified datetime ,
  expires_date datetime ,
  date_status_change datetime ,
  status int(1) default '1' not null ,
  PRIMARY KEY (specials_id)
);

drop table if exists tax_class;
create table tax_class (
  tax_class_id int(11) not null auto_increment,
  tax_class_title varchar(32) not null ,
  tax_class_description varchar(255) not null ,
  last_modified datetime ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  PRIMARY KEY (tax_class_id)
);

insert into tax_class (tax_class_id, tax_class_title, tax_class_description, last_modified, date_added) values ('1', 'Taxable Goods', 'The following types of products are included non-food, services, etc', '2005-01-27 17:14:43', '2005-01-27 17:14:43');
drop table if exists tax_rates;
create table tax_rates (
  tax_rates_id int(11) not null auto_increment,
  tax_zone_id int(11) default '0' not null ,
  tax_class_id int(11) default '0' not null ,
  tax_priority int(5) default '1' ,
  tax_rate decimal(7,4) default '0.0000' not null ,
  tax_description varchar(255) not null ,
  last_modified datetime ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  PRIMARY KEY (tax_rates_id)
);

insert into tax_rates (tax_rates_id, tax_zone_id, tax_class_id, tax_priority, tax_rate, tax_description, last_modified, date_added) values ('1', '1', '1', '1', '7.0000', 'FL TAX 7.0%', '2005-01-27 17:14:43', '2005-01-27 17:14:43');
drop table if exists whos_online;
create table whos_online (
  customer_id int(11) ,
  full_name varchar(64) not null ,
  session_id varchar(128) not null ,
  ip_address varchar(15) not null ,
  time_entry varchar(14) not null ,
  time_last_click varchar(14) not null ,
  last_page_url varchar(64) not null 
);

insert into whos_online (customer_id, full_name, session_id, ip_address, time_entry, time_last_click, last_page_url) values ('0', 'Guest', '1298f5406cd1f4e7246d3d91d39c87b8', '12.219.21.115', '1108354433', '1108354464', '/performa//store/login.php?osCsid=1298f5406cd1f4e7246d3d91d39c87');
insert into whos_online (customer_id, full_name, session_id, ip_address, time_entry, time_last_click, last_page_url) values ('0', 'Guest', '933b61e1375dfdd7716bef9fa7937bdc', '67.1.101.210', '1108354038', '1108354070', '/store/contact_us.php?osCsid=933b61e1375dfdd7716bef9fa7937bdc');
drop table if exists zones;
create table zones (
  zone_id int(11) not null auto_increment,
  zone_country_id int(11) default '0' not null ,
  zone_code varchar(32) not null ,
  zone_name varchar(32) not null ,
  PRIMARY KEY (zone_id)
);

insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1', '223', 'AL', 'Alabama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2', '223', 'AK', 'Alaska');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3', '223', 'AS', 'American Samoa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4', '223', 'AZ', 'Arizona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('5', '223', 'AR', 'Arkansas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('6', '223', 'AF', 'Armed Forces Africa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('7', '223', 'AA', 'Armed Forces Americas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('8', '223', 'AC', 'Armed Forces Canada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('9', '223', 'AE', 'Armed Forces Europe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('10', '223', 'AM', 'Armed Forces Middle East');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('11', '223', 'AP', 'Armed Forces Pacific');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('12', '223', 'CA', 'California');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('13', '223', 'CO', 'Colorado');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('14', '223', 'CT', 'Connecticut');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('15', '223', 'DE', 'Delaware');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('16', '223', 'DC', 'District of Columbia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('17', '223', 'FM', 'Federated States Of Micronesia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('18', '223', 'FL', 'Florida');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('19', '223', 'GA', 'Georgia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('20', '223', 'GU', 'Guam');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('21', '223', 'HI', 'Hawaii');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('22', '223', 'ID', 'Idaho');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('23', '223', 'IL', 'Illinois');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('24', '223', 'IN', 'Indiana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('25', '223', 'IA', 'Iowa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('26', '223', 'KS', 'Kansas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('27', '223', 'KY', 'Kentucky');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('28', '223', 'LA', 'Louisiana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('29', '223', 'ME', 'Maine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('30', '223', 'MH', 'Marshall Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('31', '223', 'MD', 'Maryland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('32', '223', 'MA', 'Massachusetts');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('33', '223', 'MI', 'Michigan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('34', '223', 'MN', 'Minnesota');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('35', '223', 'MS', 'Mississippi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('36', '223', 'MO', 'Missouri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('37', '223', 'MT', 'Montana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('38', '223', 'NE', 'Nebraska');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('39', '223', 'NV', 'Nevada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('40', '223', 'NH', 'New Hampshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('41', '223', 'NJ', 'New Jersey');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('42', '223', 'NM', 'New Mexico');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('43', '223', 'NY', 'New York');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('44', '223', 'NC', 'North Carolina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('45', '223', 'ND', 'North Dakota');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('46', '223', 'MP', 'Northern Mariana Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('47', '223', 'OH', 'Ohio');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('48', '223', 'OK', 'Oklahoma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('49', '223', 'OR', 'Oregon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('50', '223', 'PW', 'Palau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('51', '223', 'PA', 'Pennsylvania');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('52', '223', 'PR', 'Puerto Rico');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('53', '223', 'RI', 'Rhode Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('54', '223', 'SC', 'South Carolina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('55', '223', 'SD', 'South Dakota');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('56', '223', 'TN', 'Tennessee');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('57', '223', 'TX', 'Texas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('58', '223', 'UT', 'Utah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('59', '223', 'VT', 'Vermont');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('60', '223', 'VI', 'Virgin Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('61', '223', 'VA', 'Virginia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('62', '223', 'WA', 'Washington');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('63', '223', 'WV', 'West Virginia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('64', '223', 'WI', 'Wisconsin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('65', '223', 'WY', 'Wyoming');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('66', '38', 'AB', 'Alberta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('67', '38', 'BC', 'British Columbia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('68', '38', 'MB', 'Manitoba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('69', '38', 'NF', 'Newfoundland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('70', '38', 'NB', 'New Brunswick');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('71', '38', 'NS', 'Nova Scotia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('72', '38', 'NT', 'Northwest Territories');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('73', '38', 'NU', 'Nunavut');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('74', '38', 'ON', 'Ontario');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('75', '38', 'PE', 'Prince Edward Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('76', '38', 'QC', 'Quebec');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('77', '38', 'SK', 'Saskatchewan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('78', '38', 'YT', 'Yukon Territory');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('79', '81', 'NDS', 'Niedersachsen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('80', '81', 'BAW', 'Baden-Württemberg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('81', '81', 'BAY', 'Bayern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('82', '81', 'BER', 'Berlin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('83', '81', 'BRG', 'Brandenburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('84', '81', 'BRE', 'Bremen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('85', '81', 'HAM', 'Hamburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('86', '81', 'HES', 'Hessen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('87', '81', 'MEC', 'Mecklenburg-Vorpommern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('88', '81', 'NRW', 'Nordrhein-Westfalen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('89', '81', 'RHE', 'Rheinland-Pfalz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('90', '81', 'SAR', 'Saarland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('91', '81', 'SAS', 'Sachsen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('92', '81', 'SAC', 'Sachsen-Anhalt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('93', '81', 'SCN', 'Schleswig-Holstein');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('94', '81', 'THE', 'Thüringen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('95', '14', 'WI', 'Wien');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('96', '14', 'NO', 'Niederösterreich');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('97', '14', 'OO', 'Oberösterreich');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('98', '14', 'SB', 'Salzburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('99', '14', 'KN', 'Kärnten');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('100', '14', 'ST', 'Steiermark');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('101', '14', 'TI', 'Tirol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('102', '14', 'BL', 'Burgenland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('103', '14', 'VB', 'Voralberg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('104', '204', 'AG', 'Aargau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('105', '204', 'AI', 'Appenzell Innerrhoden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('106', '204', 'AR', 'Appenzell Ausserrhoden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('107', '204', 'BE', 'Bern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('108', '204', 'BL', 'Basel-Landschaft');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('109', '204', 'BS', 'Basel-Stadt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('110', '204', 'FR', 'Freiburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('111', '204', 'GE', 'Genf');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('112', '204', 'GL', 'Glarus');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('113', '204', 'JU', 'Graubünden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('114', '204', 'JU', 'Jura');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('115', '204', 'LU', 'Luzern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('116', '204', 'NE', 'Neuenburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('117', '204', 'NW', 'Nidwalden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('118', '204', 'OW', 'Obwalden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('119', '204', 'SG', 'St. Gallen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('120', '204', 'SH', 'Schaffhausen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('121', '204', 'SO', 'Solothurn');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('122', '204', 'SZ', 'Schwyz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('123', '204', 'TG', 'Thurgau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('124', '204', 'TI', 'Tessin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('125', '204', 'UR', 'Uri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('126', '204', 'VD', 'Waadt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('127', '204', 'VS', 'Wallis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('128', '204', 'ZG', 'Zug');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('129', '204', 'ZH', 'Zürich');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('130', '195', 'A Coruña', 'A Coruña');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('131', '195', 'Alava', 'Alava');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('132', '195', 'Albacete', 'Albacete');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('133', '195', 'Alicante', 'Alicante');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('134', '195', 'Almeria', 'Almeria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('135', '195', 'Asturias', 'Asturias');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('136', '195', 'Avila', 'Avila');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('137', '195', 'Badajoz', 'Badajoz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('138', '195', 'Baleares', 'Baleares');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('139', '195', 'Barcelona', 'Barcelona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('140', '195', 'Burgos', 'Burgos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('141', '195', 'Caceres', 'Caceres');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('142', '195', 'Cadiz', 'Cadiz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('143', '195', 'Cantabria', 'Cantabria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('144', '195', 'Castellon', 'Castellon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('145', '195', 'Ceuta', 'Ceuta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('146', '195', 'Ciudad Real', 'Ciudad Real');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('147', '195', 'Cordoba', 'Cordoba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('148', '195', 'Cuenca', 'Cuenca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('149', '195', 'Girona', 'Girona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('150', '195', 'Granada', 'Granada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('151', '195', 'Guadalajara', 'Guadalajara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('152', '195', 'Guipuzcoa', 'Guipuzcoa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('153', '195', 'Huelva', 'Huelva');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('154', '195', 'Huesca', 'Huesca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('155', '195', 'Jaen', 'Jaen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('156', '195', 'La Rioja', 'La Rioja');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('157', '195', 'Las Palmas', 'Las Palmas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('158', '195', 'Leon', 'Leon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('159', '195', 'Lleida', 'Lleida');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('160', '195', 'Lugo', 'Lugo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('161', '195', 'Madrid', 'Madrid');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('162', '195', 'Malaga', 'Malaga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('163', '195', 'Melilla', 'Melilla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('164', '195', 'Murcia', 'Murcia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('165', '195', 'Navarra', 'Navarra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('166', '195', 'Ourense', 'Ourense');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('167', '195', 'Palencia', 'Palencia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('168', '195', 'Pontevedra', 'Pontevedra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('169', '195', 'Salamanca', 'Salamanca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('170', '195', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('171', '195', 'Segovia', 'Segovia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('172', '195', 'Sevilla', 'Sevilla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('173', '195', 'Soria', 'Soria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('174', '195', 'Tarragona', 'Tarragona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('175', '195', 'Teruel', 'Teruel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('176', '195', 'Toledo', 'Toledo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('177', '195', 'Valencia', 'Valencia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('178', '195', 'Valladolid', 'Valladolid');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('179', '195', 'Vizcaya', 'Vizcaya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('180', '195', 'Zamora', 'Zamora');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('181', '195', 'Zaragoza', 'Zaragoza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('182', '223', '', 'us');
drop table if exists zones_to_geo_zones;
create table zones_to_geo_zones (
  association_id int(11) not null auto_increment,
  zone_country_id int(11) default '0' not null ,
  zone_id int(11) ,
  geo_zone_id int(11) ,
  last_modified datetime ,
  date_added datetime default '0000-00-00 00:00:00' not null ,
  PRIMARY KEY (association_id)
);

insert into zones_to_geo_zones (association_id, zone_country_id, zone_id, geo_zone_id, last_modified, date_added) values ('1', '223', '25', '1', '2005-02-13 20:11:49', '2005-01-27 17:14:43');
