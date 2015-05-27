<?php
/*
  $Id: configure.php,v 1.14 2003/07/09 01:15:48 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

// Define the webserver and path parameters
// * DIR_FS_* = Filesystem directories (local/physical)
// * DIR_WS_* = Webserver directories (virtual/URL)
define('HTTP_SERVER', 'http://performanceauto.us/');
define('HTTPS_SERVER', 'http://performanceauto.us/');
  define('ENABLE_SSL', false); // secure webserver for checkout procedure?
define('HTTP_COOKIE_DOMAIN', 'performanceauto.us');
define('HTTPS_COOKIE_DOMAIN', 'performanceauto.us');
define('HTTP_COOKIE_PATH', '/');
define('HTTPS_COOKIE_PATH', '/');
define('DIR_WS_HTTP_CATALOG', '');
define('DIR_WS_HTTPS_CATALOG', '');
define('DIR_WS_IMAGES', 'images/');
define('DIR_WS_ICONS', '/store/icons/');
  define('DIR_WS_INCLUDES', 'includes/');
  define('DIR_WS_BOXES', DIR_WS_INCLUDES . 'boxes/');
  define('DIR_WS_FUNCTIONS', DIR_WS_INCLUDES . 'functions/');
  define('DIR_WS_CLASSES', DIR_WS_INCLUDES . 'classes/');
  define('DIR_WS_MODULES', DIR_WS_INCLUDES . 'modules/');
  define('DIR_WS_LANGUAGES', DIR_WS_INCLUDES . 'languages/');

  define('DIR_WS_DOWNLOAD_PUBLIC', 'pub/');
  define('DIR_FS_CATALOG', dirname($HTTP_SERVER_VARS['SCRIPT_FILENAME']));
  define('DIR_FS_DOWNLOAD', DIR_FS_CATALOG . 'download/');
  define('DIR_FS_DOWNLOAD_PUBLIC', DIR_FS_CATALOG . 'pub/');

// define our database connection
define('DB_SERVER', 'localhost');
define('DB_SERVER_USERNAME', 'performa_dbadmin');
define('DB_SERVER_PASSWORD', 'db@dm1n');
define('DB_DATABASE', 'performa_master');
  define('USE_PCONNECT', 'false'); // use persistent connections?
define('STORE_SESSIONS', 'mysql');
?>