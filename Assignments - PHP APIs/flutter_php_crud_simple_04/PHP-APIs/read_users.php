<?php
include 'connection_db.php';
header('Content-Type: application/json');

    $sql = $db->query("select * from persons");
    $res =array();
    while($row=$sql->fetch_assoc()) {
        $res[] = $row;
    }

    echo json_encode($res);

?>