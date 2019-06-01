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
		$rqt2=mysql_query($rqt) OR die(mysql_error());
		if(mysql_num_rows($rqt2)==1){
			$data=mysql_fetch_assoc($rqt2);
			//creation des variables de session pour tester si l'utilisateur est connecte
			$_SESSION['connecter']=true;
			$_SESSION['nom']=$data['username'];
			$_SESSION['Id']=$data['iduser'];
			header('location:./admin.php');
		}else
			echo 'verifier vos coordonnees de connexion';
	}
	else 
		echo 'Mettez vos logins';
?>