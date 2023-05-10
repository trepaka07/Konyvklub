<?php

namespace Konyvklub;

class TokenHandler extends DbConnection implements IDbHandler
{
    function select(string $email, $token = "")
    {
        $today = date("Y-m-d");
        $sql = "SELECT * FROM tokens WHERE email LIKE '$email' AND token LIKE '$token' AND expire >= '$today';";
        return $this->query($sql)->fetchObject("Konyvklub\Token");
    }

    function select_ordered($order_field, $order_type)
    {
    }

    function select_contains($search, $order_field, $order_type)
    {
    }

    function insert($token)
    {
        $sql = "INSERT INTO tokens VALUES ('$token->token', '$token->email', '$token->expire');";
        return $this->query($sql);
    }

    function update($object)
    {
    }

    function delete($token, $email = "")
    {
        $today = date("Y-m-d");
        $sql = "DELETE FROM tokens WHERE expire < '$today'; DELETE FROM tokens WHERE token LIKE '$token' AND email LIKE '$email';";
        return $this->query($sql);
    }

    function delete_by_email($email)
    {
        $sql = "DELETE FROM tokens WHERE email LIKE '$email';";
        return $this->query($sql);
    }
}
