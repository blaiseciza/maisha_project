<?php
	include('connexion.php');
?>
<?php
	if(!empty($_POST['username']) OR !empty($_POST['motpasse']))
	{
		$username=$_POST['username'];
		$password = $_POST['motpasse'];
		$passwordhash =md5($password);
		
		$rqt='SELECT * FROM tbl_user WHERE username = "'.$username.'" AND passuser = "'.$passwordhash.'"';
		$rqt2=mysqli_query($base,$rqt) OR die(mysql_error());
		if(mysqli_num_rows($rqt2)==1){
			$data=mysqli_fetch_assoc($rqt2);
			//creation des variables de session pour tester si l'utilisateur est connecte
			$_SESSION['connecter']=true;
			$_SESSION['nom']=$data['username'];
			$_SESSION['Id']=$data['id'];
			$_SESSION['jour'] = date('d');
			$_SESSION['mois'] = date('m');
			$_SESSION['annee'] = date('Y');
			$_SESSION['heure'] = date('H');
			$_SESSION['minute'] = date('i');
			$test_data=$data['photouser'];
			if($test_data==""){
				$_SESSION['photo']="assets/img/find_user.png";
					}
			else{
				$_SESSION['photo']="./avatar/$test_data";
			}
			
			header('location:./admin.php');
		}else
			echo 'verifier vos coordonnees de connexion';
	}
	else 
		echo 'Mettez vos logins';
?>