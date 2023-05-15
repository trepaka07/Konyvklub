<!--lábléc - kész-->

<footer class="footer-container">
    <hr>
    <div class="footer">
        <!--up kép-->
        <a href="#top"><img id="up" src="img/icons/arrow.png" alt="Fel"></a>

        <div class="relationship">
            <h4>Kapcsolat</h4>
            <ul>
                <li><img src="img/icons/phone.png" alt=""><a href="tel:+36701234567"> +36 70 1234567</a></li>
                <li><img src="img/icons/mail.png" alt=""><a href="mailto:info@konyvklub-shop.hu"> info@konyvklub-shop.hu</a></li>
                <li><img src="img/icons/address.png" alt=""><a href="https://goo.gl/maps/7G92TyeUJKtNT6ii8" target="blank"> 2230 Gyömrő, Fő tér 2.</a></li>
            </ul>
        </div>
        <div class="information">
            <h4>Információ</h4>
            <ul>
                <li><a href="?p=ASZF">ÁSZF</a></li>
                <li><a href="?p=data_protection">Adatvédelem</a></li>
                <li><a href="?p=cookie">Cookie szabályzat</a></li>
                <li><a href="?p=checkout">Szállítás és fizetés</a></li>
            </ul>
        </div>
        <div class="help">
            <ul>
                <li><a href="frontend/pages/help.php" target="blank">Súgó</a></li>
            </ul>
        </div>
    </div>
    <hr>
    <h5>Ez a projekt nem jött volna létre, ha nincs: Trepák Attila és Nagy Viktória</h5>

    <!-- cookie elfogadás -->
    <div class="cookie-accept" style="display: <?php echo Konyvklub\get_cookie_state(); ?>;">
        <a href="?p=cookie">Cookie szabályzat</a>
        <form action="" method="post"><button type="submit" name="cookie" style="max-width: 300px;">Elfogadom</button></form>
    </div>


    <!--up-->
    <a href="#top"><img id="up" src="img/icons/arrow.png" alt="Fel"></a>

</footer>