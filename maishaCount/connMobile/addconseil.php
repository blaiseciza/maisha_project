<?php
include "conn.php";
$image=$_FILES['image']['name'];
$id_maladie_cons=$_POST['id_maladie_cons'];
$id_user_cons=$_POST['id_user_cons'];
$apropos_cons=mysqli_real_escape_string($connect,$_POST['apropos_cons']);
$prevention_cons=mysqli_real_escape_string($connect,$_POST['prevention_cons']);
$traitement_cons=mysqli_real_escape_string($connect,$_POST['traitement_cons']);
$title=mysqli_real_escape_string($connect,$_POST['title']);
$imagePath="../avatar/conseils/".$image;
move_uploaded_file($_FILES['image']['tmp_name'],$imagePath);
$connect->query("INSERT INTO tconseil(id_maladie_cons,id_user_cons,apropos_cons,prevention_cons,traitement_cons,photo_cons,title)
VALUES ('".$id_maladie_cons."','".$id_user_cons."','".$apropos_cons."','".$prevention_cons."','".$traitement_cons."','".$image."','".$title."')
");
?>