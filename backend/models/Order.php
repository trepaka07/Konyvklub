<?php

namespace Konyvklub;

class Order
{
    public $orderID;
    public $email;
    public $date;
    public $state;
    public $books;

    function __construct($input = "", $books = [])
    {
        if (gettype($input) == "string") {
            $this->init_by_user($input, $books);
        } else {
            $this->init_by_dbresult($input);
        }
    }

    private function init_by_dbresult($result)
    {
        foreach ($result as $key => $value) {
            $this->$key = $result->$key;
        }
    }

    private function init_by_user($email, $books)
    {
        $email_user = strtoupper(explode("@", $email)[0]);
        $this->orderID = "$email_user-" . date("YmdHis");
        $this->email = $email;
        $this->date = date("Y-m-d H:i");
        $this->state = "Feldolgozás alatt";
        $this->books = $books;
    }
}
