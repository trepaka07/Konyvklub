<!-- Egy könyv oldala -->
<div class="product">
    <figure>
        <img class="product-book" src="<?php echo Konyvklub\get_image($actual_book->image); ?>" alt="<?php echo $actual_book->title; ?>">
    </figure>
    <div class="description">
        <h4><?php echo $actual_book->author; ?></h4>
        <h2><?php echo $actual_book->title; ?></h2>
        <span class="product-price"><?php echo $actual_book->price; ?> Ft</span>

        <div class="product-card">
            <form action="" method="post" onsubmit="return loggedIn()">
                <button type="submit" name="cart_add" value="<?php echo $actual_book->isbn; ?>">Kosárba teszem</button>
            </form>
        </div>
        <hr>
        <h5>Leírás:</h5>
        <p><?php echo $actual_book->description; ?></p>

        <!-- <iframe width="700" height="315" src="https://www.youtube.com/embed/WRp-lYtNc_Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe> -->
    </div>
</div>