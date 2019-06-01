<?php
//call chaine de connexion
include('connexion.php');
?>

<?php
// ttt du formulaire
if(isset($_POST['addUser'])){
	if(!empty($_POST['username']) OR (!empty($_FILES['photoprofil']['name'])) OR (!empty($_POST['passuser']))){
	// declarations des variables 
	$username=$_POST['username'];
	$passuser=$_POST['passuser'];
	$privilegeuser=$_POST['acces'];
	$captcha=$_POST['captcha'];
	if($captcha==2){

	
	//-->%Script d'upload du fichier
	$dir = './avatar/';
					$ext = strtolower( pathinfo($_FILES['photoprofil']['name'], PATHINFO_EXTENSION) );
					$file=uniqid().'.'.$ext;


							$taille_maxi = 9000000;
							$taille = filesize($_FILES['photoprofil']['tmp_name']);
							$extensions = array('.jpg','.gif.','.png');
							$extension = strrchr($_FILES['photoprofil']['name'], '.');
							//D�but des v�rifications de securite...
							if (in_array($extension, $extensions)) { //Si l'extension n'est pas dans le tableau
								if (@move_uploaded_file($_FILES['photoprofil']['tmp_name'], $target_path)) {
									$result = 1;
								}

					  //**** on bouge l'image
					move_uploaded_file($_FILES['photoprofil']['tmp_name'], $dir.$file);

					$photo = $file;
	//-->fin partie upload fichier
	//requete sql pour inserer les donnees
	$sql="INSERT INTO tbl_user(username,passuser,privilegeuser,photouser,dateuser) 
	VALUES('".$username."','".md5($passuser)."','".$privilegeuser."','".$photo."','".time()."')";
	mysqli_query($base,$sql) or die(mysql_error());
	echo "L'utilisateur <b>$username</b> a été bien enregistré";
	echo '<br/><a href="./admin.php">Retour</a>';
	header('location:./admin.php');
	//mysqli_close();
	}else
	echo"Le fichier selectionner pour la photo du produit n'est pas supporter";
	}else
	echo"Test incorect";
	}else
	echo"Mettez le nom du produit et sa photo svp";
}else
echo"Operation incorrecte";
?>