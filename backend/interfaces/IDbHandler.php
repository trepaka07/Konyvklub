<?php

namespace Konyvklub;

interface IDbHandler
{
    function select(string $key);
    function select_ordered($order_field, $order_type);
    function select_contains($search, $order_field, $order_type);
    function insert($object);
    function update($object);
    function delete($object);
}
