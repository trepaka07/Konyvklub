<?php

namespace Konyvklub;

class Email
{
    private $from;
    private $to;
    private $firstname;
    private $subject;
    private $message;
    private $header;

    function __construct(User $user, $content, string $subject = "Könyvklub")
    {
        $this->subject = $subject;
        $this->from = "info@konyvklub-shop.hu";
        $this->to = $user->email;
        $this->firstname = $user->firstname;
        $this->build_message($content);
        $this->build_header();
    }

    private function build_header()
    {
        $this->header = "Content-type: text/html; charset=UTF-8" . "\r\n";
        $this->header .= "From:Könyvklub<$this->from>\r\n";
        $this->header .= "Reply-To:Könyvklub<$this->from>";
    }

    private function build_message($content)
    {
        $this->message = "<html>
        <head>
        </head>
        <body>
            <h3>Kedves $this->firstname!</h3>
            $content
            <p>Üdvözlettel,<br><strong>A <a href='https://konyvklub-shop.hu'>Könyvklub</a> csapata</strong></p>
        </body>
        </html>";
    }

    public function send()
    {
        return @mail($this->to, $this->subject, $this->message, $this->header);
    }
}
