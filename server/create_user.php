<?php
  require('./conector.php');

  $con = new ConectorBD(); 

  $response['conexion']=$con->initConexion($con->database); 

  if ($response['conexion']=='OK') { 

  	$conexion = $con->getConexion(); 
  	$insert = $conexion->prepare('INSERT INTO usuarios (email, nombre, password, fecha_nacimiento) VALUES (?,?,?,?)'); 
    $insert->bind_param("ssss", $email, $nombre, $password, $fecha_nacimiento); 

    $defaultPassword = '123456';
    $email = "usuario@xmail.com";
	  $nombre = "Usuario agenda";
    $password = password_hash($defaultPassword, PASSWORD_DEFAULT);
    $fecha_nacimiento = "1978-12-10";
    $insert->execute();

    $email = "marisol@xmail.com";
	  $nombre = "Marisol Gerónimo";
    $password = password_hash($defaultPassword, PASSWORD_DEFAULT); 
    $fecha_nacimiento = "1978-12-10";
    $insert->execute();

    $email = "luis@xmail.com";
	  $nombre = "Luis Aquino";
    $password = password_hash($defaultPassword, PASSWORD_DEFAULT);
    $fecha_nacimiento = "1978-10-27";

    $insert->execute();
    $response['resultado']="1"; 
    $response['msg']= 'Credenciales para inicio de sesion:</br> email:'; 
      $getUsers = $con->consultar(['usuarios'], ['*'], $condicion = ""); 
      while ($fila = $getUsers->fetch_assoc()){
        $response['msg'].= $fila['email'] . "</br>";
      }
      $response['msg'] .='</br>contraseña: '.$defaultPassword; 
  }else{
    $response['resultado']="0"; 
    $response['msg']= "No se pudo conectar a la base de datos"; 
  }
  echo json_encode($response);

?>
