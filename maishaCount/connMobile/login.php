<?php
	include('conn.php');

		$username=$_POST['username'];
		$password = $_POST['motpasse'];
		$passwordhash =md5($password);
		
		$rqt='SELECT * FROM tbl_user WHERE username = "'.$username.'" AND passuser = "'.$passwordhash.'"';
		$rqt2=mysqli_query($connect,$rqt) OR die(mysql_error());

		$result=array();
		while($fetchData=$rqt2->fetch_assoc()){
			$result[]=$fetchData;
		}
		echo json_encode($result);

?>

