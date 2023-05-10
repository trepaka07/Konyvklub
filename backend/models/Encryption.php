<?php
    namespace Konyvklub;

    class Encryption {

        /**
         * Titkosítja a megadott szöveget (jelszót)
         * 
         * @return string visszaadja a titkosított szöveget
         */
        function encrypt(string $pwd){
            return password_hash($pwd, PASSWORD_DEFAULT);
        }

        /**
         * Összehasonlítja a megadott jelszót és a titkosított szöveget
         * 
         * @return true ha egyezik
         * @return false ha nem egyezik
         */
        function decrypt(string $pwd, string $hash){
            return password_verify($pwd, $hash);
        }
    }
?>