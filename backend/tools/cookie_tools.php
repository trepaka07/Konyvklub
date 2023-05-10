<?php

namespace Konyvklub;

if (post_var_ok("cookie")) {
    $_SESSION["cookie"] = true;
}

function get_cookie_state()
{
    if (session_var_ok("cookie")) {
        return "none";
    }
    return "block";
}
