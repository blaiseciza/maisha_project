<?php
// demarrage des variables de session au lancement de la page
	session_start();
?>
<?php 
$hostname='localhost';
$username='root';
$pwd='root';

//Connexion a Mysql
$base = mysql_connect($hostname,$username,$pwd);
mysql_select_db('db_maisha',$base);
?>