<?php

define('ENV', "test");

class DataBase 
{

    private static $instance = null;

    public static function getPdo()
    {
        if (self::$instance === null){
            self::$instance = new PDO('mysql:host=localhost; dbname=donkeyair', 'root', '', 
            [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
        };
        return self::$instance;
    }

    // private $db_name;
    // private $db_user;
    // private $db_pass;
    // private $db_host;
    // private $pdo;

    // public function __construct($db_name = 'donkeyair', $db_user = 'root', $db_pass = '', $db_host = 'localhost' )
    // {
    //     $this->db_name = $db_name;
    //     $this->db_user = $db_user;
    //     $this->db_pass = $db_pass;
    //     $this->db_host = $db_host;

    // }
    
    // private function getPDO(){
    //     if($this->pdo === null){
    //         $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //         $this->pdo = $pdo;
    //     }

        
    //     //TRY / CATCH Copié; voIR SI CA FONCTIONNE
    //     try {
    //         $pdo = new PDO('mysql:host=localhost; dbname=PokemonCrud', 'root', '');
    //     }
    //     catch (PDOException $pe){
    //         if(ENV === 'test'){
    //             echo $pe->getMessage();
    //         } else {
    //             header('error.php');
    //         }
    //     }

    //     return $pdo;
    // }

    // public function query($statement){
    //     $requete = $this->getPDO()->query($statement);
    //     $datas = $requete ->fetchAll(PDO::FETCH_ASSOC);
    //     return $datas;

    // }

    // public function prepare($query) {
    //     return $this->pdo->prepare($query);
    // }




}