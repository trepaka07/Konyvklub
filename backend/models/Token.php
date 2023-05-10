<?php

namespace Konyvklub;

class Token
{
    public $email;
    public $token;
    public $expire;

    public function init($email, $token = "")
    {
        $this->email = $email;
        $this->expire = date("Y-m-d");
        if ($token != "") {
            $this->token = $token;
        } else {
            $this->create_token();
        }
    }

    private function create_token()
    {
        $prefix = explode("@", $this->email)[0];
        $this->token = $prefix . "_" . get_random_string();
    }
}
