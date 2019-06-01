<?php
//class Constants{
	//DATABASE DETAIL

	//STATEMENTS
	//static $SQL_SELECT_ALL="SELECT * FROM tconseil";

//}
include('conn.php');
		
		$rqt='SELECT * FROM voir_conseils';
		$rqt2=mysqli_query($connect,$rqt) OR die(mysql_error());

		$result=array();
		while($fetchData=$rqt2->fetch_assoc()){
			$result[]=$fetchData;
		}
		echo json_encode($result);






?>