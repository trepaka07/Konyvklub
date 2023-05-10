<!-- Kosár -->
<?php

Konyvklub\is_logged_out();

use Konyvklub\BookHandler;

$book_handler = new BookHandler();

?>

<div id="cart">
    <?php
    $_SESSION["cart_sum"] = 0;
    foreach ($_SESSION["cart"] as $product) :
        $book = $book_handler->select($product["isbn"]); ?>
        <div class="cart-item">
            <!-- kép -->
            <img class="cart-img" src="<?php echo Konyvklub\get_image($book->image); ?>" alt="<?php echo $book->title; ?>">

            <div class="cart-details">
                <!-- cím -->
                <h3><a href="?p=product&isbn=<?php echo $book->isbn; ?>"><?php echo $book->title; ?></a></h3>
                <!-- ár -->
                <p><?php echo number_format($book->price, 0, ".", "."); ?> Ft</p>

                <div class="quantity-div">
                    <!-- mennyiség csökkentése-->
                    <form action="" method="post"><button class="cart-decrease" style="width:25px" type="submit" name="cart_decrease" value="<?php echo $product["isbn"]; ?>">-</button></form>
                    <!-- mennyiség -->
                    <input type="text" name="" class="quantity" style="width:40px" value="<?php echo $product["quantity"]; ?>" disabled>
                    <!-- mennyiség növelése-->
                    <form action="" method="post"><button class="cart-increase" style="width:25px" type="submit" name="cart_increase" value="<?php echo $product["isbn"]; ?>">+</button></form>
                </div>

                <div class="cart-tools">
                    <!-- aktuális könyv teljes ára -->
                    <p class="book-final-price">
                        <?php
                        $full_price = $book->price * $product["quantity"];
                        $_SESSION["cart_sum"] += $full_price;
                        echo number_format($full_price, 0, ".", ".");
                        ?> Ft
                    </p>

                    <!-- termék törlése -->
                    <form class="delete-form" action="" method="post">
                        <button class="cart-delete" type="submit" name="cart_delete" value="<?php echo $product["isbn"]; ?>"><img style="width: 30px" src="img/icons/delete.svg"></button>
                    </form>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
    <div class="cart-footer">
        <!-- kosár ürítése -->
        <form action="" id="clear-form" method="post">
            <button type="submit" id="cart-clear" name="cart_clear">Kosár ürítése</button>
        </form>
        <!-- teljes kosár ára -->
        <strong class="full-price"><?php echo "Fizetendő összeg: " ?> <span><?php echo number_format($_SESSION["cart_sum"], 0, ".", ".") . " Ft"; ?></span></strong>
        <!-- pénztár -->
        <form action="" id="go-payment-form" method="post" onsubmit="return false">
            <button id="go-payment" onclick="window.location.href='?p=payment'">Tovább a pénztárhoz</button>
        </form>
    </div>
</div>