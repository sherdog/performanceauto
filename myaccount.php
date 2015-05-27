<?
ini_set('error_reporting', 1);
require('main-inc.php');
//get content
if(!isset($_SESSION['logged']) || !isset($_SESSION['hasPermission'])){
	header('Location: login.php?from=myaccount');
}
$headerImage = 'images/pageTitle-yourAccount.jpg';
$imageWidth = 117;




//get member info

$userid = $_SESSION['userid'];
$sql = 'SELECT * FROM members WHERE memberID = ' . $userid;

$getMember = db_query($sql);
$member = db_fetch_array($getMember);

$name 		= stripslashes($member['userName']);
$address 	= stripslashes($member['userAddress']);
$city		= stripslashes($member['userCity']);
$state 		= stripslashes($member['userState']);
$zip		= stripslashes($member['userZip']);
$email 		= stripslashes($member['userEmail']);
$level 		= stripslashes($member['userLevel']);
$phone		= stripslashes($member['userPhone']);
echo $name;
$joinDateString 	= strtotime($member['registrationDate']);
$expireDateString 	= strtotime($member['registrationExpire']);

//get membership status 
// green = good to go
//yellow means getting close for renewal time
//red means expired account
$todayDate = date('n-d-Y');
$expireDate = date('n-d-Y', $expireDateString);
if($expireDate < $todayDate){
	$status = '<span style="color:green; font-weight:bold;">Active</span>';
}else{
	$status = '<span style="color:red; font-weight:bold;">Expired</span>';
}


if($_GET['action'] == 'registerplane'){
	$planeModel = trim($_POST['planeModel']);
	$planeYear  = trim($_POST['planeYear']);
	$datePurchased = trim($_POST['purchaseDate']);
	$comments = trim($_POST['planeComments']);
	
	include('xmlParser.php');
	//get member details
	$location = $address.' '.city.' '.$state.' '.zip;
	$url = 'http://api.local.yahoo.com/MapsService/V1/geocode';
	$url .= '?appid=rlerdorf&location='.rawurlencode($location);
	$myFile = new XMLParser($url);
	
	$xmlRoot = $myFile->data[0];    // GEO Element
	
	if (sizeof($xmlRoot) > 0 ) {
			$geoLocation = $xmlRoot['child'];
			if (sizeof($geoLocation) > 0) {
				$geoLocationProperties = $geoLocation[0]['child'];
				$long = $geoLocationProperties[1]['content'];
				$lat = $geoLocationProperties[0]['content'];
			
			}
			
	}
	
	
	$dataArray = array('memberID'=>$_SESSION['userid'], 'planeRegistrationDate'=>'now()', 'planeModel'=>$planeModel, 'planeYear'=>$planeYear, 'userLat'=>$lat, 'userLong'=>$long, 'datePurchased'=>$datePurchased, 'planeComments'=>$comments);
	$insert = db_perform('planeregistration', $dataArray);
	
	if($insert){
		header('Location: myaccount.php?action=edit&area=plane');
	}
}
if($_GET['action'] == 'saveplane'){
	$planeModel 		= trim($_POST['planeModel']);
	$planeYear  		= trim($_POST['planeYear']);
	$datePurchased 		= trim($_POST['purchaseDate']);
	$comments 			= trim($_POST['planeComments']);
	$planeID			= trim($_POST['planeID']);
	
	include('xmlParser.php');
	//get member details
	$location = $address.' '.city.' '.$state.' '.zip;
	$url = 'http://api.local.yahoo.com/MapsService/V1/geocode';
	$url .= '?appid=rlerdorf&location='.rawurlencode($location);
	$myFile = new XMLParser($url);
	
	$xmlRoot = $myFile->data[0];    // GEO Element
	
	if (sizeof($xmlRoot) > 0 ) {
			$geoLocation = $xmlRoot['child'];
			if (sizeof($geoLocation) > 0) {
				$geoLocationProperties = $geoLocation[0]['child'];
				$long = $geoLocationProperties[1]['content'];
				$lat = $geoLocationProperties[0]['content'];
			
			}
			
	}
	
	
	$dataArray = array('memberID'=>$_SESSION['userid'], 'planeRegistrationDate'=>'now()', 'planeModel'=>$planeModel, 'planeYear'=>$planeYear, 'userLat'=>$lat, 'userLong'=>$long, 'datePurchased'=>$datePurchased, 'planeComments'=>$comments);
	$insert = db_perform('planeregistration', $dataArray, 'update', 'planeRegistrationID='.$planeID);
	
	if($insert){
		header('Location: myaccount.php?action=edit&area=plane');
	}
}
if($_GET['action'] == 'saveprofile'){
	$name 		= trim($_POST['name']);
	$address 	= trim($_POST['address']);
	$address2 	= trim($_POST['address2']);
	$city		= trim($_POST['city']);
	$state		= trim($_POST['state']);
	$zip		= trim($_POST['zip']);
	$email		= trim($_POST['email']);
	$phone		= trim($_POST['phone']);
	$dataArray = array('userName'=>$name,'userPhone'=>$phone, 'userAddress'=>$address, 'userAddress2'=>$address2, 'userCity'=>$city, 'userState'=>$state, 'userZip'=>$zip, 'userEmail'=>$email);
	
	$update = db_perform('members', $dataArray, 'update', 'memberID = ' . $_SESSION['userid']);
	
	if($update){
		header('Location: myaccount.php');
	}	
}

if($_GET['action'] == 'changepassword'){
	$password = md5($_POST['password']);
	
	$dataArray = array('userPassword'=>$password);
	$update = db_perform('members',$dataArray, 'update', 'memberID='.$_SESSION['userid']);
	if($update){
		header('Location: myaccount.php');
	}
}

if($_GET['action'] == 'deleteplane'){
	$del = db_query('DELETE FROM planeregistration WHERE planeRegistrationID = ' . $_GET['planeID']);
	
	if($del){
		header('Location: myaccount.php?action=edit&area=plane');
	}
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?=TITLE_MYACCOUNT_PAGE?></title>
<link rel="stylesheet" type="text/css" href="styles.css" />
<script language="javascript" type="text/javascript" src="javascript.js"></script>
<script language="javascript" type="text/javascript" src="form.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>
<body onload= <?=$bodyAttributesSub?>>
<table width="794" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="794" border="0" cellpadding="0" cellspacing="0" class="navbg">
      <tr>
        <td width="167"><img src="images/header_logo_left.jpg" width="167" height="148" /></td>
        <td width="376"><img src="images/header_logo_right.jpg" width="376" height="148" /></td>
        <td valign="top" align="right"><? include('topnav-main.php'); ?></td>
        <td width="35"><img src="images/header_right.jpg" width="35" height="148" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="794" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="167" class="sidenav">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="<?=$imageWidth?>" ><img src="<?=$headerImage?>" /></td>
            <td class="pageTitleBG">&nbsp;</td>
            <td width="15"><img src="images/pageTitle-endcap.jpg" width="15" height="28" /></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td valign="top" class="sidenav"><? showSideNav(); ?></td>
        <td valign="top" class="mainContentBG"><table width="600%" border="0" cellspacing="0" cellpadding="7">
          <tr>
            <td valign="top" ><table width="600" border="0" cellspacing="0" cellpadding="4">
              <tr>
                <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="4">
                  <tr>
                    <td valign="top">
					<?
					//check action and do whatever
					switch($_GET['action']){
						case 'edit':
							switch($_GET['area']){
							case 'newplane':
							case 'editplane':
							
							if($_GET['area'] == 'newplane'){
								$model 			= '';
								$year 			= '';
								$purchasedate 	= '';
								$planecomments 	= '';
								$planeyear		= '';
								$formaction		= $_SERVER['PHP_SELF'].'?action=registerplane';
								
							}
							if($_GET['area'] == 'editplane'){
								$planeID = $_GET['planeID'];
								$getPlane = db_query('SELECT * FROM planeregistration WHERE planeRegistrationID = ' . $planeID);
								$plane = db_fetch_array($getPlane);
								
								$model = stripslashes($plane['planeModel']);
								$year = stripslashes($plane['planeYear']);
								$purchasedate = $plane['datePurchased'];
								$planecomments = stripslashes($plane['planeComments']);
								$planeyear	= stripslashes($plane['planeYear']);
								
								$formaction = $_SERVER['PHP_SELF'].'?action=saveplane';
								
							}
							
							?>
							<fieldset><legend class="pageHeading12">Plane Registration</legend>
							<form id="register" name="register" method="post" action="<?=$formaction?>" style="margin:0px; padding:0px;">
							  <input type="hidden" name="planeID" value="<?=$_GET['planeID']?>" />
							  <table width="100%" border="0" cellspacing="0" cellpadding="4" style="padding:5px;">
                                <tr>
                                  <td width="33%" class="grey11"><strong>Plane Model </strong></td>
                                  <td width="67%"><select name="planeModel" id="planeModel" style="width:200px;">
                                    <option>Select one</option>
                                    <option value="T-I" <? if($model == 'T-I') echo "selected"; ?>>T-I</option>
                                    <option value="T-II" <? if($model == 'T-II') echo "selected"; ?>>T-II</option>
                                    <option value="T-III" <? if($model == 'T-III') echo "selected"; ?>>T-III</option>
                                    <option value="1983" <? if($model == '1983') echo "selected"; ?>>1983</option>
                                    <option value="Tandem" <? if($model == 'Tandem') echo "selected"; ?>>Tandem</option>
                                  </select>                                  </td>
                                </tr>
                                <tr>
                                  <td class="grey11"><strong>Year</strong> </td>
                                  <td><select name="planeYear" id="planeYear" style="width:200px;">
								  <?
								  	$startdate = date('Y') - 75;
									$enddate	= date('Y');
								  	for($i=$enddate; $i >= $startdate; $i--){
										echo "<option value=\"".$i."\"";
											if($i == $planeyear)
												echo "selected";
										echo ">".$i."</option>\n";
									}
								  ?>
                                  </select>
                                    <br />
									<span class="smallRed">(approximate year)</span></td>
                                </tr>
                                <tr>
                                  <td class="grey11"><strong>Date Purchased </strong></td>
                                  <td><input name="purchaseDate" type="text" id="purchaseDate" style="width:200px;" value="<?=$purchasedate?>" /> 
                                    <br />
									<span class="smallRed">mm/dd/yyyy</span> </td>
                                </tr>
                                <tr>
                                  <td valign="top" class="grey11"><strong>Comments</strong></td>
                                  <td><textarea name="planeComments" id="planeComments" style="width:200px; height:100px;"><?=$planecomments?></textarea></td>
                                </tr>
                                <tr>
                                  <td colspan="2" valign="top" class="grey11"><div align="right">
                                    <input type="image" name="imageField" src="images/btn_go.jpg" style="border:0px;" />
                                  </div></td>
                                  </tr>
                              </table>
                              </form>
							</fieldset>
							<?
							break;
							case 'plane':
							?>
							<table width="100%" border="0" cellspacing="0" cellpadding="4">
							  <tr>
								<td><a href="<?=$_SERVER['PHP_SELF']?>?action=edit&area=newplane">Add Plane</a></td>
							  </tr>
							  <tr>
								<td><table width="100%" border="0" cellspacing="0" cellpadding="4">
								  <tr>
									<td width="17%" class="stepHeader">Year</td>
									<td width="22%" class="stepHeader">Model</td>
									<td width="31%" class="stepHeader">Date Registered </td>
									<td width="30%" class="stepHeader">Action </td>
									</tr>
								  <?
								  $getPlanes = db_query('SELECT * FROM planeregistration WHERE memberID = ' . $_SESSION['userid']);
								  $num = db_num_rows($getPlanes);
								  if($num > 0){
									  while($pInfo = db_fetch_array($getPlanes)){
										$regDate = strtotime($pInfo['planeRegistrationDate']);
									  ?>
									  <tr>
										<td class="grey11"><?=$pInfo['planeYear']?></td>
										<td class="grey11"><?=$pInfo['planeModel']?></td>
										<td class="grey11"><?=date('m/d/Y h:i:s A', $regDate)?></td>
										<td  valign="top" class="grey11"><a href="<?=$_SERVER['PHP_SELF']?>?action=edit&area=editplane&planeID=<?=$pInfo['planeRegistrationID']?>">Edit</a> | <a href="<?=$_SERVER['PHP_SELF']?>?action=deleteplane&planeID=<?=$pInfo['planeRegistrationID']?>" onclick="return confirm('Are you sure you want to delete this plane? THIS IS NOT UNDOABLE');">Delete</a>							  </tr>
									<?
									}
								}else{
								?>
								<tr>
									<td colspan="4" valign="top" class="smallRed"> <div align="center"><br />
									  -- no planes registered --</div></td>
								</tr>
								<?
								}
								?>
								</table></td>
							  </tr>
							</table>
							<?
							break;
							case 'profile':
							
							//get details
							$getDetails = db_query('SELECT * FROM members where memberID = ' . $_SESSION['userid']);
							$d = db_fetch_array($getDetails);
							
							$name 		= stripslashes($d['userName']);
							$address 	= stripslashes($d['userAddress']);
							$address2 	= stripslashes($d['userAddress2']);
							$city		= stripslashes($d['userCity']);
							$state		= stripslashes($d['userState']);
							$zip		= stripslashes($d['userZip']);
							$email 		= stripslashes($d['userEmail']);
							$phonw		= stripslashes($d['userPhone']);
							
							$formaction = $_SERVER['PHP_SELF'].'?action=saveprofile';
							
							?>
							<form id="profile" name="profile" method="post" action="<?=$formaction?>" onsubmit="return checkProfile(this);">
							<fieldset><legend class="pageHeading12">Account Information</legend>
							<table width="100%" border="0" cellspacing="0" cellpadding="4" style="margin:5px;">
                             
							  <tr>
                                <td width="120" class="grey11"><strong>Name</strong></td>
                                <td><input name="name" type="text" id="name" style="width:200px;" value="<?=$name?>" /></td>
                              </tr>
                              <tr>
                                <td class="grey11"><strong>Address</strong></td>
                                <td><input name="address" type="text" id="address" style="width:200px;" value="<?=$address?>" /></td>
                              </tr>
                              <tr>
                                <td class="grey11"><strong>Address2</strong></td>
                                <td><input name="address2" type="text" id="address2" style="width:200px;" value="<?=$address2?>" /></td>
                              </tr>
                              <tr>
                                <td class="grey11"><strong>City</strong></td>
                                <td><input name="city" type="text" id="city" style="width:200px;" value="<?=$city?>" /></td>
                              </tr>
                              <tr>
                                <td class="grey11"><strong>State</strong></td>
                                <td><select name="state" id="state" style="width:200px;">
                                  <option>Select one</option>
                                  <?=showStates($state)?>
                                </select></td>
                              </tr>
                              <tr>
                                <td class="grey11"><strong>Zip</strong></td>
                                <td><input name="zip" type="text" id="zip" style="width:200px;" value="<?=$zip?>" /></td>
                              </tr>
                              <tr>
                                <td class="grey11"><strong>Phone</strong></td>
                                <td><input name="phone" type="text" id="phone" style="width:200px;" value="<?=$phone?>" /></td>
                              </tr>
							   <tr>
                                <td width="120" class="grey11"><strong>Email Address </strong></td>
                                <td><input name="email" type="text" id="email" style="width:200px;" value="<?=$email?>" /></td>
                              </tr>
							   <tr>
                                <td colspan="2" class="grey11"><div align="right">
                                  <input type="image" name="imageField2" src="images/btn_go.jpg" style="border:0px;" />
                                </div></td>
                                </tr>
                            </table>
							<br />
							</fieldset>
							</form>
							<?
							break;
							case 'changepassword':
							?>
							<form id="password" name="password" method="post" action="<?=$_SERVER['PHP_SELF']?>?action=changepassword" onsubmit="return checkPassword(this);">
							  <fieldset><legend class="pageHeading12">Change your Password</legend>
							  <table width="100%" border="0" cellspacing="0" cellpadding="4" style="margin:0px;">
                                <tr>
                                  <td width="120" class="greyText"><strong>Password</strong></td>
                                  <td><input name="password" type="password" id="password" style="width:200px;" /></td>
                                </tr>
                                <tr>
                                  <td class="greyText"><strong>Password Again </strong></td>
                                  <td><input name="passwordAgain" type="password" id="passwordAgain" style="width:200px;" /></td>
                                </tr>
                                <tr>
                                  <td colspan="2">
                                    <div align="right">
                                      <input type="image" name="imageField22" src="images/btn_go.jpg" style="border:0px;" />
                                      </div></td>
                                  </tr>
                              </table>
							  </fieldset>
                              </form>
							<?
						break;
							}
						break;
						
						case 'getquote':
							?>
							get quotes based on email address
							<?
						break;
						default:
						?>
						<fieldset>
						  <legend class="pageHeading12">Account Overview</legend>
						  <table width="300" border="0" cellspacing="0" cellpadding="4" style="padding:5px;">
							<tr>
							  <td width="37%" class="grey11"><strong>Name:</strong></td>
							  <td width="63%" class="grey11"><?=stripslashes($member['userName'])?></td>
							</tr>
							<tr>
							  <td class="grey11"><strong>Address</strong></td>
							  <td class="grey11"><?=$address?></td>
							</tr>
							<tr>
							  <td class="grey11"><strong>City State Zip </strong></td>
							  <td class="grey11"><?=$city.', '.$state.' '.$zip?></td>
							</tr>
							<tr>
							  <td class="grey11"><strong>Phone</strong></td>
							  <td class="grey11"><?=$phone?></td>
							</tr>
							<tr>
							  <td class="grey11"><strong>Email Address </strong></td>
							  <td class="grey11"><?=$email?></td>
							</tr>
							<tr>
							  <td class="grey11">&nbsp;</td>
							  <td class="grey11">&nbsp;</td>
							</tr>
							<tr>
							  <td class="grey11"><strong>Membership Level </strong></td>
							  <td class="grey11"><?=$level?></td>
							</tr>
							<tr>
							  <td>&nbsp;</td>
							  <td>&nbsp;</td>
							</tr>
						  </table>
						</fieldset>
						<?
						break;
					}
					?>
					</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                </table></td>
                <td width="200" valign="top"><table width="200" border="0" align="right" cellpadding="4" cellspacing="0" class="controlPanel">
                  <tr>
                    <td bgcolor="#00204F" class="controlPanelHeader">Control Panel </td>
                  </tr>
                  <tr>
                    <td><a href="<?=$_SERVER['PHP_SELF']?>">Overview</a></td>
                  </tr>
                  <tr>
                    <td><a href="<?=$_SERVER['PHP_SELF']?>?action=edit&amp;area=plane">Register your Plane</a></td>
                  </tr>
                  <tr>
                    <td><a href="<?=$_SERVER['PHP_SELF']?>?action=edit&amp;area=profile">Edit Profile</a></td>
                  </tr>
                  <tr>
                    <td><a href="<?=$_SERVER['PHP_SELF']?>?action=edit&amp;area=changepassword">Change Password</a></td>
                  </tr>
                  <!-- <tr>
                    <td><a href="<?=$_SERVER['PHP_SELF']?>?action=getquotes">Quote Retrieval</a></td>
                  </tr> -->
                  <tr>
                    <td><a href="logout.php">Log Out</a></td>
                  </tr>
                  <tr>
                    <td><table width="80%" border="0" align="center" cellpadding="4" cellspacing="0" class="controlPanel">
                        <tr>
                          <td>Join Date: <? echo date('m/d/Y', $joinDateString); ?></td>
                        </tr>
                        <tr>
                          <td>Expire Date: <? echo date('m/d/Y', $expireDateString); ?></td>
                        </tr>
                        <tr>
                          <td>Status:
                            <?=$status?></td>
                        </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  
   <tr>
     <td><? include('footer-sub.php'); ?></td>
   </tr>
</table>
 <p class="body">&nbsp;</p>
<p class="body">&nbsp;</p>
</body>
</html>
