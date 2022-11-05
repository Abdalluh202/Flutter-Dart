
<?php
error_reporting(1);
include("../connect.php");
	
	$Namee = $_POST['name'];
	$Email = $_POST['email'];

	if(empty($Namee) ||empty($Email)){
		print(json_decode("null"));
	}else{
	
	$r=$con->query("INSERT INTO users 
    (Name,Email) VALUES ('".$Namee."','".$Email."')");
print(json_decode("done"));
  }

?>