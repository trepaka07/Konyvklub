<?php

namespace Konyvklub;

use PDO;
use PDOException;

class DbConnection
{
    private $connection;

    function __construct()
    {
        try {
            $env = new EnvReader();
            $attributes = array(
                PDO::ATTR_TIMEOUT => 5,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
            );
            // $this->connection = new PDO("mysql:host=localhost;dbname=konyvklub", "root", "", $attributes);
            $this->connection = new PDO("mysql:host=$env->host;dbname=$env->database", "$env->user", "$env->password", $attributes);
        } catch (PDOException $e) {
            die("Az adatbázis nem elérhető!");
        }
    }

    function query($sql)
    {
        return $this->connection->query($sql);
    }
}
