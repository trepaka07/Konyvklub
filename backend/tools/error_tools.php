<?php

// TODO: eldönteni, hogy ez kell-e egyáltalán

namespace Konyvklub;

if (post_var_ok("close_error")) {
    $_SESSION["error"] = "";
}

if (session_var_ok("error", true)) {
    $_SESSION["show_error"] = "block";
} else {
    $_SESSION["show_error"] = "none";
}

function get_error_state()
{
    if (!session_var_ok("show_error")) {
        return "none";
    }
    return $_SESSION["show_error"];
}

function get_error_msg()
{
    if (session_var_ok("error")) {
        return $_SESSION["error"];
    }
    return "";
}

function set_error_msg(string $message)
{
    $_SESSION["error"] = $message;
    $_SESSION["show_error"] = "block";
}
