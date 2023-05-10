<?php

namespace Konyvklub;

include_once("../backend/models/DbConnection.php");
include_once("../backend/interfaces/IDbHandler.php");
include_once("../backend/fundamentals/basic_functions.php");

foreach (scandir("../backend") as $dir) {
    if (is_dir($dir)) continue;
    foreach (glob("../backend/$dir/*.php") as $filename) {
        include_once($filename);
    }
}

$admin_handler = new AdminHandler();
$user_handler = new UserHandler();
$book_handler = new BookHandler();
$order_handler = new OrderHandler();
$encryption = new Encryption();

function admin_exists($username, $signup = false)
{
    $exists = $GLOBALS["admin_handler"]->select($username);
    if (!$exists) {
        if (!$signup) {
            create_json("Nem létezik ilyen felhasználó!", 404);
        }
        return false;
    }
    if ($signup) {
        create_json("Már létezik ilyen felhasználó!", 303);
    }
    return true;
}

// összes admin lekérdezése
if (post_var_ok("admins")) {
    $result = $admin_handler->select_ordered();
    create_json($result);
}

// admin bejelentkezés
if (post_var_ok("admin_login", true) && post_var_ok("adminpwd", true)) {
    if (!admin_exists($_POST["admin_login"])) return;

    $result = $admin_handler->select($_POST["admin_login"]);
    if ($encryption->decrypt($_POST["adminpwd"], $result->pwd)) {
        create_json($result);
        return;
    }
    create_json("Hibás felhasználónév vagy jelszó!", 401);
}

// admin regisztráció
if (post_var_ok("admin_signup", true) && post_var_ok("adminpwd", true)) {
    if (admin_exists($_POST["admin_signup"], true)) return;

    $hash = $encryption->encrypt($_POST["adminpwd"]);
    $result = $admin_handler->insert($_POST["admin_signup"], $hash);
    if (!$result) {
        create_json("Nem sikerült létrehozni a felhasználót!", 500);
    }
    create_json($result);
}

// admin törlés
if (post_var_ok("del_admin", true)) {
    if (!admin_exists($_POST["del_admin"])) return;

    $result = $admin_handler->delete($_POST["del_admin"]);
    create_json($result);
}

// user ellenőrzése
function user_exists($email)
{
    $exists = $GLOBALS["user_handler"]->select($email);
    if (!$exists) {
        create_json("Nem létezik ilyen felhasználó!", 404);
        return false;
    }
    return true;
}

// össze user lekérdezése
if (post_var_ok("users")) {
    $result = $user_handler->select_ordered();
    create_json($result);
}

// user keresés
if (post_var_ok("user", true)) {
    $result = $user_handler->select_contains($_POST["user"]);
    create_json($result);
}

// user törlése
if (post_var_ok("del_user", true)) {
    if (!user_exists($_POST["del_user"])) return;

    $has_order = $order_handler->select_by_email($_POST["del_user"]);
    if ($has_order) {
        create_json("Folyamatban lévő rendelés miatt nem törölhető!", 403);
        return;
    }
    $token_handler = new TokenHandler();
    $token_handler->delete_by_email($_POST["del_user"]);
    $result = $user_handler->delete($_POST["del_user"]);
    create_json($result);
}

// user módosítása
if (post_var_ok("mod_user")) {
    if (!user_exists($_POST["email"])) return;

    $user = new User();
    $user->init_by_API(
        $_POST["email"],
        $_POST["lastname"],
        $_POST["firstname"],
        $_POST["address"],
        $_POST["phone"],
        $_POST["pwd"]
    );
    $result = $user_handler->update($user);
    create_json($result);
}

function book_exists($isbn, $insert = false)
{
    $exists = $GLOBALS["book_handler"]->select($isbn);
    if (!$exists) {
        if (!$insert) {
            create_json("Nem létezik ilyen könyv!", 404);
        }
        return false;
    }
    if ($insert) {
        create_json("Már létezik ilyen könyv!", 303);
    }
    return true;
}

// összes könyv lekérdezése
if (post_var_ok("books")) {
    $result = $book_handler->select_ordered();
    create_json($result);
}

// könyv keresés
if (post_var_ok("book", true)) {
    $result = $book_handler->select_contains($_POST["book"]);
    create_json($result);
}
// könyv törlése
if (post_var_ok("del_book", true)) {
    if (!book_exists($_POST["del_book"])) return;

    $has_order = $order_handler->select_by_isbn($_POST["del_book"]);
    if ($has_order) {
        create_json("Folyamatban lévő rendelés miatt nem törölhető!", 403);
        return;
    }
    $cart_handler = new CartHandler();
    $cart_result = $cart_handler->delete_by_isbn($_POST["del_book"]);
    $result = $book_handler->delete($_POST["del_book"]);
    create_json($result);
}

// könyv hozzáadása
if (post_var_ok("add_book")) {
    if (book_exists($_POST["isbn"], true)) return;

    $book = new Book();
    $book->init_by_input(
        $_POST["isbn"],
        $_POST["title"],
        $_POST["author"],
        $_POST["description"],
        $_POST["category"],
        $_POST["price"],
        $_POST["stock"],
        $_POST["ordered"],
        $_POST["image"]
    );
    $result = $book_handler->insert($book);
    create_json($result);
}

// könyv módosítása
if (post_var_ok("mod_book")) {
    if (!book_exists($_POST["isbn"])) return;

    $book = new Book();
    $book->init_by_input(
        $_POST["isbn"],
        $_POST["title"],
        $_POST["author"],
        $_POST["description"],
        $_POST["category"],
        $_POST["price"],
        $_POST["stock"],
        $_POST["ordered"],
        $_POST["image"]
    );
    $result = $book_handler->update($book);
    create_json($result);
}

function order_exists($orderID)
{
    $exists = $GLOBALS["order_handler"]->select($orderID);
    if (!$exists) {
        create_json("Nem létezik ilyen rendelés!", 404);
        return false;
    }
    return true;
}

// összes rendelés lekérdezése
if (post_var_ok("orders")) {
    $result = $order_handler->select_ordered();
    create_json($result);
}

// rendelés keresése
if (post_var_ok("order")) {
    $result = $order_handler->select_contains($_POST["order"]);
    create_json($result);
}

// rendelés állapotának módosítása
if (post_var_ok("state", true) && post_var_ok("orderID", true)) {
    if (!order_exists($_POST["orderID"])) return;

    $result = $order_handler->update($_POST["orderID"], $_POST["state"]);
    create_json($result);
}

// rendelés törlése
if (post_var_ok("del_order", true)) {
    if (!order_exists($_POST["del_order"])) return;

    $result = $order_handler->delete($_POST["del_order"]);
    create_json($result);
}

// összes rendeléshez tartozó könyv lekérdezése
if (post_var_ok("orderedbooks", true)) {
    if (!order_exists($_POST["orderedbooks"])) return;

    $result = $order_handler->select_ordered_books($_POST["orderedbooks"]);
    create_json($result);
}

// rendeléshez tartozó könyv törlése
if (post_var_ok("del_orderedbook")) {
    if (!order_exists($_POST["del_orderedbook"])) return;

    $result = $order_handler->delete_ordered_books($_POST["del_orderedbook"], $_POST["isbn"]);
    create_json($result);
}

// rendeléshez tartozó könyv módosítása
if (post_var_ok("mod_orderedbook")) {
    if (!order_exists($_POST["mod_orderedbook"])) return;

    $result = $order_handler->update_ordered_books($_POST["mod_orderedbook"], $_POST["isbn"], $_POST["quantity"]);
    create_json($result);
}

if (isset($_POST["tokentest"])) {
    $token = create_token();
    $protocol = empty($_SERVER["HTTPS"]) ? "http" : "https";
    echo $protocol . "://" . $_SERVER["HTTP_HOST"] . "/?email=$token->email&token=$token->token";
}

// JSON kiírása
function create_json($data, $code = 200)
{
    http_response_code($code);
    header("Content-Type: application/json; charset=utf-8");
    echo json_encode($data);
}
