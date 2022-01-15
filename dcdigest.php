<?php

require_once('functions.php');

// create a sql query based on their email preferences
$where="WHERE status='approved'";
$now=time();
$where.=" And start>$now";
$fornight=$now+(14*24*60*60); // limit is currently fixed at two weeks
$where.=" And start<$fornight";

// generate content
$events=generate_digest($where);

$nosent=0;

if (!isset($_REQUEST['send']) || $_REQUEST['send']!="yes")
{
?>
<h1>Manual Digest Send</h1>
<form action="dcdigest.php" method="post" onsubmit="return confirm('Are you sure you want to send the digest?');">
	<input type="hidden" name="send" value="yes">
	<input type="submit" value="Send Digest Manually to Users (DO NOT REFRESH AFTER CLICKING!)">
</form>
<br />
<h1>Digest Content (may not format correctly)</h1>
<?php
echo nl2br(full_email($subject,$events,true));
exit();
} // otherwise we go!


// code to find users that get digests (including email preferences)
$res=getres("SELECT email,preferences FROM user WHERE activated='yes' AND mail='yes' AND digest='yes';");
//$res=getres("SELECT email,preferences FROM user WHERE activated='yes' AND mail='yes' AND digest='yes' AND id=2894;");

while($arr=mysql_fetch_array($res,MYSQL_NUM)) {
	// parse preference data


	// check content for results
	if($events!=''){
		$subject="Visions for Change: Upcoming Events Digest";
		$content=full_email($subject,$events,true);
		// email content to the subscriber
		$ccontent = str_replace("%email%", $arr[0], $content);
		$ccontent = str_replace("%token%", md5($arr[0]), $ccontent);
		$result=htmlmail($arr[0],$subject,strip_tags($ccontent),$ccontent);
		// add code here for logging results and notifying of any failures
		echo("Sent to $arr[0]: Success!<br/>\n\r");
		$nosent++;
	} else {
		echo($events);
		echo("$arr[0]: No events to send.<br/>\n\r");
	}

}

echo("<br/>\n\rHTML output:<br/>\n\r");
echo("<xmp>$content</xmp>");

$content=str_replace("\n","\n<br />",$content);
$content=str_replace("'","^qu^",$content);
$content=str_replace('"',"^dqu^",$content);

if(getres("INSERT INTO emailsent (sender,subject,body,senttime,nosent) VALUES ('0','$subject','$content','$now','$nosent')"))
	echo("Logged at $now");


?>
