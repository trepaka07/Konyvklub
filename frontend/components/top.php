<!-- top 10 -->
<nav id="top10">
    <ul id="toplist">

        <?php foreach (Konyvklub\get_top_books() as $book) : ?>
            <li class="top-item">
                <a href="?p=product&isbn=<?php echo $book->isbn; ?>"><img src="<?php echo Konyvklub\get_image($book->image); ?>" alt="<?php echo $book->title; ?>" title="<?php echo $book->title; ?>"></a>
            </li>
        <?php endforeach; ?>
        <a id="prev-top" onclick="prevTops()">&#10094;</a>
        <a id="next-top" onclick="nextTops()">&#10095;</a>
    </ul>
</nav>