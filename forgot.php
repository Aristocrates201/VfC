<?php
require_once("functions.php");
starthtmlpage("Forgot");

?>
<h1>Forgotten Log-in Details</h1>
Enter the email address you registered with to have your login details emailed to you.
<div class="forgotbox">
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<?php
	startform();
		txtbx('email','','emailofforgotten');
        echo('<br style="clear:both"/>'); ?>
<div class="g-recaptcha" data-sitekey="6Lc812oUAAAAABfVkOuFliGh2QaSGv9py6Kgs-bh"></div>
<?php
		btn('submit','email login details');
	endform();
?>


</div>

<?php
endhtmlpage();

?>