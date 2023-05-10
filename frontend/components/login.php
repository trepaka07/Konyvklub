<!-- bejelentkezés-->

<button id="login" onclick="toggleLogin()" style="width:auto;display:<?php echo Konyvklub\login_display(); ?>;"><img style="width: 40px" src="img/icons/user_icon1.svg" alt="Belépés"></button>
<form action="" method="post" onsubmit="return logoutVerify()"><button id="logout" name="logout" style="width:auto;display:<?php echo Konyvklub\logout_display(); ?>;"><img style="width: 40px" src="img/icons/logout.svg" alt="Kilépés"></button></form>
<div id="id01" class="modal">
  <form class="modal-content animate" id="login-form" action="./" method="post">
    <div class="imgcontainer">
      <span onclick="toggleLogin()" class="close" title="Bezár">&times;</span>
      <img src="img/icons/user_icon1.svg" alt="Avatar" class="avatar">
    </div>
    <div class="container">
      <label for="email"><b>E-mail</b></label>
      <input type="email" placeholder="*e-mail cím" name="email" required>
      <label for="pwd"><b>Jelszó</b></label>
      <div id="pwd-eye">
        <input type="password" placeholder="*jelszó" id="pwd" name="pwd" required>
        <button id="eye" type="button" onclick="passwordToggle()"><img src="img/icons/eye.png" alt="Mutasd a jelszót"></button>
      </div>
      <label id="remember">
        <input type="checkbox" checked="checked" name="remember"> Emlékezz rám
      </label>
      <div id="login-btn">
        <button type="submit" name="login">Belépés</button>
      </div>
    </div>
    <div class="container" id="login-extra">
      <a href="?p=signup">Regisztráció</a>
      <a class="psw" href="?p=forget">Elfelejtette jelszavát?</a>
    </div>
  </form>
</div>