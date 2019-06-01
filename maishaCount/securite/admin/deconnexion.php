<?php
	include('connexion.php');
?>
<?php
	session_destroy();
	header('location:./index.php');
?>