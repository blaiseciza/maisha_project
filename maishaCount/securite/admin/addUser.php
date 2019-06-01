<?php
	include('connexion.php');
?>
<?php
	// test des variables de session 
	//if(isset($_SESSION['connecter']) && $_SESSION['connecter']==true){
?>
<html>
<head>
<title>Ajout d'un utilisateur</title>
<meta charset="UTF-8">
</head>
<body>
<h1>Ajout d'un utilisateur</h1>
<a href="admin.php">Retour a la zone admin</a>

<hr>

<!-- Formulaire d'insertion des utilisateurs-->
<form method="POST" action="userttt.php" enctype="multipart/form-data">
<table>
<tr>
<td>Nom d'utilisateur :</td>
<td><input type="text" name="username"></td>
</tr><tr>
<td>Mot de passe :</td>
<td><input type="password" name="passuser"></td>
</tr>
<tr>
<td>Privileges:</td>
<td><select name="acces">
<option value="SA">SA</option>
<option value="Adm">Admin</option>
<option value="guest">User</option>
</select>
</td>
</tr>
<tr>
<td>Photo de profil:</td>
<td><input type="file" name="photoprofil"></td>
</tr>
<tr>
<td>1+1:</td>
<td><input type="text" name="captcha"></td>
</tr>
<tr>
<td></td>
<td>
<input type="submit" name="addUser" value="Enregistrer">
<input type="reset" name="" value="Annuler" style="background:red;">

</td>
</tr>
</table>
</form>


</body>
</html>
<?php
//}
//else
	//header('location:./index.php');
?>