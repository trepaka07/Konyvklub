<?php

namespace Konyvklub;

use PDO;

class AdminHandler extends DbConnection implements IDbHandler
{
    function select(string $username)
    {
        $sql = "SELECT * FROM admins WHERE username LIKE '$username';";
        return $this->query($sql)->fetchObject();
    }

    function select_ordered($order_field = "username", $order_type = "ASC")
    {
        $sql = "SELECT * FROM admins ORDER BY $order_field $order_type;";
        return $this->query($sql)->fetchAll(PDO::FETCH_CLASS, "Konyvklub\Admin");
    }

    function select_contains($search, $order_field, $order_type)
    {
    }

    function insert($username, $hash = "")
    {
        $sql = "INSERT INTO admins VALUES ('$username', '$hash');";
        return $this->query($sql);
    }

    function update($object)
    {
    }

    function delete($username)
    {
        $sql = "DELETE FROM admins WHERE username LIKE '$username';";
        return $this->query($sql);
    }
}
