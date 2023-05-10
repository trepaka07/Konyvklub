<?php

namespace Konyvklub;

class Book
{
    public $isbn;
    public $title;
    public $author;
    public $description;
    public $category;
    public $price;
    public $stock;
    public $ordered;
    public $image;

    function init_by_dbresult($result)
    {
        foreach ($this as $key => $value) {
            $this->$key = $result->$key;
        }
    }

    function init_by_input($isbn, $title, $author, $description, $category, $price, $stock, $ordered, $image)
    {
        $this->isbn = $isbn;
        $this->title = $title;
        $this->author = $author;
        $this->description = $description;
        $this->category = $category;
        $this->price = $price;
        $this->stock = $stock;
        $this->ordered = $ordered;
        $this->image = $image;
    }
}
