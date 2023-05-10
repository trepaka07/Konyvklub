<?php

namespace Konyvklub;

class EnvReader
{
    public $host;
    public $user;
    public $password;
    public $database;

    function __construct()
    {
        $env = $this->read_env();
        $this->host = $env["HOST"];
        $this->user = $env["USER"];
        $this->password = $env["PASSWORD"];
        $this->database = $env["DATABASE"];
    }

    private function read_env()
    {
        $file = file_exists(".env") ? file(".env") : file("../.env");
        $array = array();

        foreach ($file as $line) {
            $splitted = explode("=", $line);
            $array[trim($splitted[0])] = trim($splitted[1]);
        }
        return $array;
    }
}
