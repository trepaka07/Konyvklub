<!DOCTYPE html>
<html lang="hu" id="top">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Könyvklub - Demo</title>
    <link rel="shortcut icon" href="./img/icons/logo_notext.png" type="image/x-icon">
    <link rel="stylesheet" href="frontend/style/header.css">
    <link rel="stylesheet" href="./frontend/style/style.css">
    <link rel="stylesheet" href="frontend/style/forms.css">
    <link rel="stylesheet" href="frontend/style/menu.css">
    <link rel="stylesheet" href="frontend/style/product.css">
    <link rel="stylesheet" href="./frontend/style/footer.css">
</head>

<body>
    <div class="full">

        <?php
        //backend
        include_once("./frontend/navigation.php");
        include_once("./backend/models/DbConnection.php");
        include_once("./backend/interfaces/IDbHandler.php");
        include_once("./backend/fundamentals/basic_functions.php");
        include_once("./backend/tools/message_tools.php");

        foreach (scandir("./backend") as $dir) {
            if (is_dir($dir)) continue;
            foreach (glob("./backend/$dir/*.php") as $filename) {
                include_once($filename);
            }
        }

        //frontend
        include_once("./frontend/components/header.php");
        include_once("./frontend/pages/$page.php");
        include_once("./frontend/components/footer.php");

        ?>

        <script src="./scripts/script.js"></script>
    </div>
</body>

</html>