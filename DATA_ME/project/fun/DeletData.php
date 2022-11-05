<?php

error_reporting(1);
include("../connect.php");

$ID=$_POST['ID'];

$sqlll="DELETE FROM `users` WHERE `ID`= $ID ";

$RESOULT=$con->query($sqlll);

if($RESOULT){
    echo(json_decode('Delet_is_Done'));
}
?>