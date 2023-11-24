<?php
include 'connection_db.php';
header('Content-Type: application/json');
$json = file_get_contents('php://input');
$obj = json_decode($json,true);


  	if(isset($obj["id"]) && isset($obj["name"]) && isset($obj["phone"]) && isset($obj["email"]) && isset($obj["age"])){

		$id     = $obj['id'];
		$name   = $obj['name'];
		$phone  = $obj['phone'];
		$email  = $obj['email'];
		$age    = $obj['age'];
	  	$result = [];

		$sql = "UPDATE persons SET name='$name', phone='$phone', email='$email', age='$age' WHERE id='$id'";
		$query = mysqli_query($db,$sql);
		if ($query) { $result['message']="Successfully Update Data"; }
		else { $result['message']="Error Update Data"; }

		echo json_encode($result);
  	}

?>