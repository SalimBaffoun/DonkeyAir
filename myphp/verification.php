<?php

require_once 'header.php';
require_once 'footer.php';
require_once 'Database.php';

// session_start();

if(isset($_POST['email']) && isset($_POST['password'])) {
    $usermail = trim($_POST['email']);
    $password = trim($_POST['password']);


try {
    if($usermail !== "" && $password !== ""){ 

        $db = Database::getPdo();

        
        $query = "SELECT count(*) FROM users where email = '". $usermail."' and password = '".$password."' ";

        $statement = $db->prepare($query);
        // $statement->bindValue(':usermail', $usermail, PDO::PARAM_STR);
        // $statement->bindValue(':password', $password, PDO::PARAM_STR);

        $reponse = $statement->execute();
        $count = $statement->fetchColumn();
        



        if($count){
        
            header('Location: homepage.php');

            $statement = $db->query('SELECT * FROM users WHERE email= "' . $usermail . '"', PDO::FETCH_ASSOC);
                var_dump($result = $statement->fetch());
                
            
            var_dump($_SESSION['name'] = $result['name']);
            var_dump($_SESSION['user_id'] = $result['user_id']);
            ?>
            <a class="btn btn-primary btn-lg" href="homepage.php">Commencer la recherche</a></div>
            <?php 
            
            } else {
                echo "Mauvais Identifiant / mdp";
            }
            
        } else {
            echo "introuvable";
        }

} catch (PDOException $e) {
    echo "Erreur : " . $e->getMessage();
}
    
}

