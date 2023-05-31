<?php

class Booking 
{

    public static function volAVenir()
    {

        $db = Database::getPdo();
        $statement = $db->query('SELECT users.user_id, airports.city as airport_arrival, go_dpt_time.departure_time as go_dpt_time,go_dpt_time.date as go_date, return_dpt_time.departure_time as return_dpt_time, return_dpt_time.date as return_date, go_dpt_time.price as go_price, return_dpt_time.price as return_price, booking_id, nb_pax, status, total_option_price
        FROM bookings 
        LEFT JOIN users ON users.user_id = bookings.user_id 
        LEFT JOIN flights as go_dpt_time ON go_dpt_time.flight_id = bookings.flight_go_id
        LEFT JOIN flights as return_dpt_time ON return_dpt_time.flight_id = bookings.flight_return_id
        LEFT JOIN airports ON airports.airport_id = go_dpt_time.arrival_airport_id
        WHERE users.user_id = ' . $_SESSION['user_id'] . ' ORDER BY go_date ASC');
        $resas = $statement->fetchall(); ?>

        <?php for($i=0; $i<count($resas); $i++){
            if ($resas[$i]['go_date']>= date("Y-m-d")){ ?>
                <div class="div-recap">
                    <div class="div-booking-dedans ">
                        <div>
                            <h5> Paris ✈️ <br><?php echo $resas[$i]['airport_arrival'] ?></h5>
                            <h5> 🫏 : <?php echo $resas[$i]['nb_pax'] ?></h5>
                        </div>

                        <div class="div-booking-go">
                            <div>
                                <p>ALLER</p>
                                <p><?php echo date('d-m-Y', strtotime($resas[$i]['go_date'])); ?></p>
                                <p><?php echo $resas[$i]['go_dpt_time'] ?></p>
                            </div>
                        </div>
                        <div class="div-booking-go">
                            <div>
                                <p>RETOUR</p>
                                <p><?php echo date('d-m-Y', strtotime($resas[$i]['return_date'])); ?></p>
                                <p><?php echo $resas[$i]['return_dpt_time'] ?></p>
                            </div>
                        </div>
                        <div class="div-recap">
                            <div>
                                <p>Tarifs :</p>
                                <p><?php echo (($resas[$i]['go_price'] + $resas[$i]['return_price'])*$resas[$i]['nb_pax'])+$resas[$i]['total_option_price']?> €</p>

                            </div>
                        </div>
                    </div>
                </div>
        <?php 
            } 
        }
    } 

    public static function volPasse()
    {

        $db = Database::getPdo();
        $statement = $db->query('SELECT users.user_id, airports.city as airport_arrival, go_dpt_time.departure_time as go_dpt_time,go_dpt_time.date as go_date, return_dpt_time.departure_time as return_dpt_time, return_dpt_time.date as return_date, go_dpt_time.price as go_price, return_dpt_time.price as return_price, booking_id, nb_pax, status, total_option_price
        FROM bookings 
        LEFT JOIN users ON users.user_id = bookings.user_id 
        LEFT JOIN flights as go_dpt_time ON go_dpt_time.flight_id = bookings.flight_go_id
        LEFT JOIN flights as return_dpt_time ON return_dpt_time.flight_id = bookings.flight_return_id
        LEFT JOIN airports ON airports.airport_id = go_dpt_time.arrival_airport_id
        WHERE users.user_id = ' . $_SESSION['user_id'] . ' ORDER BY go_date DESC');

        $resas = $statement->fetchall(); 
            for($i=0; $i<count($resas); $i++){

                if ($resas[$i]['go_date']< date("Y-m-d")){ ?> 
                    <div class="div-recap">
                        <div class="div-booking-dedans ">
                            <div>
                                <h5> Paris ✈️ <br><?php echo $resas[$i]['airport_arrival'] ?></h5>
                                <h5> 🫏 : <?php echo $resas[$i]['nb_pax'] ?></h5>
                            </div>
            
                            <div class="div-booking-go">
                                <div>
                                    <p>ALLER</p>
                                    <p><?php echo date('d-m-Y', strtotime($resas[$i]['go_date'])); ?></p>
                                    <p><?php echo $resas[$i]['go_dpt_time'] ?></p>
                                </div>
                            </div>
                            <div class="div-booking-go">
                                <div>
                                    <p>RETOUR</p>
                                    <p><?php echo date('d-m-Y', strtotime($resas[$i]['return_date'])); ?></p>
                                    <p><?php echo $resas[$i]['return_dpt_time'] ?></p>
                                </div>
                            </div>
                            <div class="div-recap">
                                <div>
                                    <p>Tarifs :</p>
                                    <p><?php echo (($resas[$i]['go_price'] + $resas[$i]['return_price'])*$resas[$i]['nb_pax'])+$resas[$i]['total_option_price']?> €</p>
            
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php }
            }
    }


    public static function newBooking() {

        if(isset($_SESSION['go_id'])) {

        $db = Database::getPdo();
        $user_id = $_SESSION['user_id'];
        $flight_go_id = $_SESSION['go_id'];
        $status = 'booked';
        $nb_pax = $_SESSION['nb_pax'];
        $flight_return_id = $_SESSION['return_id'];
        $total_option_price = $_SESSION['total_option_price'];

        
        $query = 'INSERT INTO bookings (user_id, flight_go_id, status, nb_pax, flight_return_id, total_option_price) VALUES (:user_id, :flight_go_id, :status, :nb_pax, :flight_return_id, :total_option_price)';
        $stmt = $db->prepare($query);
        $stmt->bindValue(':user_id', $user_id, \PDO::PARAM_INT);
        $stmt->bindValue(':flight_go_id', $flight_go_id, \PDO::PARAM_INT);
        $stmt->bindValue(':status', $status, \PDO::PARAM_STR);
        $stmt->bindValue(':nb_pax', $nb_pax, \PDO::PARAM_INT);
        $stmt->bindValue(':flight_return_id', $flight_return_id, \PDO::PARAM_INT);
        $stmt->bindValue(':total_option_price', $total_option_price, \PDO::PARAM_INT);

        $stmt->execute();

        unset($_SESSION['go_id']);
        unset($_SESSION['nb_pax']);
        unset($_SESSION['return_id']);
        unset($_SESSION['total_option_price']);
        
        return $lastBooking= $db->lastInsertId();
            
        } else {
            header('Location: homepage.php');
        }
        

    }



}