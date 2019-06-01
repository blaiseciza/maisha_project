<?php
include "conn.php";
$id_user_com=$_POST['id_user_com'];
$id_cons_com=$_POST['id_cons_com'];
$text_com=mysqli_real_escape_string($connect,$_POST['text_com']);
$connect->query("INSERT INTO tcommentaire(id_cons_com,id_user_com,text_com) VALUES ('".$id_cons_com."','".$id_user_com."','".$text_com."')");
?>