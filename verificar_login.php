<?php 
if($_SERVER['REQUEST_METHOD'] == "OPTIONS"){
    exit();
}

require_once ($_SERVER['DOCUMENT_ROOT'].'/BACKEND'.'/restricciones/solo_post.php'); //El obtener post está integrado a solo_post
require_once ($_SERVER['DOCUMENT_ROOT'].'/BACKEND'.'/clases/conexion/conexion.php');
//require_once ($_SERVER['DOCUMENT_ROOT'].'/BACKEND'.'/clases/autenticacion/login.php');
require_once ($_SERVER['DOCUMENT_ROOT'].'/BACKEND'.'/clases/conexion/respuestas_http.php');
require_once ($_SERVER['DOCUMENT_ROOT'].'/BACKEND'.'/clases/base_de_datos/usuario.php');

header('Content-Type: application/json');
header("Access-Control-Expose-Headers: Content-Type, Authorization, X-Custom-Header");

if( !isset($_POST["password"]) || ( !isset($_POST["username"]) && !isset($_POST["email"]) ) ){
    RespuestasHttp::error_400();
}

$password = $_POST["password"];
$email = isset($_POST["email"]) ? $_POST["email"] : NULL;
$username = isset($_POST["username"]) ? $_POST["username"] : NULL;

$usuario = new Usuario($username, $email, $password);
$usuario -> iniciar_sesion();

echo json_encode($usuario -> to_array());
?>