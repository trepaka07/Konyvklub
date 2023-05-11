<?php

namespace Konyvklub;

$book_handler = new BookHandler();
$actual_book = null;

if (get_var_ok("p", true, "product") && !get_var_ok("isbn", true)) {
    header("Location: ./");
}

if (get_var_ok("isbn", true)) {
    $book = $GLOBALS["book_handler"]->select($_GET["isbn"]);
    if (!$book || !get_var_ok("p", true, "product")) {
        header("Location: ./");
    }
    $actual_book = $book;
}

if (post_var_ok("search", true)) {
    $_SESSION["search"] = $_POST["search"];
} else {
    $_SESSION["search"] = "";
}

function get_books()
{
    $books = [];
    if (post_var_ok("category", true)) {
        $books = $GLOBALS["book_handler"]->select_category($_POST["category"]);
    } else {
        $books = $GLOBALS["book_handler"]->select_contains($_SESSION["search"]);
    }

    if (!$books) {
        set_error_msg("A könyvek betöltése sikertelen.");
    } else {
        $_SESSION["error"] = "";
    }
    return $books;
}

function get_top_books()
{
    $books = $GLOBALS["book_handler"]->select_top();

    if (!$books) {
        set_error_msg("A könyvek betöltése sikertelen.");
    } else {
        $_SESSION["error"] = "";
    }
    return $books;
}

function get_categories()
{
    $books = $GLOBALS["book_handler"]->select_ordered();
    return array_values(array_unique(array_column($books, "category")));
}

function get_image(string $img)
{
    $dir = "img/books/";
    if (file_exists($dir . $img)) {
        return $dir . $img;
    }
    return $dir . "default.jpg";
}

function menu_visibility()
{
    if (!get_var_ok("p")) {
        return "inline-block";
    }
    return "none";
}
