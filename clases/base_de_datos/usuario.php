<?php
    require_once($_SERVER['DOCUMENT_ROOT'].'/BACKEND'."/clases/conexion/conexion.php");
    require_once($_SERVER['DOCUMENT_ROOT'].'/BACKEND'."/clases/conexion/respuestas_http.php");
    require_once($_SERVER['DOCUMENT_ROOT'].'/BACKEND'."/clases/base_de_datos/rol.php");
    require_once($_SERVER['DOCUMENT_ROOT'].'/BACKEND'."/clases/autenticacion/token.php");
    
    class Usuario {
        private $id_usuario;
        private $username;
        private $email;
        private $password; //se oculta
        private $nombre;
        private $apellido;
        private $palabra_secreta;//se oculta
        private $habilitado;
        private $roles;

        public function __construct($username, $email, $password) {
            $this -> username = $username;
            $this -> email = $email;
            $this -> password = $password; 
        }

        public function iniciar_sesion(){
            $stmt =  Conexion::prepararQuery("SELECT * FROM usuarios WHERE (username = ? OR email = ?) AND password = ?");
            $stmt->bind_param('sss', $this -> username, $this -> email, $this -> password);
            $resultado = Conexion::ejecutarQueryPreparada($stmt); //Resultado es un array de filas
            
            if (count($resultado) > 0) {
                $primerResultado = $resultado[0];
                $this -> id_usuario = $primerResultado["id_usuario"];
                $this -> username = $primerResultado["username"];
                $this -> email = $primerResultado["email"];
                $this -> password = $primerResultado["password"];
                $this -> nombre = $primerResultado["nombre"];
                $this -> apellido = $primerResultado["apellido"];
                $this -> palabra_secreta = $primerResultado["palabra_secreta"];
                $this -> habilitado = $primerResultado["habilitado"];
                $this -> roles = Rol::obtener_roles_usuario($primerResultado["id_usuario"]);
                Token::crear_token($primerResultado["id_usuario"]);
            } else {
                RespuestasHttp::error_404();
            }
        }

        public function to_array(){
            return [
                'id_usuario' => $this -> id_usuario,
                'username' => $this->username,
                'email' => $this->email,
                'nombre' => $this->nombre,
                'apellido' => $this->apellido,
                'habilitado' => $this->habilitado,
                'roles' => $this->roles
            ];
        }

        public function inicializar_desde_array_asociativo($registro_fila){
            $this -> id_usuario = $registro_fila["id_usuario"];
            $this -> username = $registro_fila["username"];
            $this -> email = $registro_fila["email"];
            $this -> password = $registro_fila["password"];
            $this -> nombre = $registro_fila["nombre"];
            $this -> apellido = $registro_fila["apellido"];
            $this -> palabra_secreta = $registro_fila["palabra_secreta"];
            $this -> habilitado = $registro_fila["habilitado"];
            $this -> roles = Rol::obtener_roles_usuario($registro_fila["id_usuario"]);
        }

        public static function recuperar_usuario_por_id($id_usuario){
            $resultado = Conexion::obtener_datos("SELECT * FROM usuarios WHERE id_usuario='$id_usuario'");
            if(count($resultado) > 0){
                $usuario = new Usuario(null, null, null);
                $usuario -> inicializar_desde_array_asociativo($resultado[0]);
                return $usuario;
            } else return null;            
        }
    }