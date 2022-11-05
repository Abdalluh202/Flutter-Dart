<?PHP
error_reporting(1);
include("../connect.php");
	
    $sql="DELETE FROM `users`";
  $requl=$con->query($sql);
if(empty( $requl))
echo "Erorr";
?>