<?php
require_once("functions.php");
starthtmlpage("Archives");

if(ismoderator()) {
	echo('<h2>List of Subscribers</h2>');
	$res=getres("SELECT email,activated FROM subscribers");
	echo('<table>');
	echo ("<tr><th>Email Address</th><th>Activated</th></tr>");
	while($arr=mysql_fetch_array($res,MYSQL_NUM)) {
		echo("<tr><td>$arr[0]</a></td><td>$arr[1]</td></tr>");
	}
	echo('</table>');
} else {
	echo('Only admins can view subscriber details.');
}
endhtmlpage();
?>