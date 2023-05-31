-- CREATE AIRPORTS =>

INSERT INTO `donkeyair`.`airports` (`airport_id`, `name`, `city`, `country`) VALUES ('1', 'Charles de Gaulle', 'Paris', 'France');
INSERT INTO `donkeyair`.`airports` (`name`, `city`, `country`) VALUES ('Pudong', 'Shanghai', 'Chine');
INSERT INTO `donkeyair`.`airports` (`name`, `city`, `country`) VALUES ('Humberto Delgado', 'Lisbonne', 'Portugal');
INSERT INTO `donkeyair`.`airports` (`name`, `city`, `country`) VALUES ('JFK', 'New-York', 'USA');




-- CREATE OPTIONS =>

INSERT INTO `donkeyair`.`options` (`name`, `price`) VALUES ('Choisir son siège', '10');
INSERT INTO `donkeyair`.`options` (`name`, `price`) VALUES ('Ajouter une valise', '15');
INSERT INTO `donkeyair`.`options` (`name`, `price`) VALUES ('Menu Spécial', '20');
INSERT INTO `donkeyair`.`options` (`name`, `price`) VALUES ('VIP Mode', '100');


-- CREATE TABLE USERS =>

CREATE TABLE  `donkeyair`.`users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(20) NULL DEFAULT NULL,
   `created_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))



-- CREATE USERS =>


INSERT INTO `donkeyair`.`users` (`name`, `email`, `password`) VALUES ('Salim', 'salima@gmail.com', 'SalimA');
INSERT INTO `donkeyair`.`users` (`name`, `email`, `password`) VALUES ('Salim', 'salimb@gmail.com', 'SalimB');
INSERT INTO `donkeyair`.`users` (`name`, `email`, `password`) VALUES ('Marine', 'marine@gmail.com', 'MarineP');

-- CREATE PASSENGERS =>


INSERT INTO `donkeyair`.`passengers` (`name`, `email`, `phone`, `passport_number`) VALUES ('Salim', 'salima@gmail.com', '0123456789', '1U4HF93ND');
INSERT INTO `donkeyair`.`passengers` (`name`, `email`, `phone`, `passport_number`) VALUES ('Salim', 'salimb@gmail.com', '0987654321', '5HDJF73EJ');
INSERT INTO `donkeyair`.`passengers` (`name`, `email`, `phone`, `passport_number`) VALUES ('Marine', 'marinep@gmail.com', '0548374635', '8GHRV4739');
INSERT INTO `donkeyair`.`passengers` (`name`, `email`, `phone`, `passport_number`) VALUES ('Will', 'will@gmail.com', '0473629485', '7RIB39FHR');
INSERT INTO `donkeyair`.`passengers` (`name`, `email`, `phone`, `passport_number`) VALUES ('Ana', 'ana@gmail.com', '0647338294', '9GUDY4Y30');
INSERT INTO `donkeyair`.`passengers` (`name`, `email`, `phone`, `passport_number`) VALUES ('Chris', 'chris@gmail.com', '0483649343', '94759HFH3');
INSERT INTO `donkeyair`.`passengers` (`name`, `email`, `phone`, `passport_number`) VALUES ('Salma', 'salma@gmail.com', '0976547653', '749HYT345');
INSERT INTO `donkeyair`.`passengers` (`name`, `email`, `phone`, `passport_number`) VALUES ('Junior', 'salima@gmail.com', '0123456789', '142UTHGI3');
INSERT INTO `donkeyair`.`passengers` (`name`, `email`, `phone`, `passport_number`) VALUES ('Tina', 'salimb@gmail.com', '0987654321', '584KFR4RR');
INSERT INTO `donkeyair`.`passengers` (`name`, `email`, `phone`, `passport_number`) VALUES ('Camille', 'marinep@gmail.com', '0548374635', '75039JGU4');


-- CREATE FLIGHTS =>


INSERT INTO `donkeyair`.`flights` (`flight_id`, `flight_number`, `departure_airport_id`, `departure_time`, `arrival_airport_id`, `arrival_time`, `price`) VALUES ('', '1234', '1', '8:30', '4', '10:40', '150');
INSERT INTO `donkeyair`.`flights` (`flight_number`, `departure_airport_id`, `departure_time`, `arrival_airport_id`, `arrival_time`, `price`) VALUES ('4321', '4', '16:30', '1', '05:50', '300');
INSERT INTO `donkeyair`.`flights` (`flight_number`, `departure_airport_id`, `departure_time`, `arrival_airport_id`, `arrival_time`, `price`) VALUES ('1357', '1', '14:30', '4', '16:45', '200');
INSERT INTO `donkeyair`.`flights` (`flight_number`, `departure_airport_id`, `departure_time`, `arrival_airport_id`, `arrival_time`, `price`) VALUES ('7531', '4', '21:30', '1', '11:00', '139');
INSERT INTO `donkeyair`.`flights` (`flight_number`, `departure_airport_id`, `departure_time`, `arrival_airport_id`, `arrival_time`, `price`) VALUES ('2468', '1', '10:00', '2', '21:00', '432');
INSERT INTO `donkeyair`.`flights` (`flight_number`, `departure_airport_id`, `departure_time`, `arrival_airport_id`, `arrival_time`, `price`) VALUES ('8642', '2', '22:00', '1', '06:05', '50');
INSERT INTO `donkeyair`.`flights` (`flight_number`, `departure_airport_id`, `departure_time`, `arrival_airport_id`, `arrival_time`, `price`) VALUES ('1019', '1', '07:15', '2', '19:50', '600');
INSERT INTO `donkeyair`.`flights` (`flight_number`, `departure_airport_id`, `departure_time`, `arrival_airport_id`, `arrival_time`, `price`) VALUES ('9101', '2', '15:10', '1', '20:40', '358');
INSERT INTO `donkeyair`.`flights` (`flight_number`, `departure_airport_id`, `departure_time`, `arrival_airport_id`, `arrival_time`, `price`) VALUES ('5678', '1', '07:15', '3', '8:50', '240');
INSERT INTO `donkeyair`.`flights` (`flight_number`, `departure_airport_id`, `departure_time`, `arrival_airport_id`, `arrival_time`, `price`) VALUES ('8765', '3', '12:10', '1', '15:40', '148');
INSERT INTO `donkeyair`.`flights` (`flight_number`, `departure_airport_id`, `departure_time`, `arrival_airport_id`, `arrival_time`, `price`) VALUES ('1694', '1', '13:15', '3', '14:50', '453');
INSERT INTO `donkeyair`.`flights` (`flight_number`, `departure_airport_id`, `departure_time`, `arrival_airport_id`, `arrival_time`, `price`) VALUES ('4961', '3', '18:50', '1', '22:20', '30');


-- CREATE BOOKINGS =>

INSERT INTO `donkeyair`.`bookings` (`user_id`, `flight_go_id`, `flight_return_id`) VALUES ('1', '1', '2');
INSERT INTO `donkeyair`.`bookings` (`user_id`, `flight_go_id`, `flight_return_id`) VALUES ('2', '3', '4');
INSERT INTO `donkeyair`.`bookings` (`user_id`, `flight_go_id`, `flight_return_id`) VALUES ('3', '4', '5');
