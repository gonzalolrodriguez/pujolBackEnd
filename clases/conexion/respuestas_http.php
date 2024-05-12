<?php 

class RespuestasHttp {

    public static $response = [
        'status' => "ok",
        "result" => array()
    ];

    public static function respuesta_200($contenido){
        http_response_code(200);
        self::$response['result'] = $contenido;
        echo json_encode(self::$response);
    }

    public static function error_400() {
        http_response_code(400); //Bad request... 
        self::$response['status'] = "error";
        self::$response['result'] = array(
            "error_id" => "400",
            "error_msg" => "Datos enviados incompletos o con formato incorrecto"
        );
        echo json_encode(self::$response);
        die();
    }
    public static function error_401($valor = "Token inválido o caducado") {
        http_response_code(401);    //No autorizado
        self::$response['status'] = "error";
        self::$response['result'] = array(
            "error_id" => "401",
            "error_msg" => $valor
        );
        echo json_encode(self::$response);
        die();
    }

    public static function error_403() {
        http_response_code(403);    //Prohibido o restringido
        self::$response['status'] = "error";
        self::$response['result'] = array(
            "error_id" => "403",
            "error_msg" => "No tiene los permisos adecuados para realizar esta operación"
        );
        echo json_encode(self::$response);
        die();
    }

    public static function error_404() {
        http_response_code(404);    //No found
        self::$response['status'] = "error";
        self::$response['result'] = array(
            "error_id" => "404",
            "error_msg" => "No encontrado"
        );
        echo json_encode(self::$response);
        die();
    }

    public static function error_405() {
        http_response_code(405);    //Método no permitido - GET, POST, DELETE...
        self::$response['status'] = "error";
        self::$response['result'] = array(
            "error_id" => "405",
            "error_msg" => "Metodo no permitido"
        );
        echo json_encode(self::$response);
        die();
    }  


    public static function error_500($valor = "Error interno del servidor") {
        http_response_code(500);
        self::$response['status'] = "error";
        self::$response['result'] = array(
            "error_id" => "500",
            "error_msg" => $valor
        );
        echo json_encode(self::$response);
        die();
    }
}
