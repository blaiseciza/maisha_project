<?php
	include('connexion.php');

      	 $id_update=0;
        $update=false;
		$username1='';
		$passuser='';
		$privilegeuser='';
	if (isset($_POST['submit'])) {
		$username1=$_POST['username'];
		$passuser=$_POST['passuser'];
		$privilegeuser=$_POST['privilegeuser'];
	$rqt_insert="INSERT INTO tbl_user (username,passuser,privilegeuser) VALUES ('".$username1."','".md5($passuser)."','".$privilegeuser."')";
	mysqli_query($base,$rqt_insert) or die("Erreur d'insertion");
	$_SESSION['message']="Enregistré avec succès";
		$_SESSION['msg_type']="success";
  header('location:./utilisateur.php');
	//mysqli_close();
}

 //delete and update operation
 	if (isset($_GET['delete'])) {
 		$id=$_GET['delete'];
 		$rqt_del="DELETE FROM tbl_user WHERE id=$id";
		mysqli_query($base,$rqt_del) or die("Error");
		$_SESSION['message']="suppréssion réussie";
		$_SESSION['msg_type']="danger";
  header('location:./utilisateur.php');

 	}

 	if (isset($_GET['edit'])) {
 		$id=$_GET['edit'];
 		$update=true;
 		$rqt_sel="SELECT * FROM tbl_user WHERE id=$id";
        $result=mysqli_query($base,$rqt_sel) OR die(mysql_error());
        if(count($result)==1){
        $row=mysqli_fetch_array($result);
        $id_update=$row['id'];
        $username1=$row['username'];
		$passuser=$row['passuser'];
		$privilegeuser=$row['privilegeuser'];
		//$photouser=$_POST['photouser'];
        }
 	}
 	if (isset($_POST['update'])) {
 		$id_update=$_POST['id_update'];
 		$username1=$_POST['username'];
		$passuser=$_POST['passuser'];
		$privilegeuser=$_POST['privilegeuser'];
		$photouser=$_POST['photouser'];
		$rqt="UPDATE tbl_user SET username='".$username1."',
		privilegeuser='".$privilegeuser."' WHERE id=$id_update";
		mysqli_query($base,$rqt) or die($mysql->error());
		$_SESSION['message']="modification réussie";
		$_SESSION['msg_type']="warning";
		header('location:./utilisateur.php');
 	}



 ?>
