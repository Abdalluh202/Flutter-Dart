<?php

//error_reporting(0);
include("../connect.php");
	$id=$_POST['ID'];
	$Namee = $_POST['name'];
	$Email = $_POST['email'];

	if(empty($Namee) && empty($Email)){
		echo json_decode("null");
	}
	else if(!empty($Namee)){
		$sqQL="UPDATE `users` SET `name`='$Namee 'WHERE `ID`= $id";
	}
	else if(!empty($Email)){$sqQL="UPDATE `users` SET `email`='$Email'WHERE `ID`= $id";}
	else{
		$sqQL="UPDATE `users` SET `name`='$Namee ',`email`='$Email'WHERE `ID`= $id";
	}
$RESOULT= $con -> query($sqQL);
 //echo "ksddffdRTsjl";
if($RESOULT){
    echo(json_encode('Update is DONE')) ;
}else
echo "erorr;"
    ?>
