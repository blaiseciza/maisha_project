<?php require 'process_deces.php'; ?>

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
<body onload="print()">

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
           <!-- /. NAV TOP  --> 
        <!-- /. NAV SIDE  -->
        <!-- /. NAV SIDE  -->
        <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><h2>COMMUNE DE GOMA</h2>
<p>Adresse:Commune Goma/<br>Quartier:Goma/<br>Ville:Goma</p>

 Date-time : <?php echo $_SESSION['jour']."/".$_SESSION['mois']."/".$_SESSION['annee']." ".$_SESSION['heure']." : ".$_SESSION['minute'];
?> </div>
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Les décès enregistrés</h2>
                    </div>
                </div>
                             <!-- /. ROW  -->
                 <hr />
               <?php
                $rq="SELECT * FROM voir_deces";
                $result=mysqli_query($base,$rq) OR die(mysql_error());
               ?>
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Les décès...
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Nom</th>
                                            <th>Postnom</th>
                                            <th>Date décès</th>
                                            <th>Lieu</th>
                                            <th>Age</th>
                                            <th>Causes</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                    <?php 
                                    while ($row=mysqli_fetch_array($result)):
                                     ?>
                                        <tr class="odd gradeX">
                                            <td><?php echo $row['nom_pers']; ?></td>
                                            <td><?php echo $row['postnom_pers']; ?></td> 
                                            <td><?php echo $row['date_dec']; ?></td>
                                            <td><?php echo $row['lieu_dec']; ?></td>  
                                            <td><?php echo $row['age_dec']; ?></td>  
                                            <td><?php echo $row['designation_cause']; ?></td>  
                                            
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