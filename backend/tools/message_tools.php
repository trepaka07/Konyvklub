<?php

namespace Konyvklub;

function set_message($message)
{
    $_SESSION["message"] = $message;
}

function get_message()
{
    if (isset($_SESSION["message"]) && $_SESSION["message"] != "") {
        return $_SESSION["message"];
    }
    return "Csak hogy legyen itt valami a tesztelés alatt.";
}
