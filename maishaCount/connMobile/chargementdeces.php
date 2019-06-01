<?php
	include('conn.php');

		if( is_null($_POST['date1']) or is_null($_POST['date2'])){
			$date1='1900-01-01';
			$date2='2099-01-01';
		}else{
			$date1=$_POST['date1'];
		$date2=$_POST['date2'];
		}
		
		
		$rqt='select count(tdeces.id_dec) AS nbre_tot from tdeces where tdeces.date_dec BETWEEN "'.$date1.'" AND "'.$date2.'"';
		$rqt2=mysqli_query($connect,$rqt) OR die(mysql_error());

		$result=array();
		while($fetchData=$rqt2->fetch_assoc()){
			$result[]=$fetchData;
		}
		echo json_encode($result);

?>