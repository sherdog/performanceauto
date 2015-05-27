<?php
/*
  $Id: order_history.php,v 1.5 2003/06/09 22:18:30 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

 
?>
<!-- customer_orders //-->
          <tr>
            <td>
<?php
      $info_box_contents = array();
      $info_box_contents[] = array('text' => 'Payment Options');

      new infoBoxHeading($info_box_contents, false, false);


      $customer_orders_string = '<table border="0" width="100%" cellspacing="0" cellpadding="1">';
        $customer_orders_string .= '  <tr>' .
                                   '    <td class="main" align="center"><strong><span style="color:#FFFFFF;">We only accept the following payment types</span></strong><br><img src="images/newsite/images/payments.gif"></td>' .
                                   '  </tr>';
      $customer_orders_string .= '</table>';

      $info_box_contents = array();
      $info_box_contents[] = array('text' => $customer_orders_string);
$b = true;
      new infoBox($info_box_contents, $b);
?>
            </td>
          </tr>
<!-- customer_orders_eof //-->

