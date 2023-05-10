<?php

namespace Konyvklub;

use PDO;

enum Operation
{
    case Sum;
    case Subtract;
}

class CartHandler extends DbConnection implements IDbHandler
{
    /**
     * SELECT lekérdezés a cart táblából - 1 db rekordot ad vissza
     */
    function select(string $email, $isbn = "")
    {
        $sql = "SELECT * FROM cart WHERE email LIKE '$email' AND isbn LIKE $isbn;";
        return $this->query($sql)->fetchObject();
    }

    /**
     * SELECT lekérdezés a cart táblából - egy rendezett CartItem tömböt ad vissza
     *
     * @return array|false
     */
    function select_ordered($order_field = "isbn", $order_type = "ASC")
    {
        $sql = "SELECT * FROM cart ORDER BY $order_field $order_type;";
        return $this->query($sql)->fetchAll();
    }

    function select_contains($search, $order_field, $order_type)
    {
    }

    /**
     * SELECT lekérdezés a cart táblából email alapján
     *
     * @return array|false
     */
    function select_all_by_email(string $email)
    {
        $sql = "SELECT * FROM cart WHERE email LIKE '$email';";
        return $this->query($sql)->fetchAll();
    }

    function insert($record)
    {
        $sql = "INSERT INTO cart VALUES ('$record->email', $record->isbn, $record->quantity);";
        return $this->query($sql);
    }

    function update($cart_item, $operation = Operation::Sum)
    {
        $op_sign = $operation == Operation::Sum ? "+" : "-";
        $sql = "UPDATE cart SET quantity = quantity $op_sign 1 WHERE email LIKE '$cart_item->email' AND isbn LIKE '$cart_item->isbn';";
        return $this->query($sql);
    }

    function delete($record)
    {
        $sql = "DELETE FROM cart WHERE email LIKE '$record->email' AND isbn LIKE '$record->isbn';";
        return $this->query($sql);
    }

    function delete_by_isbn($isbn)
    {
        $sql = "DELETE FROM cart WHERE isbn LIKE '$isbn';";
        return $this->query($sql);
    }

    function clear($email)
    {
        $sql = "DELETE FROM cart WHERE email LIKE '$email';";
        return $this->query($sql);
    }
}
