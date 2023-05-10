<?php

namespace Konyvklub;

class CartItem
{
    public $email;
    public $isbn;
    public $quantity;

    function __construct($email = "", $isbn = "", $quantity = "")
    {
        $this->email = $email;
        $this->isbn = $isbn;
        $this->quantity = $quantity;
    }
}
