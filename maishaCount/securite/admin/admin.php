<?php
	include('connexion.php');
?>
<?php
	// test des variables de session 
	if(isset($_SESSION['connecter']) && $_SESSION['connecter']==true){
?>
<html>
<head>
<title>Bienvenue .... dans la zone d'administration</title>
<meta charset="UTF-8">
</head>
<body>
<h1>Zone d'administration : <?php echo $_SESSION['nom']?></h1>
<a href="addUser.php">Ajouter un utilisateur</a>
<a href="listeUsers.php">Voir les UtilisateurS</a>
<a href="listeUsers.php">Modifie les UtilisateurS</a>
<a href="deconnexion.php">Deconnexion</a>

</body>
</html>
<?php
}else
	header('location:./index.php');
?>