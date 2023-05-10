<?php

use Konyvklub\DbConnection;
use \PHPUnit\Framework\TestCase;

class DbConnectionTest extends TestCase
{
    public function testQueryWithValidSql()
    {
        $conn = new DbConnection();
        $sql = "SELECT * FROM admins WHERE username LIKE 'Trepy';";
        $result = $conn->query($sql)->fetchObject();

        $this->assertEquals("Trepy", $result->username);
    }

    public function testQueryWithInvalidSql()
    {
        $conn = new DbConnection();
        $sql = "SELECT * FROM admins WHERE username LIKE 'fdfffd';";
        $result = $conn->query($sql)->fetchObject();

        $this->assertFalse($result);
    }
}
