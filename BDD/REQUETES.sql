REQUETES

SELECT name, email, password FROM bookings
LEFT JOIN users ON users.user_id = bookings.user_id;



SELECT name, email, password, flight_number as flight_go FROM bookings
LEFT JOIN users ON users.user_id = bookings.user_id
LEFT JOIN flights ON flights.flight_id = bookings.flight_go_id;


SELECT users.name, flights_go.flight_number as flight_go, flights_return.flight_number as flight_return 
FROM bookings 
LEFT JOIN users ON users.user_id = bookings.user_id 
LEFT JOIN flights as flights_go ON flights_go.flight_id = bookings.flight_go_id 
LEFT JOIN flights as flights_return ON flights_return.flight_id = bookings.flight_return_id;

-- MES RESA VOL ALLER

SELECT users.name, flights_go.flight_number as flight_go, airports.city as airport_arrival, departure_time, price
FROM bookings 
LEFT JOIN users ON users.user_id = bookings.user_id 
LEFT JOIN flights as flights_go ON flights_go.flight_id = bookings.flight_go_id
LEFT JOIN airports ON airports.airport_id = flights_go.arrival_airport_id;

-- OK INFO CARD sans prix

SELECT users.name, airports.city as airport_arrival, go_dpt_time.departure_time as go_dpt_time, return_dpt_time.departure_time as return_dpt_time
FROM bookings 
LEFT JOIN users ON users.user_id = bookings.user_id 
LEFT JOIN flights as go_dpt_time ON go_dpt_time.flight_id = bookings.flight_go_id
LEFT JOIN flights as return_dpt_time ON return_dpt_time.flight_id = bookings.flight_return_id
LEFT JOIN airports ON airports.airport_id = go_dpt_time.arrival_airport_id;

-- OK INFO CARD avec prix

SELECT users.user_id, airports.city as airport_arrival, go_dpt_time.departure_time as go_dpt_time,go_dpt_time.date as go_date, return_dpt_time.departure_time as return_dpt_time, return_dpt_time.date as return_date, go_dpt_time.price as go_price, return_dpt_time.price as return_price
FROM bookings 
LEFT JOIN users ON users.user_id = bookings.user_id 
LEFT JOIN flights as go_dpt_time ON go_dpt_time.flight_id = bookings.flight_go_id
LEFT JOIN flights as return_dpt_time ON return_dpt_time.flight_id = bookings.flight_return_id
LEFT JOIN airports ON airports.airport_id = go_dpt_time.arrival_airport_id
WHERE users.user_id = 3
ORDER BY go_date DESC;



-- MES RESA VOL RETOUR
SELECT users.name, flights_go.flight_number as flight_go, airports.city as airport_arrival, flights_return.flight_number as flight_return, airports.city as airport_arrival
FROM bookings 
LEFT JOIN users ON users.user_id = bookings.user_id 
LEFT JOIN flights as flights_return ON flights_return.flight_id = bookings.flight_return_id
LEFT JOIN flights as flights_go ON flights_go.flight_id = bookings.flight_go_id
LEFT JOIN airports ON airports.airport_id = flights_go.arrival_airport_id
LEFT JOIN airports as airport_arrival ON airports.airport_id = flights_return.arrival_airport_id;

--MES RESA ALLER ET RETOUR
SELECT users.name, flights_return.flight_number as flight_return, airports.city as airport_arrival, arrival_time, price
FROM bookings 
LEFT JOIN users ON users.user_id = bookings.user_id 
LEFT JOIN flights as flights_return ON flights_return.flight_id = bookings.flight_return_id
LEFT JOIN airports ON airports.airport_id = flights_return.arrival_airport_id;

SELECT users.name, flights_return.flight_number as flight_return, airports.name as airport_return
FROM bookings 
LEFT JOIN users ON users.user_id = bookings.user_id 
LEFT JOIN flights as flights_return ON flights_return.flight_id = bookings.flight_return_id
LEFT JOIN airports ON airports.airport_id = flights_return.arrival_airport_id;


SELECT users.name, flights_go.flight_number as flight_go, flights_return.flight_number as flight_return, airport_go.name as airport_go, airport_return.name as airport_return
FROM bookings 
LEFT JOIN users ON users.user_id = bookings.user_id 
LEFT JOIN flights as flights_go ON flights_go.flight_id = bookings.flight_go_id 
LEFT JOIN flights as flights_return ON flights_return.flight_id = bookings.flight_return_id
LEFT JOIN airports as airport_go ON airport_go.airport_id = flights_go.departure_airport_id
LEFT JOIN airports as airport_return ON airport_return.airport_id = flights_return.arrival_airport_id;


SELECT users.name, flights_go.flight_number as flight_go, flights.departure_time, flights_return.flight_number as flight_return, airport_go.name as airport_go, airport_return.name as airport_return, flights.price
        FROM bookings 
        LEFT JOIN users ON users.user_id = bookings.user_id 
        LEFT JOIN flights as flights_go ON flights_go.flight_id = bookings.flight_go_id 
        LEFT JOIN flights as flights_return ON flights_return.flight_id = bookings.flight_return_id
        LEFT JOIN flights ON flights.price = bookings.flight_go_id
        LEFT JOIN airports as airport_go ON airport_go.airport_id = flights_go.departure_airport_id
        LEFT JOIN airports as airport_return ON airport_return.airport_id = flights_return.departure_airport_id;




SELECT *, city FROM flights 
LEFT JOIN airports ON airports.airport_id = flights.arrival_airport_id
WHERE arrival_airport_id = 3;

SELECT users.user_id, airports.city as airport_arrival, go_dpt_time.departure_time as go_dpt_time,go_dpt_time.date as go_date, return_dpt_time.departure_time as return_dpt_time, return_dpt_time.date as return_date, go_dpt_time.price as go_price, return_dpt_time.price as return_price, booking_id
        FROM bookings 
        LEFT JOIN users ON users.user_id = bookings.user_id 
        LEFT JOIN flights as go_dpt_time ON go_dpt_time.flight_id = bookings.flight_go_id
        LEFT JOIN flights as return_dpt_time ON return_dpt_time.flight_id = bookings.flight_return_id
        LEFT JOIN airports ON airports.airport_id = go_dpt_time.arrival_airport_id
        WHERE users.user_id = 1 
        ORDER BY go_date DESC;

-- REQUETE POUR LE RECAP

SELECT go_airport.city as go_airport, arrival_airport.city as arrival_airport, departure_time, arrival_time, flight_number, price
FROM flights
LEFT JOIN airports as go_airport ON go_airport.airport_id = flights.departure_airport_id
LEFT JOIN airports as arrival_airport ON arrival_airport.airport_id = flights.arrival_airport_id
WHERE flight_id = '2';
SELECT * FROM passengers 
ORDER BY passenger_id DESC
LIMIT 1;



UPDATE flights 
SET date = '2023-06-06'
WHERE flight_id = '2';

UPDATE flights SET date = '2023-05-05' WHERE flight_id = 8;

SELECT * FROM flights;

-- PARIS - NEW YORK
INSERT INTO flights (flight_number, departure_airport_id, departure_time, arrival_airport_id, arrival_time, price, capacity, date) 
VALUES ('7712', '1', '09:30', '4', '13:59', '487', '20', '2023-05-07');
--  NEW YORK - PARIS
INSERT INTO flights (flight_number, departure_airport_id, departure_time, arrival_airport_id, arrival_time, price, capacity, date) 
VALUES ('1277', '4', '00:30', '1', '13:55', '590', '20', '2023-05-20');

-- PARIS - SHANGHAI

INSERT INTO flights (flight_number, departure_airport_id, departure_time, arrival_airport_id, arrival_time, price, capacity, date) 
VALUES ('5521', '1', '22:30', '2', '16:55', '1297', '20', '2023-09-01');
--  SHANGHAI - PARIS
INSERT INTO flights (flight_number, departure_airport_id, departure_time, arrival_airport_id, arrival_time, price, capacity, date) 
VALUES ('2155', '2', '22:30', '1', '22:00', '750', '20', '2023-09-30');
--  PARIS - LISBONNE
INSERT INTO flights (flight_number, departure_airport_id, departure_time, arrival_airport_id, arrival_time, price, capacity, date) 
VALUES ('3345', '1', '07:15', '3', '08:50', '82', '20', '2023-05-08');
--  LISBONNE - PARIS
INSERT INTO flights (flight_number, departure_airport_id, departure_time, arrival_airport_id, arrival_time, price, capacity, date) 
VALUES ('4533', '3', '16:40', '1', '20:10', '87', '20', '2023-05-16');

-- MODIF TABLE BOOKINGS
ALTER TABLE `bookings` 
	CHANGE `created_at` `nb_pax` INT DEFAULT NULL ;

SELECT users.user_id, airports.city as airport_arrival, go_dpt_time.departure_time as go_dpt_time,go_dpt_time.date as go_date, return_dpt_time.departure_time as return_dpt_time, return_dpt_time.date as return_date, go_dpt_time.price as go_price, return_dpt_time.price as return_price, booking_id, nb_pax, status
        FROM bookings 
        LEFT JOIN users ON users.user_id = bookings.user_id 
        LEFT JOIN flights as go_dpt_time ON go_dpt_time.flight_id = bookings.flight_go_id
        LEFT JOIN flights as return_dpt_time ON return_dpt_time.flight_id = bookings.flight_return_id
        LEFT JOIN airports ON airports.airport_id = go_dpt_time.arrival_airport_id
        WHERE users.user_id = 3 ORDER BY go_date ASC;

SELECT users.user_id, go_flight_id.flight_id as go_flight_id, return_flight_id.flight_id as return_flight_id, go_available_seats.available_seats as go_available_seats, return_available_seats.available_seats as return_available_seats, go_capacity.capacity as go_capacity, return_capacity.capacity as return_capacity,  booking_id, nb_pax, status
        FROM bookings 
        LEFT JOIN users ON users.user_id = bookings.user_id 
        LEFT JOIN flights as go_flight_id ON go_flight_id.flight_id = bookings.flight_go_id
        LEFT JOIN flights as return_flight_id ON return_flight_id.flight_id = bookings.flight_return_id
        LEFT JOIN flights as go_available_seats ON go_available_seats.available_seats = bookings.flight_go_id
        LEFT JOIN flights as return_available_seats ON return_available_seats.available_seats = bookings.flight_return_id
        LEFT JOIN flights as go_capacity ON go_capacity.capacity = bookings.flight_go_id
        LEFT JOIN flights as return_capacity ON return_capacity.capacity = bookings.flight_return_id;

-- GO FLIGHT CAPACITY ET AVAILABLE
SELECT
users.user_id,
go_flight_id.flight_id as go_flight_id,
return_flight_id.flight_id as return_flight_id,
go_available_seats.available_seats as go_available_seats,
go_capacity.capacity as go_capacity,
bookings.booking_id,
bookings.nb_pax,
bookings.status
FROM
bookings
LEFT JOIN users ON users.user_id = bookings.user_id
LEFT JOIN flights as go_flight_id ON go_flight_id.flight_id = bookings.flight_go_id
LEFT JOIN flights as return_flight_id ON return_flight_id.flight_id = bookings.flight_return_id
LEFT JOIN flights as go_available_seats ON go_available_seats.flight_id = bookings.flight_go_id
LEFT JOIN flights as go_capacity ON go_capacity.flight_id = bookings.flight_go_id;

-- RETURN FLIGHT CAPACITY ET AVAILABLE

SELECT users.user_id, return_flight_id.flight_id as return_flight_id, return_available_seats.available_seats as return_available_seats, return_capacity.capacity as return_capacity,
        bookings.booking_id, bookings.nb_pax, bookings.status
        FROM bookings
        LEFT JOIN users ON users.user_id = bookings.user_id
        LEFT JOIN flights as return_flight_id ON return_flight_id.flight_id = bookings.flight_return_id
        LEFT JOIN flights as return_available_seats ON return_available_seats.flight_id = bookings.flight_return_id
        LEFT JOIN flights as return_capacity ON return_capacity.flight_id = bookings.flight_return_id
        WHERE booking_id = 140;
