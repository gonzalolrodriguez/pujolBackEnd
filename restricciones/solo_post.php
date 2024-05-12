<?php
    require_once($_SERVER['DOCUMENT_ROOT'].'/BACKEND'.'/clases/conexion/respuestas_http.php');

    if($_SERVER['REQUEST_METHOD'] != "POST"){
        RespuestasHttp::error_405();
        die();
    }
    
    require_once($_SERVER['DOCUMENT_ROOT'].'/BACKEND'.'/utiles/obtener_post.php');