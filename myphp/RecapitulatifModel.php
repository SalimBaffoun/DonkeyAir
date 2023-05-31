<?php

class Recapitulatif 
{

    public static function recapGo(){

    
?>
    <p><?php echo $_SESSION['go_id'] ?></p>
    <div class="div-recap div-info">
        <div>
            <?php
            if (isset($_SESSION['go_id'])) {
                $db = DataBase::getPdo();
                $statement = $db->query('SELECT go_airport.city as go_airport, arrival_airport.city as arrival_airport, departure_time, arrival_time, flight_number, price
                    FROM flights
                    LEFT JOIN airports as go_airport ON go_airport.airport_id = flights.departure_airport_id
                    LEFT JOIN airports as arrival_airport ON arrival_airport.airport_id = flights.arrival_airport_id
                    WHERE flight_id = ' . $_SESSION['go_id']);
                $statement->execute();
                $flights = $statement->fetchAll(PDO::FETCH_ASSOC);

                foreach ($flights as $flight) : ?>
                    <p><?php echo $flight['departure_time'] ?> </p>
                    <p><?php echo $flight['go_airport'] ?> </p>
        </div>
        <div>
            <h1>✈️</h1>
        </div>
        <div>
            <p><?php echo $flight['arrival_time'] ?> </p>
            <p><?php echo $flight['arrival_airport'] ?> </p>

        </div>
    </div>
    <div class="div-info-vol">
        <p>Numero de vol : <?php echo $flight['flight_number'] ?></p>
    </div>
    <div class="div-recap">
        <div>
            <p>Tarifs : <?php echo $flight['price'] ?> €</p>
        </div>

    </div>
</div>
<?php
                endforeach;
            }





























        }

}