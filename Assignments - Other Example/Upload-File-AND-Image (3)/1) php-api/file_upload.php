<?php

// https://codehafeez.com/flutter_api/file_upload.php

$request_body = $_POST;
if(isset($_FILES["fileToUpload"])) {
    $target_dir = "./files_upload/";
    $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
    move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file);
}

exit;

?>