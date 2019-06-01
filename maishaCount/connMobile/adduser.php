<?php
include "conn.php";
$image=$_FILES['image']['name'];
$username=mysqli_real_escape_string($connect,$_POST['username']);
$passuser=$_POST['passuser'];
$sexeuser=$_POST['sexeuser'];
$date_naiss_user=$_POST['date_naiss_user'];
$imagePath="../avatar/".$image;
move_uploaded_file($_FILES['image']['tmp_name'],$imagePath);
$requete="INSERT INTO tbl_user(username,passuser,photouser,sexeuser,date_naiss_user) VALUES('".$username."','".md5($passuser)."','".$image."','".$sexeuser."','".$date_naiss_user."')";
$connect->query($requete);
?>