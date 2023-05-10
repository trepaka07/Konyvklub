<?php

namespace Konyvklub;

use PDO;

class UserHandler extends DbConnection implements IDbHandler
{
    function select($email)
    {
        $sql = "SELECT * FROM users WHERE email LIKE '$email';";
        return $this->query($sql)->fetchObject("Konyvklub\User");
    }

    function select_ordered($field = "email", $order_type = "ASC")
    {
        $sql = "SELECT * FROM users ORDER BY $field $order_type;";
        return $this->query($sql)->fetchAll(PDO::FETCH_CLASS, "Konyvklub\User");
    }

    function select_contains($search, $order_field = "email", $order_type = "ASC")
    {
        $sql = "SELECT * FROM users WHERE email LIKE '%$search%' ORDER BY $order_field $order_type;";
        return $this->query($sql)->fetchAll();
    }

    function insert($user)
    {
        $sql = "INSERT INTO users (email, lastname, firstname, address, phone, pwd) VALUES (
                '$user->email', '$user->lastname', '$user->firstname', '$user->address', '$user->phone', '$user->pwd'
            );";
        return $this->query($sql);
    }

    function update($user)
    {
        $sql = "UPDATE users SET lastname='$user->lastname', firstname='$user->firstname', 
                address='$user->address', phone='$user->phone', pwd='$user->pwd' WHERE email LIKE '$user->email';";
        return $this->query($sql);
    }

    function update_password($email, $hash)
    {
        $sql = "UPDATE users SET pwd='$hash' WHERE email LIKE '$email';";
        return $this->query($sql);
    }

    function delete($email)
    {
        $sql = "DELETE FROM users WHERE email LIKE '$email';";
        return $this->query($sql);
    }
}
