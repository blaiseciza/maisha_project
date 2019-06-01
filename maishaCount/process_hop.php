<?php
	include('connexion.php');
        
        $id_update=0;
        $update=false;
		$nom_hop='';
		$adresse_hop='';

	if (isset($_POST['submit'])) {
		$nom_hop=mysqli_real_escape_string($base,$_POST['nom_hop']);
		$adresse_hop=mysqli_real_escape_string($base,$_POST['adresse_hop']);
		$rqt="INSERT INTO thopital (nom_hop,adresse_hop) VALUES ('".$nom_hop."','".$adresse_hop."')";
		mysqli_query($base,$rqt) or die("Error");

		$_SESSION['message']="Enregistré avec succès";
		$_SESSION['msg_type']="success";
  header('location:./hopital.php');
		
 }
 	if (isset($_GET['delete'])) {
 		$id=$_GET['delete'];
 		$rqt_del="DELETE FROM thopital WHERE id_hop=$id";
		mysqli_query($base,$rqt_del) or die("Error");
		$_SESSION['message']="suppréssion réussie";
		$_SESSION['msg_type']="danger";
  header('location:./hopital.php');

 	}

 	if (isset($_GET['edit'])) {
 		$id=$_GET['edit'];
 		$update=true;
 		$rqt_sel="SELECT * FROM thopital WHERE id_hop=$id";
        $result=mysqli_query($base,$rqt_sel) OR die(mysql_error());
        if(count($result)==1){
        $row=mysqli_fetch_array($result);
        $id_update=$row['id_hop'];
        $nom_hop=$row['nom_hop'];
		$adresse_hop=$row['adresse_hop'];
        }
 	}
 	if (isset($_POST['update'])) {
 		$id_update=mysqli_real_escape_string($base,$_POST['id_update']);
 		$nom_hop=mysqli_real_escape_string($base,$_POST['nom_hop']);
		$adresse_hop=$_POST['adresse_hop'];
		$rqt="UPDATE thopital SET nom_hop='".$nom_hop."',adresse_hop='".$adresse_hop."' WHERE id_hop=$id_update";
		mysqli_query($base,$rqt) or die($mysql->error());
		$_SESSION['message']="modification réussie";
		$_SESSION['msg_type']="warning";
		header('location:./hopital.php');
 	}



 ?>