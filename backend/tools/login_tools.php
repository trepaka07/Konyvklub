<?php

namespace Konyvklub;

if (!session_var_ok("login")) {
    default_login_visibility();
}

if (post_var_ok("login")) {
    if (post_var_ok("email", true) && post_var_ok("pwd", true)) {
        $_SESSION["email"] = $_POST["email"];
        update_local_cart();
        login($_POST["email"], $_POST["pwd"]);
    }
}

if (post_var_ok("logout")) {
    if (session_var_ok("email")) {
        logout();
    }
    // set_message("Sikeres kijelentkezés!");
    header("Location: ./");
}

function login(string $email, string $pwd)
{
    $user_handler = new UserHandler();
    $user = $user_handler->select($email);
    if (!$user) {
        set_error_msg("Nem létezik felhasználó ezzel az email címmel!");
        return;
    }

    if (!is_password_ok($user, $pwd)) return;

    $_SESSION["email"] = $user->email;
    $_SESSION["username"] = $user->firstname;
    $_SESSION["logout"] = "inline-block";
    $_SESSION["login"] = "none";
    update_local_cart();
    unset($_SESSION["error"]);
    header("Location: ./");
}

function is_password_ok(User $user, string $pwd)
{
    $encryption = new Encryption();
    if (!$encryption->decrypt($pwd, $user->pwd)) {
        set_error_msg("Hibás jelszó!");
        return false;
    }
    return true;
}

function get_email()
{
    if (post_var_ok("email")) {
        return $_SESSION["email"];
    }
    return "";
}

function get_username()
{
    if (session_var_ok("username")) {
        return $_SESSION["username"];
    }
    return "";
}

function login_display()
{
    if (session_var_ok("login")) {
        return $_SESSION["login"];
    }
    return "none";
}

function logout_display()
{
    if (session_var_ok("logout")) {
        return $_SESSION["logout"];
    }
    return "none";
}

function default_login_visibility()
{
    $_SESSION["login"] = "inline-block";
    $_SESSION["logout"] = "none";
}

function is_logged_in()
{
    if (session_var_ok("email", true)) {
        header("Location: ./");
    }
}

function is_logged_out()
{
    if (!session_var_ok("email", true)) {
        header("Location: ./");
    }
}

function logout()
{
    unset($_SESSION["cart"]);
    unset($_SESSION["email"]);
    default_login_visibility();
    header("Location: ./");
}
