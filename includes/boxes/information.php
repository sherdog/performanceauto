<?php
/*
  $Id: information.php,v 1.6 2003/02/10 22:31:00 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/
?>
<!-- information //-->
          <tr>
            <td>
<?php
  $info_box_contents = array();
  $info_box_contents[] = array('text' => BOX_HEADING_INFORMATION);

  new infoBoxHeading($info_box_contents, false, false);

  $info_box_contents = array();
  $info_box_contents[] = array('text' => '<a href="' . tep_href_link(FILENAME_PRIVACY) . '" style="color:white;">' . BOX_INFORMATION_PRIVACY . '</a>' .
                                         '<a href="' . tep_href_link(FILENAME_CONDITIONS) . '" style="color:white;">' . BOX_INFORMATION_CONDITIONS . '</a>' .
                                         '<a href="' . tep_href_link(FILENAME_CONTACT_US) . '" style="color:white;">' . BOX_INFORMATION_CONTACT . '</a>');
$b = true;
  new infoBox($info_box_contents, $b);
?>
            </td>
          </tr>
<!-- information_eof //-->
