<?php
	include('connexion.php');
        
        $id_update=0;
        $update=false;
		$id_pers_dec='';
		$date_dec='';
		$lieu_dec='';
		$age_dec='';
		$id_cause_dec='';


	if (isset($_POST['submit'])) {
		$id_pers_dec=$_POST['id_pers_dec'];
		$date_dec=$_POST['date_dec'];
		$lieu_dec=$_POST['lieu_dec'];
		$age_dec=$_POST['age_dec'];
		$id_cause_dec=$_POST['id_cause_dec'];
		$rqt="INSERT INTO tdeces (id_pers_dec,date_dec,lieu_dec,age_dec,id_cause_dec) VALUES ('".$id_pers_dec."','".$date_dec."','".$lieu_dec."','".$age_dec."','".$id_cause_dec."')";
		mysqli_query($base,$rqt) or die("Error");

		$_SESSION['message']="Enregistré avec succès";
		$_SESSION['msg_type']="success";
  header('location:./deces.php');
		
 }
 	if (isset($_GET['delete'])) {
 		$id=$_GET['delete'];
 		$rqt_del="DELETE FROM tdeces WHERE id_deces=$id";
		mysqli_query($base,$rqt_del) or die("Error");
		$_SESSION['message']="suppréssion réussie";
		$_SESSION['msg_type']="danger";
  header('location:./deces.php');

 	}

 	if (isset($_GET['edit'])) {
 		$id=$_GET['edit'];
 		$update=true;
 		$rqt_sel="SELECT * FROM tdeces WHERE id_dec=$id";
        $result=mysqli_query($base,$rqt_sel) OR die(mysql_error());
        if(count($result)==1){
        $row=mysqli_fetch_array($result);
        $id_update=$row['id_dec'];
        $id_pers_dec=$row['id_pers_dec'];
		$date_dec=$row['date_dec'];
		$lieu_dec=$row['lieu_dec'];
		$age_dec=$row['age_dec'];
		$id_cause_dec=$row['id_cause_dec'];
        }
 	}
 	if (isset($_POST['update'])) {
 		$id_update=$_POST['id_update'];
 		$id_pers_dec=$_POST['id_pers_dec'];
		$date_dec=$_POST['date_dec'];
		$lieu_dec=$_POST['lieu_dec'];
		$age_dec=$_POST['age_dec'];
		$id_cause_dec=$_POST['id_cause_dec'];
		$rqt="UPDATE tdeces SET id_pers_dec=$id_pers_dec,date_dec='".$date_dec."',lieu_dec='".$lieu_dec."',age_dec=$age_dec,id_cause_dec=$id_cause_dec WHERE id_dec=$id_update";
		echo $rqt;
		mysqli_query($base,$rqt) or die($mysql->error());
		$_SESSION['message']="modification réussie";
		$_SESSION['msg_type']="warning";
		header('location:./deces.php');
 	}



 ?>