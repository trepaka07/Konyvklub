<?php

/**
 * Ellenőrzi, hogy az átadott tömb elemei léteznek-e a $_POST kulcsai között
 *
 * @return true ha mind létezik
 * @return false ha legalább az egyik nem létezik
 */
function is_post_set(array $variables)
{
    foreach ($variables as $var) {
        if (!isset($_POST[$var])) return false;
    }
    return true;
}

/**
 * Ellenőrzi, hogy a $_POST összes elemének van-e értéke
 *
 * @return true ha mindnek van értéke
 * @return false ha legalább egynek nincs értéke
 */
function is_post_filled()
{
    foreach ($_POST as $key => $value) {
        if ($value == "" || $value == null) return false;
    }
    return true;
}

function var_check($array, $key, $check_value, $value)
{
    $exist = isset($array[$key]);
    if ($check_value) {
        if ($value == "") return $exist && $array[$key];
        return $exist && $array[$key] == $value;
    }
    return $exist;
}

function post_var_ok($key, $check_value = false, $value = "")
{
    return var_check($_POST, $key, $check_value, $value);
}

function get_var_ok($key, $check_value = false, $value = "")
{
    return var_check($_GET, $key, $check_value, $value);
}

function session_var_ok($key, $check_value = false, $value = "")
{
    return var_check($_SESSION, $key, $check_value, $value);
}

function get_random_string(int $length = 32)
{
    $chars = array_merge(range('a', 'z'), range('A', 'Z'), range(1, 9));
    $result = "";
    for ($i = 0; $i < $length; $i++) {
        $result .= $chars[$i];
        $result .= $chars[random_int(0, count($chars) - 1)];
    }
    return $result;
}

function identifier_validation()
{
    if (!defined("IDENTIFIER")) {
        header("Location: ./");
    }
}
