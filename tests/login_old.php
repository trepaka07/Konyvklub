<!-- csak teszt -->
<?php

use function Konyvklub\get_email;

$arr = array(
    154868,
    254891,
    324879
);

?>

<!-- EZ CSAK TESZTELÉS MIATT VAN ITT -->
<h3>Bejelentkezés</h3>
<form method="POST" action="">
    <input type="email" name="email" value="<?php echo get_email() ?>" required>
    <input type="password" name="pwd" required>
    <input type="submit" name="login">
</form>

<form action="" method="POST" onsubmit="return logout_verify()">
    <input type="submit" name="logout" value="Kijelentkezés">
</form>

<h3>Keresés</h3>
<form method="post" action="">
    <input type="text" name="search" required>
    <input type="submit" value="Search">
</form>

<h3>Kosár - hozzáadás</h3>
<?php foreach ($arr as $num) : ?>
    <form action="" method="post">
        <input type="number" name="cart_count" min="1" value="1">
        <button type="submit" name="cart_add" value="<?php echo $num; ?>">Add - <?php echo $num; ?></button>
    </form>
<?php endforeach; ?>

<h3>Kosár - törlés</h3>
<?php foreach ($arr as $num) : ?>
    <form action="" method="post">
        <input type="number" name="cart_count" min="1" value="1">
        <button type="submit" name="cart_delete" value="<?php echo $num; ?>">Delete - <?php echo $num; ?></button>
    </form>
<?php endforeach; ?>

<h3>Kosár - ürítés</h3>
<form action="" method="POST">
    <input type="submit" name="cart_clear" value="Clear">
</form>

<h3>Rendelés leadása</h3>
<form action="" method="POST">
    <input type="submit" name="send_order" value="Order">
</form>

<h3>Rendelés törlése</h3>
<form action="" method="POST">
    <input type="text" name="delete_order" required>
    <input type="submit" value="Delete order">
</form>



<!-- header rögzítése 
<script>
    window.onscroll = function() {
      myFunction()
    };

    var header = document.getElementById("myHeader");
    var sticky = header.offsetTop;

    function myFunction() {
      if (window.pageYOffset > sticky) {
        header.classList.add("sticky");
      } else {
        header.classList.remove("sticky");
      }
    }
  </script>
  -->