<?php require 'process_user.php'; ?>
<?php
    // test des variables de session 
    if(isset($_SESSION['connecter']) && $_SESSION['connecter']==true){
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin :Maisha_Count</title>
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
</head>
<body>


<!-- <?php
    include('connexion.php');
?>
 -->

<!-- print messages -->
<?php if(isset($_SESSION['message'])):?>
        <div class="alert alert-<?php=$_SESSION['msg_type']?>">
        <?php 
            echo $_SESSION['message'];
            unset($_SESSION['message']);
         ?>
         </div>
     <?php  endif ?>

    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="">MaishaCount</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> Last access : <?php echo $_SESSION['jour']."/".$_SESSION['mois']."/".$_SESSION['annee']." ".$_SESSION['heure']." : ".$_SESSION['minute'];
?> &nbsp; <a href="deconnexion.php" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                <li class="text-center">
                    <img src="<?php echo $_SESSION['photo']?>" class="user-image img-responsive"/>
                    </li>
                
                    
                    <li>
                        <a class="active-menu"  href="admin.php"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                     <li>
                        <a  href="identite.php"><i class="fa fa-desktop fa-3x"></i>Identification</a>
                    </li>
                    <li>
                        <a  href="naissance.php"><i class="fa fa-hospital-o fa-3x"></i>Naissances</a>
                    </li>
                           <li  >
                        <a   href="deces.php"><i class="fa fa-ambulance fa-3x"></i>Décès</a>
                    </li>   
                      <li  >
                        <a  href="utilisateur.php"><i class="fa fa-user fa-3x"></i>Utilisateurs</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-print fa-3x"></i> Rapports<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="rptnaissance.php">Les naissances</a>
                            </li>
                            <li>
                                <a href="rptdeces.php">Les décès</a>
                            </li>
                            
                        </ul>
                      </li>                 
                    
                                       
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"></i> Paramètres<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="hopital.php">Les hôpitaux</a>
                            </li>
                            <li>
                                <a href="cause.php">Les causes des maladies</a>
                            </li>
                            
                        </ul>
                      </li>  
                  <li  >
                        <a  href="blank.html"><i class="fa fa-square-o fa-3x"></i> Blank Page</a>
                    </li>   
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Utilisateurs</h2>   
                        <h5>Utilisateur en cours: <strong><?php echo $_SESSION['nom']?></strong> </h5>
                       
                    </div>
                </div>


               <div class="row">
                <div class="col-md-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Form Utlisateur
                        </div>
                    <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <form role="form" action="process_user.php" method="POST" >
                                    <input type="hidden" name="id_update" value="<?php echo $id_update; ?>">
                                        <div class="form-group">
                                            <input class="form-control" name="username" value="<?php echo $username1; ?>" placeholder="Entrer le nom d'utilisateur" />
                                        </div>
                                        <div class="form-group">
                                            <input class="form-control" type="Password" name="passuser" value="<?php echo $passuser; ?>" placeholder="Entrer le Password" />
                                        </div>
                                        <label>Privilege</label>
                                        <div class="form-group"> 
                                            <select class="form-control" name="privilegeuser">
                                                <option value="<?php echo $privilegeuser; ?>" selected><?php echo $privilegeuser; ?></option>
                                                <option value="SA">SA</option>
                                                <option value="Adm">Admin</option>
                                                <option value="User">User</option>
                                                <option value="Doct">Doct</option>
                                            </select>
                                        </div>
                                        <!-- <label>Photo de profil</label>
                                        
                                            <input type="file" name="photoprofil" id="" ="photoprofil"/> -->
                                        
                                        <!-- <div class="form-group">
                                            <input class="form-control" name="captcha" placeholder="1+1=?" />
                                        </div> -->
                                        <!-- manage update and delete -->
                                    <?php 
                                    if($update==true):
                                     ?>
                                 <button type="submit" name="update" class="btn btn-info">Update</button>
                             <?php else: ?>
                                        <button type="submit" name="submit" class="btn btn-default">Valider</button>
                            <?php endif ?>
                                        <button type="reset" class="btn btn-primary">Annuler</button>

                                    </form>
                                    <br />
                                      
                                </div>
                            </div>
                        </div>
                    </div>
                     <!-- End Form Elements -->
                </div>
            </div>
<?php 
        $rq="SELECT * FROM tbl_user";
        $result=mysqli_query($base,$rq) OR die(mysql_error());

 ?>


                 <!-- /. ROW  -->
                 <hr />
               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Table user
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Username</th>
                                            <th>Password</th>
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
                                            <td><?php echo $row['passuser']; ?></td>
                                            <td><?php echo $row['privilegeuser']; ?></td>    
                                            <td>
                                                <a href="utilisateur.php?edit=<?php echo $row['id'] ;?>" class="btn btn-info">Edit</a>
                                                <a href="process_user.php?delete= <?php echo $row['id']; ?>" class="btn btn-danger">Delete</a>
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
                <!-- /. ROW  -->
                <!-- /. ROW  -->
                <!-- /. ROW  -->
            
                <!-- /. ROW  -->
        </div>
               
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- DATA TABLE SCRIPTS -->
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
         <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
</body>
</html>
<?php
}else
    header('location:./index.php');
?>