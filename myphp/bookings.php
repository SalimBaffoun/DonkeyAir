<?php

require_once 'database.php';
require_once 'footer.php';
require_once 'Booking.php';
require_once 'Flight.php';

if(!session_id()){
    session_start();
}

$lastBooking = Booking::newBooking();

echo $lastBooking;

var_dump(Flight::updateAvailableSeatsGo($lastBooking));
var_dump(Flight::updateAvailableSeatsReturn($lastBooking));

// Flight::updateSeatsAvailable();

header('Location: historic.php');