<?php
$page = "home";

// a $_GET["p"] értékének meg kell egyeznie a fájl nevével
// (?p=login --> fájlnév: login.php)
if (isset($_GET["p"])) {
    $page = $_GET["p"];
    $is_exists = file_exists("./frontend/pages/$page.php");
    if ($page == "home" || trim($_GET["p"]) == "" || !$is_exists) {
        header("Location: ./");
    }
}
