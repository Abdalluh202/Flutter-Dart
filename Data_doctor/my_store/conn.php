<?php

$connect = new mysqli("localhost","root","","my_store");

if($connect){
	 //echo "is good";
}else{
	echo "Connection Failed";
	exit();
}