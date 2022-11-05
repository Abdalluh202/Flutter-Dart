<?php

include("../connect.php");

$sql= "select * from users";
$res=$con->query($sql);


while($row=$res->fetch_assoc()){
    $data[]=$row;
}

echo json_encode($data);
// echo "<pre>";
// print_r($data)
?>