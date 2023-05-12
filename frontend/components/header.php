<!-- fejléc -->
<header class="header-top">
  <!-- logo -->
  <a id="logo" href="./"><img src="img/icons/logo.png" title="Főoldal"></img></a>

  <!-- keresés -->
  <form class="search" action="./" method="post">
    <input type="text" placeholder="Keresés" name="search" value="<?php echo $_SESSION["search"]; ?>" required>
    <button id="search" type="submit" value="search"><img src="img/icons/search.png" alt="Keresés"></button>
  </form>
  <div id="header-icons">
    <!-- belépés -->
    <?php include_once("./frontend/components/login.php"); ?>

    <!-- kosár -->
    <div class="cart">
      <a href="?p=cart" onclick="loggedIn()"><img style="width: 40px" src="img/icons/cart2.svg" alt="Kosár"></a>
    </div>

    <div class="cart-counter">
      <span><?php echo Konyvklub\get_cart_count(); ?></span>
    </div>

    <!-- menü -->
    <div class="menu" onclick="menuToggle(this)" style="display: <?php echo Konyvklub\menu_visibility(); ?>;">
      <div class="bar1"></div>
      <div class="bar2"></div>
      <div class="bar3"></div>
    </div>
  </div>


</header>

<!--hibaüzenetek -->
<div id="error-div" style="display:<?php echo Konyvklub\get_error_state(); ?>">
  <h3 id="error-message"><?php echo Konyvklub\get_error_msg(); ?></h3>
  <h3 id="error-close">
    <form method="post"><input type="submit" name="close_error" value="X"></form>
  </h3>
</div>