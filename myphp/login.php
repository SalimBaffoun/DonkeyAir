<?php

require_once 'header.php';
require_once 'footer.php';

?>

<main class="form-signin m-auto w-80">
    <form class=" form-pax form-box " action="verification.php" method="POST" >
        <img class="mb-4" src="DONKEY AIR.svg" alt="logo" width="100" height="100">
        <h4 class=" mb-3 fw-normal"> Connectez-vous</h4>

        <div class="form-pax w-50">
            <label for="nom">Email :</label>
            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="email">
        </div>

        <div class="form-pax w-50">
            <label for="nom">Mot de Passe :</label>
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
        </div>

        <div>

            <button class="btn btn-lg btn-secondary btn-custom" id="submit" value ="LOGIN" type="submit">Connexion</button>
        </div>
    </form>
</main>