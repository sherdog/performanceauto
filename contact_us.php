<?php
/*
  $Id: contact_us.php,v 1.42 2003/06/12 12:17:07 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_CONTACT_US);

  $error = false;
  if (isset($HTTP_GET_VARS['action']) && ($HTTP_GET_VARS['action'] == 'send')) {
    $name = tep_db_prepare_input($_POST['yourname']);
    $email_address = tep_db_prepare_input($_POST['email']);
    $comment= tep_db_prepare_input($_POST['enquiry']);
	$message =  "Name: ".$name."\n";
	$message .= "Email: ".$email_address."\n";
	$message .= "Enquiry: ". $comment."\n";
	
	if (tep_validate_email($email_address)) {
      mail('tom@performanceauto.us', 'performanceauto.us website enquiry', $message, 'From: '.$email_address);
	 // tep_mail('sherdog@gmail.com', STORE_OWNER_EMAIL_ADDRESS, EMAIL_SUBJECT, $enquiry, $name, $email_address);
	//mail('sherdog@gmail.com', 'test', $message, 'From: '.$email_address);
      tep_redirect(tep_href_link(FILENAME_CONTACT_US, 'action=success'));
    } else {
      $error = true;

      $messageStack->add('contact', ENTRY_EMAIL_ADDRESS_CHECK_ERROR);
    }
  }

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_CONTACT_US));
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<base href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<script type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}
//-->
</script>
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
    <td width="100%" valign="top"><form action="contact_us.php?action=send" method="post" onSubmit="MM_validateForm('usersname','','R','email','','RisEmail');return document.MM_returnValue">
      <table border="0" width="100%" cellspacing="0" cellpadding="0">
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="pageHeading"><?php echo HEADING_TITLE; ?></td>
          </tr>
		  <tr>
		  	<td style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:10px; ">Please fill out the form below with your mailing address. </td>
		  </tr>
		  <tr>
		  	<td valign="top" class="main"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="65%" valign="top"><span class="maintext"><strong>Our Address:<br>
                </strong>Perfornace Auto <br>
2801 Falls Ave. <br>
Waterloo, Iowa 50701<br>
Toll Free: 1-800-682-7166<br>
<br>
<strong>Store Hours:<br>
Weekdays 8:30 - 5:00 CST and <br>
Saturday 8:30 - 12:00. </strong></span><br><div align="center"></div></td>
               
              </tr>
            </table></td>
		  </tr>
		  <tr>
		  	<td class="main"><strong>Find us: <a href="http://www.mapquest.com/maps/map.adp?ovi=1&zoom=8&mapdata=6vb18sfh53vfQDluJt%2f7kkoZ7cWYNz8oE4VGqYxaarWqzuxhsOiy92neCwXbKvuq4NiRetrpvxB%2bpGDcuAiA1Gp0lZbUD6vhPq%2fpdBJwfnExCzoJw9OxOFkXzejkRX6KBorY2uanB4qZi%2bLF%2fi1rZsZvRrVN3qJmErYVRVp38R7JG1OrA%2f8jD5SybEx96DmRHb9Vvox9lPEzXSwrFFghNvHicKUTp3VNNPnzFP%2bZ3TD5JKHntpMW%2bZfa6j62TCk%2fGlgwpkJ3LJwCEwFFuTe0TrVORQuQUoHbNbLjMH3EF6hxV1QhrtTGn0cj3aCVYzokIP2UAjFtHB60dttvUoG8xn%2f%2fEM9htSbL2y7Fu1qY8JoMmP%2blYD%2brrGjzodJyPzATWInOVHIP%2b4kQyaT5LJl5UPVc%2fn4rlOzlrAKXpfCvM2hK8Cndnn7bAR9l3ZVZjiwD%2fHZhlZKtjxFUvo7g8ymt%2fJb3beqZwS2TZp35lkoWdTL7Ig6im8z6hjs6j8N9uzUK%2f6KOprk1oCs%3d" target="_blank">click here for a map </a><br>
		  	</strong></td>
		  </tr>
        </table></td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>
<?php
  if ($messageStack->size('contact') > 0) {
?>
      <tr>
        <td><?php echo $messageStack->output('contact'); ?></td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>
<?php
  }

  if (isset($HTTP_GET_VARS['action']) && ($HTTP_GET_VARS['action'] == 'success')) {
?>
     
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>
      <tr>
        <td><table border="0" width="100%" cellspacing="1" cellpadding="2" class="infoBox">
          <tr class="infoBoxContents">
            <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
              <tr>
                <td width="10"><?php echo tep_draw_separator('pixel_trans.gif', '10', '1'); ?></td>
                <td align="right">Your message was sent successfully! <?php echo '<a href="' . tep_href_link(FILENAME_DEFAULT) . '">' . tep_image_button('button_continue.gif', IMAGE_BUTTON_CONTINUE) . '</a>'; ?></td>
                <td width="10"><?php echo tep_draw_separator('pixel_trans.gif', '10', '1'); ?></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
<?php
  } else {
?>
      <tr>
        <td><table border="0" width="100%" cellspacing="1" cellpadding="2" class="infoBox">
          <tr class="infoBoxContents">
            <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
              <tr>
                <td class="main">Name</td>
              </tr>
              <tr>
                <td class="main">
                  <input name="yourname" type="text" id="usersname"></td>
              </tr>
              <tr>
                <td class="main">Email Address                   </td>
              </tr>
              <tr>
                <td class="main"><input type="text" name="email"></td>
              </tr>
              <tr>
                <td class="main">Question/Comment</td>
              </tr>
              <tr>
                <td><textarea name="enquiry" cols="70" rows="6" id="enquiry"></textarea></td>
              </tr>
            </table></td>
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
                <td align="right"> <input type="submit" name="Submit" value="Submit"></td>
                <td width="10"><?php echo tep_draw_separator('pixel_trans.gif', '10', '1'); ?></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
<?php
  }
?>
    </table>
    </form></td>
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
