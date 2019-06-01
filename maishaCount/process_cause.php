<?php
	include('connexion.php');
        
        $id_update_cause=0;
        $update=false;
		$designation_cause='';
		$detail_cause='';

	if (isset($_POST['submit'])) {
		$designation_cause=mysqli_real_escape_string($base,$_POST['designation_cause']);
		$detail_cause=mysqli_real_escape_string($base,$_POST['detail_cause']);
		$rqt="INSERT INTO tcause (designation_cause,detail_cause) VALUES ('".$designation_cause."','".$detail_cause."')";
		mysqli_query($base,$rqt) or die("Error");

		$_SESSION['message']="Enregistré avec succès";
		$_SESSION['msg_type']="success";
  header('location:./cause.php');
		
 }
 	if (isset($_GET['delete'])) {
 		$id=$_GET['delete'];
 		$rqt_del="DELETE FROM tcause WHERE id_cause=$id";
		mysqli_query($base,$rqt_del) or die("Error");
		$_SESSION['message']="suppréssion réussie";
		$_SESSION['msg_type']="danger";
  header('location:./cause.php');

 	}

 	if (isset($_GET['edit'])) {
 		$id=$_GET['edit'];
 		$update=true;
 		$rqt_sel="SELECT * FROM tcause WHERE id_cause=$id";
        $result=mysqli_query($base,$rqt_sel) OR die(mysql_error());
        if(count($result)==1){
        $row=mysqli_fetch_array($result);
        $id_update_cause=$row['id_cause'];
        $designation_cause=$row['designation_cause'];
		$detail_cause=$row['detail_cause'];
        }
 	}
 	if (isset($_POST['update'])) {
 		$id_update_cause=$_POST['id_update_cause'];
 		$designation_cause=mysqli_real_escape_string($base,$_POST['designation_cause']);
		$detail_cause=mysqli_real_escape_string($base,$_POST['detail_cause']);
		$rqt="UPDATE tcause SET designation_cause='".$designation_cause."',detail_cause='".$detail_cause."' WHERE id_cause=$id_update_cause";
		mysqli_query($base,$rqt) or die($mysql->error());
		$_SESSION['message']="modification réussie";
		$_SESSION['msg_type']="warning";
		header('location:./cause.php');
 	}



 ?>