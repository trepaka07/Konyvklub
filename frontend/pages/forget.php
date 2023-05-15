<!-- Elfelejtett jelszó -->
<?php Konyvklub\is_logged_in(); ?>

<div id="forget">
  <div class="page-title">
    <h3>Elfelejtette jelszavát?</h3>
  </div>
  <form class="modify" method="POST">
    <label for="email"><b>Email:</b></label>
    <input type="email" name="forget" placeholder="mintamarton@gmail.com" required><br>
    <div class="page-footer">
      <button type="submit">Küldés</button>
    </div>
  </form>
</div>