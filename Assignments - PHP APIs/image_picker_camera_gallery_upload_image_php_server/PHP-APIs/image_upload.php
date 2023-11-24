<?php 
header('Content-Type: application/json');

  $return["message"] = 'Error Upload Image';
  $image = $_FILES['image']['name'];
  $imagePath = 'uploads/'.$image;
  $tmp_name = $_FILES['image']['tmp_name'];
  if(move_uploaded_file($tmp_name, $imagePath)){
    $return["image_name"] = $image;  
    $return["message"] = "success";  
  };

  echo json_encode($return);



