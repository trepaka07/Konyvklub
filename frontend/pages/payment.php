<!-- Fizetés oldal -->
<?php Konyvklub\is_logged_out();
if (count($_SESSION["cart"]) == 0) {
  header("Location: ./");
}
?>

<div class="payment">
  <div class="page-title">
    <h3>Fizetés</h3>
  </div>
  <form action="" method="post">
    <label for="name"><b>Kártyán szereplő név:</b></label>
    <input type="text" id="name" name="cardname" placeholder="Teszt Elek" />
    <label for="num"><b>Kártya száma:</b></label>
    <input type="text" id="num" name="cardnumber" placeholder="1111-2222-3333-4444" />
    <label for="exp"><b>Lejárat dátuma:</b></label>
    <input type="text" id="exp" name="exp" placeholder="03/24" />
    <label for="cvv"><b>CVV:</b></label>
    <input type="text" id="cvv" name="cvv" placeholder="352" />
  </form>

  <div style="margin-top: 10px;">
    <label><b>Fizetés modja:</b></label>
    <select name="" id="">
      <option value="Személyes">Személyes</option>
      <option value="GLS">GLS</option>
      <option value="Csomagpont">Csomagpont</option>
    </select>
  </div>

  <div class="payment-footer">
    <strong class="full-price" style="text-align: left;"><?php echo "Fizetendő összeg: " ?> <span><?php echo $_SESSION["cart_sum"] . " Ft"; ?></span></strong>
    <form id="order-form" action="" method="post">
      <input id="send-order" type="submit" name="send_order" value="Rendelés elküldése">
    </form>
  </div>
</div>