<?php

namespace Konyvklub;

$order_handler = new OrderHandler();
$book_handler = new BookHandler();

if (isset($_POST["send_order"]) && isset($_SESSION["cart"])) {
    send_order();
}

function send_order()
{
    try {
        $books = [];
        foreach ($_SESSION["cart"] as $book) {
            array_push($books, $book);
        }
        $order = new Order($_SESSION["email"], $books);
        $GLOBALS["order_handler"]->insert($order);

        foreach ($books as $book) {
            $GLOBALS["book_handler"]->update_stock($book["isbn"], $book["quantity"]);
        }

        $cart_handler = new CartHandler();
        $cart_handler->clear($_SESSION["email"]);
        update_local_cart();
        send_order_email();
        set_message("Köszönjük a rendelést!");
        header("Location: ./?p=message");
    } catch (\Throwable $th) {
        set_message("Hiba történt a rendelés során. Próbáld újra később!");
        header("Location: ./?p=message");
    }
}

function send_order_email()
{
    $user_handler = new UserHandler();
    $user = $user_handler->select($_SESSION["email"]);
    $message = "<p>Köszönjük, hogy nálunk vásárolt.</p>
                <p>A rendelés feldolgozása elkezdődött. 
                Rövidesen megírjuk a választott fizetési és szállítási mód függvényében, 
                hogy mikorra várható a csomag érkezése.</p>";
    $email = new Email($user, $message, "Rendelés");
    return $email->send();
}
