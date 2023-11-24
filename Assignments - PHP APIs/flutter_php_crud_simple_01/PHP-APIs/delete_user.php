<?php
include 'connection_db.php';

header('Content-Type: application/json');
$json = file_get_contents('php://input');
$obj = json_decode($json,true);


    if(isset($obj["id"])){

        $id = $obj['id'];
        $result = [];

        $sql = "DELETE FROM persons WHERE id='$id'";
        $query = mysqli_query($db,$sql);
        if ($query) { $result['message']="Successfully Delete Data"; }
        else { $result['message']="Error Delete Data"; }

        echo json_encode($result);
    }

?>