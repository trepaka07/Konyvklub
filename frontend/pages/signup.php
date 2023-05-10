<!-- Regisztrációs oldal -->
<?php Konyvklub\is_logged_in(); ?>

<div class="modify">
  <div class="page-title">
    <h3>Regisztráció</h3>
  </div>
  <form id="signup" method="POST">

    <label for="lastname"><b>Vezetéknév:</b></label>
    <input type="text" name="lastname" placeholder="Minta" required><br>

    <label for="firstname"><b>Keresztnév:</b></label>
    <input type="text" name="firstname" placeholder="Márton" required><br>

    <label for="zipcode"><b>Irányítószám:</b></label>
    <input type="text" name="zipcode" placeholder="2230" required><br>

    <label for="city"><b>Település:</b></label>
    <input type="text" name="city" placeholder="Gyömrő" required><br>

    <label for="address"><b>Utca-házszám:</b></label>
    <input type="text" name="address" placeholder="Andrássy utca 1" required><br>

    <label for="email"><b>Email:</b></label>
    <input type="email" name="email" placeholder="mintamarton@gmail.com" required><br>

    <label for="phone"><b>Telefon:</b></label>
    <input type="tel" name="phone" placeholder="701234567" required><br>

    <label for="pwd"><b>Jelszó:</b></label>
    <input type="password" name="pwd" placeholder="Jelszó" required><br>

    <label for="pwd_again"><b>Jelszó újra</b></label>
    <input type="password" name="pwd_again" placeholder="Jelszó újra" required><br>

    <div id="aszf-accept">
      <input type="checkbox" id="accept" required>
      <label for="accept"><a href="?p=ASZF">Az Általános Szerződési Feltételeket megismertem és elfogadom. *</a></label><br>
    </div>

    <div class="page-footer">
      <button type="submit" name="signup" value="Signup">Regisztrálok</button><br>
      <p class="ex2"><a href="#belepes" onclick="toggleLogin()">Már van fiókja? </a></p>
    </div>

  </form>
</div>