<?php

namespace Konyvklub;

class User
{
    public $lastname;
    public $firstname;
    public $address;
    public $email;
    public $phone;
    public $pwd;

    /**
     * Beállítja a User adatait a paraméterként kapott értékek alapján
     */
    public function init_by_input($lastname, $firstname, $zipcode, $city, $address, $email, $phone, $pwd)
    {
        $this->lastname = $lastname;
        $this->firstname = $firstname;
        $this->address = "$zipcode $city, $address";
        $this->email = $email;
        $this->phone = "06$phone";

        $encryption = new Encryption();
        $this->pwd = $encryption->encrypt($pwd);
    }

    public function init_by_API($email, $lastname, $firstname, $address, $phone, $pwd)
    {
        $this->email = $email;
        $this->lastname = $lastname;
        $this->firstname = $firstname;
        $this->address = $address;
        $this->phone = $phone;
        $this->pwd = $pwd;
    }

    /**
     * Beállítja a User adatait egy adatbázisból kapott objektum alapján
     */
    public function init_by_dbresult($result)
    {
        foreach ($this as $key => $value) {
            $this->$key = $result->$key;
        }
    }

    public function get_fullname()
    {
        return "$this->lastname $this->firstname";
    }
}
