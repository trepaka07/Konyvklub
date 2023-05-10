<?php

namespace Konyvklub;

class OrderHandler extends DbConnection implements IDbHandler
{
    function select($orderID)
    {
        $sql = "SELECT * FROM orders WHERE orderID LIKE '$orderID';";
        return $this->query($sql)->fetchObject("Konyvklub\Order");
    }

    function select_ordered($field = "date", $order_type = "ASC")
    {
        $sql = "SELECT * FROM orders ORDER BY $field $order_type;";
        return $this->query($sql)->fetchAll();
    }

    function select_contains($search, $order_field = "orderID", $order_type = "ASC")
    {
        $sql = "SELECT * FROM orders WHERE orderID LIKE '%$search%' OR email LIKE '%$search%' ORDER BY $order_field $order_type;";
        return $this->query($sql)->fetchAll();
    }

    function select_by_email(string $email)
    {
        $sql = "SELECT * FROM orders WHERE email LIKE '$email';";
        return $this->query($sql)->fetchAll();
    }

    function select_by_isbn(int $isbn)
    {
        $sql = "SELECT * FROM orderedbooks WHERE isbn LIKE $isbn;";
        return $this->query($sql)->fetchAll();
    }

    function select_ordered_books($orderID)
    {
        $sql = "SELECT * FROM orderedbooks WHERE orderID LIKE '$orderID';";
        return $this->query($sql)->fetchAll();
    }

    function insert($order)
    {
        $sql = "INSERT INTO orders (orderID, email, date, state) VALUES (
                '$order->orderID', '$order->email', '$order->date', '$order->state');";
        if (!$this->query($sql) || !$this->insert_ordered_books($order)) return false;
    }

    function update($orderID, $state = "")
    {
        $sql = "UPDATE orders SET state='$state' WHERE orderID LIKE '$orderID';";
        return $this->query($sql);
    }

    private function insert_ordered_books($order)
    {
        foreach ($order->books as $book) {
            $sql = "INSERT INTO orderedbooks VALUES
                    ('$order->orderID', " . $book["isbn"] . ", " . $book["quantity"] . ");";
            if (!$this->query($sql)) return false;
        }
    }

    function delete($orderID)
    {
        $sql = "DELETE FROM orderedbooks WHERE orderID LIKE '$orderID';
                    DELETE FROM orders WHERE orderID LIKE '$orderID';";
        return $this->query($sql);
    }

    function delete_ordered_books($orderID, $isbn)
    {
        $ordered = $this->select_ordered_books($orderID);
        if (!$ordered) return;
        if (count($ordered) == 1) return $this->delete($orderID);

        $sql = "DELETE FROM orderedbooks WHERE orderID LIKE '$orderID' AND isbn LIKE $isbn;";
        return $this->query($sql);
    }

    function update_ordered_books($orderID, $isbn, $quantity)
    {
        if ($quantity == 0) {
            return $this->delete_ordered_books($orderID, $isbn);
        }

        $sql = "UPDATE orderedbooks SET quantity=$quantity
                WHERE orderID LIKE '$orderID' AND isbn LIKE $isbn;";
        return $this->query($sql);
    }
}
