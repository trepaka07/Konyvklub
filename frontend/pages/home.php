<!-- Főoldal -->
<?php
include_once("./frontend/components/menu.php");
include_once("./frontend/components/top.php");
?>

<div class="home-container">
  <?php foreach (Konyvklub\get_books() as $book) :
    if ($book->stock == 0) continue; ?>
    <div class="card">
      <a href="?p=product&isbn=<?php echo $book->isbn; ?>"><img src="<?php echo Konyvklub\get_image($book->image); ?>" alt="<?php echo $book->title; ?>"></a>
      <h2><?php echo $book->title; ?></h2>
      <p><?php echo $book->author; ?></p>
      <p class="price"><?php echo $book->price; ?> Ft</p>
      <form action="?p=home" method="post" onsubmit="return loggedIn()">
        <button type="submit" name="cart_add" value="<?php echo $book->isbn; ?>">Kosárhoz ad</button>
      </form>
    </div>
  <?php endforeach; ?>
</div>