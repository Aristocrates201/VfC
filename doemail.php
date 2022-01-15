<?php

$now=time();



getres("INSERT INTO log (type,event,variable) VALUES ('LOG','startingemailsend','$now')");

$fornight=$now+(14*24*60*60);
$where="WHERE status='approved' And start>$now And start<$fornight";
$res=getres("SELECT id,title,description,start,end,org,price,contactname,contactemail,tel,web,book,buildingroom,address1,address2,towncity,postcode,status FROM event $where ORDER BY start ASC");
while($arr=mysql_fetch_array($res,MYSQL_NUM))
{
	
}

$htmlmessage="<html><body>Test email.";
$htmlmessage.="</body></html>";
$plainmessage=strip_tags($htmlmessage);

$res=getres("SELECT email FROM user WHERE activated='yes' and mail='yes' And digest='yes';");

while($arr=mysql_fetch_array($res,MYSQL_NUM))
{
	sendemail($arr[0],"Events in the coming fortnight",$plainmessage,$htmlmessage);
}

function sendemail($eto,$subject,$plainmessage,$htmlmessage)
{
	
        if(htmlmail( $eto ,  $subject  , $plainmessage, $htmlmessage ))
	{
		if(mail($eto,$subject,$plainmessage,"From: ".$settings['sitename']." <noreply@".$settings['domain'].">"))
		{
			getres("INSERT INTO log (type,event,variable) VALUES ('LOG','emailsent','$eto')");
		}
		else
			getres("INSERT INTO log (type,event,variable) VALUES ('ERROR','failedtosend','$eto')");
	}
	else
		getres("INSERT INTO log (type,event,variable) VALUES ('ERROR','failedtosend','$eto')");
}

?>