<?php
    // Obtener la carga útil JSON
    $jsonPayload = file_get_contents('php://input');

    // Decodificar la carga útil JSON en un array asociativo
    $data = json_decode($jsonPayload, true);
    // Iterar sobre los datos decodificados y agregarlos a $_POST
    // Verificar si la decodificación fue exitosa y $data no es null
    if ($data !== null) {
        foreach ($data as $key => $value) {
            $_POST[$key] = $value;
        }
    }