<?php

if (!session_id()) {
    session_start();
}

require_once 'Database.php';

if (!isset($_SESSION['total_price'])) {
    $_SESSION['total_price'] = 0;
}

$field = 'go_id';
$type = 'go_id';
$flightId = -1;

if (isset($_GET['type'])) {
    $field = $type = $_GET['type'];
}

if (isset($_GET['flightId'])) {
    $_SESSION[$field] = $flightId = (int)$_GET['flightId'];
}

if (isset($_SESSION['go_id']) && isset($_SESSION['return_id'])) {
    $go_id = $_SESSION['go_id'];
    $return_id = $_SESSION['return_id'];

    $db = DataBase::getPdo();
    $statement = $db->prepare('SELECT price, flight_number FROM flights WHERE flight_id = :go_id');
    $statement->bindValue(':go_id', $go_id, PDO::PARAM_INT);
    $statement->execute();
    $go_flight = $statement->fetch(PDO::FETCH_ASSOC);
    $go_price = $go_flight['price'];

    $statement = $db->prepare('SELECT price, flight_number FROM flights WHERE flight_id = :return_id');
    $statement->bindValue(':return_id', $return_id, PDO::PARAM_INT);
    $statement->execute();
    $return_flight = $statement->fetch(PDO::FETCH_ASSOC);
    $return_price = $return_flight['price'];
    $total_price = $go_price + $return_price;

    $_SESSION['total_price'] = $total_price;

    echo json_encode([
        "field" => $field,
        "value" => $_SESSION[$field],
        "post" => $flightId,
        "price" => $_SESSION['total_price'],
    ]);
} else {
    echo json_encode(["price" => -1]);
};


