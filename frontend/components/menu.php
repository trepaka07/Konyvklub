<!--menu-->
<nav id="dropdown">
  <ul id="menulist">

    <?php foreach (Konyvklub\get_categories() as $category) : ?>
      <li>
        <form action="" method="post">
          <input class="menu-item" type="submit" name="category" value="<?php echo $category; ?>">
        </form>
      </li>
    <?php endforeach; ?>
      
  </ul>
</nav>