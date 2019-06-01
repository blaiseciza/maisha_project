<?php
	include('conn.php');

		$id_cons_com=$_POST['id_cons_com'];
		
		$rqt='SELECT * FROM voir_commentaires WHERE id_cons_com = "'.$id_cons_com.'" ORDER BY id_com DESC';
		$rqt2=mysqli_query($connect,$rqt) OR die(mysql_error());

		$result=array();
		while($fetchData=$rqt2->fetch_assoc()){
			$result[]=$fetchData;
		}
		echo json_encode($result);

?>