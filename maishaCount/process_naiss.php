<?php
	include('connexion.php');
        
        $id_update=0;
        $update=false;
		$id_pers_naiss='';
		$date_naiss='';
		$lieu_naiss='';
		$age_mere_naiss='';
		$id_hop_naiss='';


	if (isset($_POST['submit'])) {
		$id_pers_naiss=$_POST['id_pers_naiss'];
		$date_naiss=$_POST['date_naiss'];
		$lieu_naiss=$_POST['lieu_naiss'];
		$age_mere_naiss=$_POST['age_mere_naiss'];
		$id_hop_naiss=$_POST['id_hop_naiss'];
		$rqt="INSERT INTO tnaissance (id_pers_naiss,date_naiss,lieu_naiss,age_mere_naiss,id_hop_naiss) VALUES ('".$id_pers_naiss."','".$date_naiss."','".$lieu_naiss."','".$age_mere_naiss."','".$id_hop_naiss."')";
		mysqli_query($base,$rqt) or die("Error");

		$_SESSION['message']="Enregistré avec succès";
		$_SESSION['msg_type']="success";
  header('location:./naissance.php');
		
 }
 	if (isset($_GET['delete'])) {
 		$id=$_GET['delete'];
 		$rqt_del="DELETE FROM tnaissance WHERE id_naiss=$id";
		mysqli_query($base,$rqt_del) or die("Error");
		$_SESSION['message']="suppréssion réussie";
		$_SESSION['msg_type']="danger";
  header('location:./naissance.php');

 	}

 	if (isset($_GET['edit'])) {
 		$id=$_GET['edit'];
 		$update=true;
 		$rqt_sel="SELECT * FROM tnaissance WHERE id_naiss=$id";
        $result=mysqli_query($base,$rqt_sel) OR die(mysql_error());
        if(count($result)==1){
        $row=mysqli_fetch_array($result);
        $id_update=$row['id_naiss'];
        $id_pers_naiss=$row['id_pers_naiss'];
		$date_naiss=$row['date_naiss'];
		$lieu_naiss=$row['lieu_naiss'];
		$age_mere_naiss=$row['age_mere_naiss'];
		$id_hop_naiss=$row['id_hop_naiss'];
        }
 	}
 	if (isset($_POST['update'])) {
 		$id_update=$_POST['id_update'];
 		$id_pers_naiss=$_POST['id_pers_naiss'];
		$date_naiss=$_POST['date_naiss'];
		$lieu_naiss=$_POST['lieu_naiss'];
		$age_mere_naiss=$_POST['age_mere_naiss'];
		$id_hop_naiss=$_POST['id_hop_naiss'];
		$rqt="UPDATE tnaissance SET id_pers_naiss=$id_pers_naiss,date_naiss='".$date_naiss."',lieu_naiss='".$lieu_naiss."',age_mere_naiss=$age_mere_naiss,id_hop_naiss=$id_hop_naiss WHERE id_naiss=$id_update";
		mysqli_query($base,$rqt) or die($mysql->error());
		$_SESSION['message']="modification réussie";
		$_SESSION['msg_type']="warning";
		header('location:./naissance.php');
 	}



 ?>