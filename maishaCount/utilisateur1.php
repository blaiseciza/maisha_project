<?php
	include('connexion.php');
?>
<?php
	// test des variables de session 
	//if(isset($_SESSION['connecter']) && $_SESSION['connecter']==true){
?>
<html>
<head>
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin :Ajout user</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
   
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <!-- TABLE STYLES-->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/style.default.css" type="text/css" />
</head>
<body class="loginbody">
<div class="loginwrapper">
<a href="admin.php">Retour a la zone admin</a>

<hr>

<!-- Formulaire d'insertion des utilisateurs-->
<form method="POST" action="userttt.php" enctype="multipart/form-data">
<table>
<tr>
<td>Utilisateur:</td>
<td><input type="text" name="username"></td>
</tr><tr>
<td>Mot de passe:</td>
<td><input type="password" name="passuser"></td>
</tr>
<tr>
<td>Privileges:</td>
<td><select name="acces">
<option value="SA">SA</option>
<option value="Adm">Admin</option>
<option value="User">User</option>
<option value="Doct">Doctor</option>
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
<input type="submit" name="addUser" value="Enregistrer" class="btn btn-info">
<input type="reset" name="" value="Annuler" class="btn btn-danger">

</td>
</tr>
</table>
</form>

</div>
<hr />
               <?php
                $rq="SELECT * FROM tbl_user";
                $result=mysqli_query($base,$rq) OR die(mysql_error());
               ?>
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Les utilisateurs...
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Nom</th>
                                            <th>Privilege</th>
                                            <th colspan="2">ACTIONS</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                    <?php 
                                    while ($row=mysqli_fetch_array($result)):
                                     ?>
                                        <tr class="odd gradeX">
                                            <td><?php echo $row['username']; ?></td>
                                            <td><?php echo $row['privilegeuser']; ?></td>   
                                            <td>
                                                <a href="#?edit=<?php echo $row['id'] ;?>" class="btn btn-info">Edit</a>
                                                <a href="#?delete= <?php echo $row['id']; ?>" class="btn btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                    <?php endwhile; ?>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
</body>
</html>
<?php
//}
//else
	//header('location:./index.php');
?>