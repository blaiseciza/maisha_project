<?php
	include('connexion.php');
        
        $id_update=0;
        $update=false;
		$nom_pers='';
		$postnom_pers='';
		$prenom_pers='';
		$sexe_pers='';
		$pere_pers='';
		$mere_pers='';
		$adresse_pers='';

	if (isset($_POST['submit'])) {
		$nom_pers=$_POST['nom_pers'];
		$postnom_pers=$_POST['postnom_pers'];
		$prenom_pers=$_POST['prenom_pers'];
		$sexe_pers=$_POST['sexe_pers'];
		$pere_pers=$_POST['pere_pers'];
		$mere_pers=$_POST['mere_pers'];
		$adresse_pers=$_POST['adresse_pers'];
		$rqt="INSERT INTO tpersonne (nom_pers,postnom_pers,prenom_pers,sexe_pers,pere_pers,mere_pers,adresse_pers) VALUES ('".$nom_pers."','".$postnom_pers."','".$prenom_pers."','".$sexe_pers."','".$pere_pers."','".$mere_pers."','".$adresse_pers."')";
		mysqli_query($base,$rqt) or die("Error");

		$_SESSION['message']="Enregistré avec succès";
		$_SESSION['msg_type']="success";
  header('location:./identite.php');
		
 }
 	if (isset($_GET['delete'])) {
 		$id=$_GET['delete'];
 		$rqt_del="DELETE FROM tpersonne WHERE id_pers=$id";
		mysqli_query($base,$rqt_del) or die("Error");
		$_SESSION['message']="suppréssion réussie";
		$_SESSION['msg_type']="danger";
  header('location:./identite.php');

 	}

 	if (isset($_GET['edit'])) {
 		$id=$_GET['edit'];
 		$update=true;
 		$rqt_sel="SELECT * FROM tpersonne WHERE id_pers=$id";
        $result=mysqli_query($base,$rqt_sel) OR die(mysql_error());
        if(count($result)==1){
        $row=mysqli_fetch_array($result);
        $id_update=$row['id_pers'];
        $nom_pers=$row['nom_pers'];
		$postnom_pers=$row['postnom_pers'];
		$prenom_pers=$row['prenom_pers'];
		$sexe_pers=$row['sexe_pers'];
		$pere_pers=$row['pere_pers'];
		$mere_pers=$row['mere_pers'];
		$adresse_pers=$row['adresse_pers'];
        }
 	}
 	if (isset($_POST['update'])) {
 		$id_update=$_POST['id_update'];
 		$nom_pers=$_POST['nom_pers'];
		$postnom_pers=$_POST['postnom_pers'];
		$prenom_pers=$_POST['prenom_pers'];
		$sexe_pers=$_POST['sexe_pers'];
		$pere_pers=$_POST['pere_pers'];
		$mere_pers=$_POST['mere_pers'];
		$adresse_pers=$_POST['adresse_pers'];
		$rqt="UPDATE tpersonne SET nom_pers='".$nom_pers."',postnom_pers='".$postnom_pers."',prenom_pers='".$prenom_pers."',sexe_pers='".$sexe_pers."',pere_pers='".$pere_pers."',mere_pers='".$mere_pers."',adresse_pers='".$adresse_pers."' WHERE id_pers=$id_update";
		mysqli_query($base,$rqt) or die($mysql->error());
		$_SESSION['message']="modification réussie";
		$_SESSION['msg_type']="warning";
		header('location:./identite.php');
 	}



 ?>
