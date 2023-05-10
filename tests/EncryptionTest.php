<?php

use Konyvklub\Encryption;
use \PHPUnit\Framework\TestCase;

class EncryptionTest extends TestCase
{
    public function testDecryptionWithValidPassword()
    {
        $encryption = new Encryption();
        $hash = $encryption->encrypt("12345");
        $result = $encryption->decrypt("12345", $hash);

        $this->assertTrue($result);
    }

    public function testDecryptionWithInvalidPassword()
    {
        $encryption = new Encryption();
        $hash = $encryption->encrypt("54321");
        $result = $encryption->decrypt("12345", $hash);

        $this->assertFalse($result);
    }
}
