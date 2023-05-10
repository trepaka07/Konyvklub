<?php

namespace Konyvklub;

$actual_url = "";
$token_handler = new TokenHandler();

if (post_var_ok("forget", true)) {
    $user = check_user();
    if ($user == null) {
        set_error_msg("Nem található felhasználó ezzel az email címmel!");
        return;
    }
    $token = create_token();
    if (!$token) {
        header("Location: ./");
    }
    create_URL($token);
    $content = generate_email($user->firstname);
    if (send_forget_email($user, $content)) {
        set_message("A jelszó megváltoztatásához szükséges linket elküldtük az általad megadott email címre.");
        header("Location: ./?p=message");
    } else {
        header("Location: ./");
    }
}

if (get_var_ok("p", true, "newpassword") && get_var_ok("email", true) && get_var_ok("token", true)) {
    $token = $token_handler->select($_GET["email"], $_GET["token"]);
    if (!$token || $token->token != $_GET["token"]) {
        header("Location: ./");
    }
} else if (get_var_ok("p", true, "newpassword")) {
    header("Location: ./");
}

if (post_var_ok("pwd_change") && post_var_ok("pwd", true) && get_var_ok("email") && get_var_ok("token")) {
    modify_password();
}

function modify_password()
{
    $encryption = new Encryption();
    $hash = $encryption->encrypt($_POST["pwd"]);
    $user_handler = new UserHandler();
    $user_handler->update_password($_GET["email"], $hash);
    $GLOBALS["token_handler"]->delete($_GET["token"], $_GET["email"]);
    set_message("A jelszó sikeresen megváltoztatva.");
    header("Location: ./?p=message");
}

function check_user()
{
    $user_handler = new UserHandler();
    $result = $user_handler->select($_POST["forget"]);
    return $result;
}

function send_forget_email(User $user, string $message)
{
    $email = new Email($user, $message, "Elfelejtett jelszó");
    return $email->send();
}

/**
 * Létrehoz egy Token objektumot és feltölti az adatbázisba
 *
 * @return Token|bool
 */
function create_token()
{
    $token = new Token();
    $token->init($_POST["forget"]);
    if ($GLOBALS["token_handler"]->insert($token)) {
        return $token;
    }
    return false;
}

function generate_email($username)
{
    return "<p>A jelszó megváltoztatásához kattints <a href=" . $GLOBALS["actual_url"] . ">ide</a>!</p>";
}

/**
 * Létrehozza az URL-t, amivel a usert átirányítjuk az új jelszó oldalra
 *
 * @return string
 */
function create_URL($token)
{
    $protocol = empty($_SERVER["HTTPS"]) ? "http" : "https";
    $GLOBALS["actual_url"] = $protocol . "://" . $_SERVER["HTTP_HOST"] . "/?p=newpassword&email=$token->email&token=$token->token";
}
