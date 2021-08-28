<?php
$header = "";
$phar = new Phar("phar.phar");
$phar->startBuffering();
$phar->addFromString("test.php","");
$phar->setStub($header." __HALT_COMPILER(); ?>");
$phar->stopBuffering();