<!-- Üzenet oldal -->
<?php
if (Konyvklub\get_message() == "") header("Location: ./");
?>

<div style="margin: 50px; text-align: center;">
    <h3><?php echo Konyvklub\get_message(); ?></h3>
    <p style="text-align: center;margin-bottom: 40px;">A további részletekről e-mailben értesítünk.</p>
    <a href="./">Vissza a főoldalra</a>
</div>