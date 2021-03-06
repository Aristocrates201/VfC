<?php

require_once('functions.php');
					
// code to find users that get digests (including email preferences)
$res=getres("SELECT email,preferences FROM user WHERE activated='yes' AND mail='yes' AND digest='yes';");

while($arr=mysql_fetch_array($res,MYSQL_NUM)) {
	// parse preference data
	
	// create a sql query based on their email preferences
	$where="WHERE status='approved'";
	$now=time();
	$where.=" And start>$now";
	$fornight=$now+(14*24*60*60); // limit is currently fixed at two weeks
	$where.=" And start<$fornight";
	
	// generate content
	$events=generate_digest($where);
	
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
			
if(getres("INSERT INTO emailsent (sender,subject,body,senttime) VALUES ('0','$subject','$content','$now')"))
	echo("Logged at $now");


?>