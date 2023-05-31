<?php

require_once 'header.php';
require_once 'Database.php';
require_once 'Option.php';
?>

<div class="optionbox">
        <p class="text-uppercase fw-bold fs-4">Mes Options de voyage</p>
        <form method="POST" action="optionSave.php">

                <?php $options = Option::listOptions();

                foreach ($options as $option) : ?>

                        <div class="form-check">
                                <input type="checkbox" class="form-check-input"  value="<?php echo $option['price'] ?>" name="<?php echo $option['name'] ?>">
                                <label class="form-check-label" name="<?php echo $option['name'] ?>"><?php echo $option['name'] . ' ' . $option['price'] ?> €</label>
                        </div>

        <?php endforeach; ?>
                <div class="form-check">
                        <input type="checkbox" class="form-check-input" value="0" name="Pas d'option">
                        <label class="form-check-label" name="Pas d'option">Pas d'option</label>
                </div>        
                <input type="submit" value="Ajouter">
                <p></p>
        </form>

</div>