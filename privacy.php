<?php
/*
  $Id: privacy.php,v 1.22 2003/06/05 23:26:23 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_PRIVACY);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_PRIVACY));
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<base href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>
<body marginwidth="0" marginheight="0" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
<!-- header //-->
<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
<!-- header_eof //-->

<!-- body //-->
<table border="0" width="779" cellspacing="3" cellpadding="0" class="maintable" align="center">
  <tr>
    <td width="<?php echo BOX_WIDTH; ?>" valign="top"><table border="0" width="<?php echo BOX_WIDTH; ?>" cellspacing="0" cellpadding="2">
<!-- left_navigation //-->
<?php require(DIR_WS_INCLUDES . 'column_left.php'); ?>
<!-- left_navigation_eof //-->
    </table></td>
<!-- body_text //-->
    <td width="100%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="0">
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="pageHeading"><?php echo HEADING_TITLE; ?></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
          <tr>
            <td class="main"><p>Performanceauto.us(also referred to as “We”) respects the privacy of our guests and customers, and we sincerely value our relationship with you.&nbsp; Our goal is to provide each customer with quality service, quality products, and quality care to give you the best shopping experience possible.&nbsp; We recognize and appreciate that you place your trust in us, so we strive to safeguard information about you.&nbsp; We are dedicated to protecting the privacy and security of our guests and customers, so we invite you to take a few minutes to get a better understanding about how we collect, use and protect your information. </p>
              <p><strong>What information do we collect? </strong></p>
              <p>We collect information you provide when you place an order, send us an e-mail, call us or complete any surveys. This information may include your name, your mailing address, your e-mail address, your phone number, your credit card number, and other personal information you provide to us. </p>
              <p>We also use technology that allows us to identify your browser type, the website you came from and the pages you view on our site.&nbsp; This technology helps us to improve our web site design and content to better serve you.&nbsp;&nbsp;&nbsp; </p>
              <p><strong>Do We Share Your Information? </strong></p>
              <p>Performanceauto.us does not disclose or share information about you with any third party.&nbsp; We may disclose information you provide if required by law or to protect the security or integrity of information collected or submitted on this website. </p>
              <p>We respect a guest's preference to limit communication, and we do not e-mail customers about promotions or new products.&nbsp; &nbsp; </p>
              <p><strong>Secured Credit Card Processing </strong></p>
              <p>Performanceauto.us uses Secure Sockets Layering (SSL) to encrypt your personal credit information, including your credit card number, before it travels over the Internet. SSL technology is the industry standard for secure online transactions. Because we use SSL, placing an order online with Performanceauto.us is just as safe as giving your credit card number over the phone.&nbsp; </p>
              <p><strong>Strict Action Against Fraudulent Purchases </strong></p>
              <p>We at Performanceauto.usare also subject to risk in the event someone ever steals your credit card.&nbsp; Therefore, if an individual ever physically steals your credit card and attempts to make an unauthorized purchase on our website, we may take direct and immediate legal action against such individual.&nbsp; The unauthorized use of another person's credit card is often felony, and we at Performanceauto.ustake the necessary steps to make sure such individuals are prosecuted accordingly.&nbsp;&nbsp;&nbsp; </p>
              <p><strong>Consumer Protection Laws </strong></p>
              <p>We at Performanceauto.us use security measures that are designed to prevent anyone from stealing and using your credit card.&nbsp; In addition, consumer protection laws protect you against the unauthorized use of your credit card. Under federal law, if someone steals your credit card or your credit card number, your liability is limited to $50 no matter how much the thief charges to your account </p>
              <p>&nbsp; </p></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>
      <tr>
        <td><table border="0" width="100%" cellspacing="1" cellpadding="2" class="infoBox">
          <tr class="infoBoxContents">
            <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
              <tr>
                <td width="10"><?php echo tep_draw_separator('pixel_trans.gif', '10', '1'); ?></td>
                <td align="right"><?php echo '<a href="' . tep_href_link(FILENAME_DEFAULT) . '">' . tep_image_button('button_continue.gif', IMAGE_BUTTON_CONTINUE) . '</a>'; ?></td>
                <td width="10"><?php echo tep_draw_separator('pixel_trans.gif', '10', '1'); ?></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
<!-- body_text_eof //-->
    <td width="<?php echo BOX_WIDTH; ?>" valign="top"><table border="0" width="<?php echo BOX_WIDTH; ?>" cellspacing="0" cellpadding="2">
<!-- right_navigation //-->
<?php require(DIR_WS_INCLUDES . 'column_right.php'); ?>
<!-- right_navigation_eof //-->
    </table></td>
  </tr>
</table>
<!-- body_eof //-->

<!-- footer //-->
<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
<br>
</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
