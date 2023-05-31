<?php 

if(!session_id()){
    session_start();
}

if(isset($_POST)){
    $_SESSION['options'] = $_POST;
};




header('Location: new_pax.php');