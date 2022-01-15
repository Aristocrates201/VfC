<?php
require_once("functions.php");

starthtmlpage("Change Password");

	echo("<h1>Change Password</h1>");
	
	$token=mysql_real_escape_string($_GET['token']);
	
    startform();	
	pswd('New Password','newPasswordB');
	pswd('Confirm New Password','retypeNewPasswordB');
	echo('<input type="hidden" name="token" value="'.$token.'"/>');
    echo('<br style="clear:both"/>');
    btn('submit','Change Password');
	echo("</form>");

endhtmlpage();

?>