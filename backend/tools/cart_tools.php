<?php

namespace Konyvklub;

$cart_handler = new CartHandler();

if (isset($_GET["p"]) && $_GET["p"] == "cart") {
    if (!isset($_SESSION["cart"])) {
        header("Location: ./");
        set_error_msg("A kosár megnyitásához jelentkezz be!");
    } else if (count($_SESSION["cart"]) == 0) {
        header("Location: ./");
        set_error_msg("A kosár nem tartalmaz egy terméket sem!");
    }
}

// hozzáadás a kosárhoz
if (isset($_POST["cart_add"]) && $_POST["cart_add"] != "") {
    if (!is_email_filled()) return;

    $exists = $cart_handler->select($_SESSION["email"], $_POST["cart_add"]);
    if (!check_stock($exists)) return;

    if (!$exists) {
        add_to_cart($_POST["cart_add"]);
    } else {
        change_quantity($_POST["cart_add"], Operation::Sum);
    }

    unset($_POST["cart_add"]);
    update_local_cart();
}

if (post_var_ok("cart_increase", true)) {
    if (!is_email_filled()) return;

    $exists = $cart_handler->select($_SESSION["email"], $_POST["cart_increase"]);
    if (!$exists) return;
    change_quantity($_POST["cart_increase"], Operation::Sum);
    unset($_POST["cart_increase"]);

    update_local_cart();
}

// kosárban lévő mennyiség csökkentése
if (post_var_ok("cart_decrease", true)) {
    if (!is_email_filled()) return;

    $exists = $cart_handler->select($_SESSION["email"], $_POST["cart_decrease"]);
    if (!$exists) return;

    if ($exists->quantity > 1) {
        change_quantity($_POST["cart_decrease"], Operation::Subtract);
    } else {
        remove_from_cart($_POST["cart_decrease"]);
    }
    unset($_POST["cart_decrease"]);

    update_local_cart();
}

// törlés a kosárból
if (isset($_POST["cart_delete"]) && $_POST["cart_delete"] != "") {
    if (!is_email_filled()) return;
    remove_from_cart($_POST["cart_delete"]);
    unset($_POST["cart_delete"]);
    update_local_cart();
}

// kosár ürítése
if (isset($_POST["cart_clear"]) && is_email_filled()) {
    if (!is_email_filled()) return;
    $cart_handler->clear($_SESSION["email"]);
    update_local_cart();
}

/**
 * Frissíti a helyi kosarat az adatbázis alapján
 */
function update_local_cart()
{
    $_SESSION["cart"] = $GLOBALS["cart_handler"]->select_all_by_email($_SESSION["email"]);
}

function get_cart_count()
{
    if (isset($_SESSION["cart"])) {
        $count = 0;
        foreach ($_SESSION["cart"] as $item) {
            $count += $item["quantity"];
        }
        return $count;
    }
    return 0;
}

function check_stock($cart_item)
{
    $book_handler = new BookHandler();
    $book = $book_handler->select($_POST["cart_add"]);
    if (!$cart_item) {
        return $book->stock > 0;
    }
    return $book->stock >= $cart_item->quantity + 1;
}

/**
 * Hozzáad egy elemet a kosárhoz
 *
 * @param string $isbn egy könyv ISBN száma
 */
function add_to_cart(string $isbn)
{
    $record = new CartItem($_SESSION["email"], $isbn, 1);
    $GLOBALS["cart_handler"]->insert($record);
}

/**
 * Megváltoztatja a kosárban lévő mennyiséget
 *
 * @param string $isbn egy könyv ISBN száma
 * @param Operation $operation művelet meghatározása
 */
function change_quantity(string $isbn, Operation $operation)
{
    $record = new CartItem($_SESSION["email"], $isbn, 1);
    $GLOBALS["cart_handler"]->update($record, $operation);
}

/**
 * Töröl egy elemet a kosárból
 *
 * @param string $isbn egy könyv ISBN száma
 */
function remove_from_cart(string $isbn)
{
    $record = new CartItem($_SESSION["email"], $isbn, 1);
    $GLOBALS["cart_handler"]->delete($record);
}

/**
 * Ellenőrzi, hogy van-e megadva email cím (be van-e jelentkezve)
 *
 * @return bool
 */
function is_email_filled()
{
    return session_var_ok("email", true);
}
