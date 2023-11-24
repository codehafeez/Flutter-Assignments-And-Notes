<?php
include 'connection_db.php';

header('Content-Type: application/json');
$json = file_get_contents('php://input');
$obj = json_decode($json,true);


  	if(isset($obj["name"]) && isset($obj["phone"]) && isset($obj["email"]) && isset($obj["age"])){

		$name   = $obj['name'];
		$phone  = $obj['phone'];
		$email  = $obj['email'];
		$age    = $obj['age'];
	  	$result = [];

		$sql = "INSERT INTO persons(name, phone, email, age)VALUES('$name', '$phone', '$email', '$age')";
		$query = mysqli_query($db,$sql);
		if ($query) { $result['message']="Successfully Add Data"; }
		else { $result['message']="Error Add Data"; }

		echo json_encode($result);
  	}

?>