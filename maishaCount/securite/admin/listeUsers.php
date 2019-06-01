<?php
include('connexion.php');
?>
<!--
<style type="text/css">
table{
width:100%;
border:1px solid gray;
}
tr:first-child{
background:black;
color:white;
}
tr:nth-child(even){
background:rgba(150,150,250,0.6);
}
tr:not(:first-child):hover{background:rgba(250,250,0,0.6);
tr{
-webkit-transition-duration:0.5s;
}
</style>
-->
<a href="./admin.php">Retour</a><br/>

	<?php
	$sql='SELECT * from user';
	$req=mysql_query($sql) or die(mysql_error());
	$i=0;
	while($data=mysql_fetch_array($req)){
	$i++;
	?>
	<script type="text/javascript">
	function deleteProduit<?php echo $data['CodProduit']?>(){
	if(confirm('Voulez-vous vraiment supprimer ce produit ?')){
	window.location='./deleteProduit.php?id=<?php echo $data['CodProduit']?>';
	}}
	</script>
	<?php
	echo'
	<table>
	<tr>
		<td>ID</td><td>'.$i.'</td>
		</tr>
		<tr><td>User Name</td>
		<td>'.$data['username'].'</td>
		</tr>
		</tr>
		<tr><td>Privilege</td>
		<td>'.$data['privilegeuser'].'</td>
		</tr>
		</tr>
		<tr><td>Photo</td>
		<td><img src="./avatar/'.$data['photouser'].'" style="width:100px;height:100px;"></td>
		</tr>
		<tr><td>Date d\'Inscription</td>
		<td>'.date("d/m/Y à h:m:s",$data['dateuser']).'</td>
		</tr>
		</table>
		';
	}if(mysql_num_rows($req)==0){
	echo'<tr><td colspan="4"><font color= "red">Aucun User</font></td></tr>';
	}
	
	?>
</table>
