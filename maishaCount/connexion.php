<?php
// demarrage des variables de session au lancement de la page
	session_start();
?> 
<?php 
$hostname='localhost';
$username='root';
$pwd='root';
$db_name="db_maisha";

//Connexion a Mysql
$base = mysqli_connect($hostname,$username,$pwd,$db_name) or die("Error");
?>