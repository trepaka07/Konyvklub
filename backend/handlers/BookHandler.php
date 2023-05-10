<?php

namespace Konyvklub;

use PDO;

class BookHandler extends DbConnection implements IDbHandler
{
    function select(string $isbn)
    {
        $sql = "SELECT * FROM books WHERE isbn LIKE '$isbn';";
        return $this->query($sql)->fetchObject("Konyvklub\Book");
    }

    function select_ordered($order_field = "title", $order_type = "ASC")
    {
        $sql = "SELECT * FROM books ORDER BY $order_field $order_type";
        return $this->query($sql)->fetchAll(PDO::FETCH_CLASS, "Konyvklub\Book");
    }

    function select_contains($search, $order_field = "title", $order_type = "ASC")
    {
        $sql = "SELECT * FROM books WHERE isbn LIKE '$search' OR title LIKE '%$search%' ORDER BY $order_field $order_type;";
        return $this->query($sql)->fetchAll(PDO::FETCH_CLASS, "Konyvklub\Book");
    }

    function select_top()
    {
        $sql = "SELECT * FROM books ORDER BY ordered DESC LIMIT 10;";
        return $this->query($sql)->fetchAll(PDO::FETCH_CLASS, "Konyvklub\Book");
    }

    function select_category($category)
    {
        $sql = "SELECT * FROM books WHERE category LIKE '$category';";
        return $this->query($sql)->fetchAll(PDO::FETCH_CLASS, "Konyvklub\Book");
    }

    function insert($book)
    {
        $sql = "INSERT INTO books VALUES ('$book->isbn', '$book->title', '$book->author',
                    '$book->description', '$book->category', $book->price, $book->stock, $book->ordered, '$book->image');";
        return $this->query($sql);
    }

    function update($book)
    {
        $sql = "UPDATE books SET title='$book->title', author='$book->author', description='$book->description',
                category='$book->category', price=$book->price, stock=$book->stock, ordered=$book->ordered, image='$book->image'
                WHERE isbn LIKE '$book->isbn';";
        return $this->query($sql);
    }

    function update_stock($isbn, $ordered_count)
    {
        $sql = "UPDATE books SET stock = stock - $ordered_count, ordered = ordered + $ordered_count WHERE isbn LIKE '$isbn';";
        return $this->query($sql);
    }

    function delete($isbn)
    {
        $sql = "DELETE FROM books WHERE isbn LIKE '$isbn';";
        return $this->query($sql);
    }
}
