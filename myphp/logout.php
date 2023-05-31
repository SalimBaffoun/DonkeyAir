<?php

session_start();

$_SESSION = [];

var_dump($_SESSION);

session_destroy();


header('Location: login.php');
exit();