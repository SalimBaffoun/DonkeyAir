<?php 

require_once 'header.php';
require_once 'database.php';
require_once 'footer.php';
require_once 'Booking.php';
require_once 'Flight.php';

?>
<div class="div-recap">
    <p>VOL A VENIR</p>
</div>

<?php Booking::volAVenir(); ?>

<div class="div-recap">
    <p>VOL PASSE</p>
</div>

<?php Booking::volPasse(); 