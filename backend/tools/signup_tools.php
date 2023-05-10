<?php

namespace Konyvklub;

if (isset($_POST["signup"])) {
    $vars = array("lastname", "firstname", "zipcode", "city", "address", "email", "phone", "pwd");
    if (is_post_set($vars) && is_post_filled()) {
        $user = new User();
        $user->init_by_input(
            $_POST["lastname"],
            $_POST["firstname"],
            $_POST["zipcode"],
            $_POST["city"],
            $_POST["address"],
            $_POST["email"],
            $_POST["phone"],
            $_POST["pwd"]
        );
        signup($user, $_POST["pwd"]);
    }
}

function signup(User $user, string $pwd)
{
    $user_handler = new UserHandler();
    if ($user_handler->select($user->email)) {
        set_error_msg("Már létezik felhasználó ezzel az email címmel!");
        return;
    }
    if ($user_handler->insert($user)) {
        send_verify_email($user);
        login($user->email, $pwd);
    }
}

function send_verify_email(User $user)
{
    $message = "<p>A regisztráció sikeres volt!</p>";
    $email = new Email($user, $message, "Regisztráció");
    $email->send();
}
