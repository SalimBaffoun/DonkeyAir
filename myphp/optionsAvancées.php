<?php 

require_once 'header.php';
require_once 'Database.php';
?>

<div class="optionbox">
	<p class="text-uppercase fw-bold fs-4">Mes Options de voyage</p>

	<form method="POST" action="recapitulatif.php">
	
	<div style="border-style:solid; width:400px; padding:20px">
		<?php
		$db = DataBase::getPdo();
		$options = $db->query('SELECT * FROM options'); ?>
		<p>choisir un menu</p>
		<?php
		foreach ($options as $option): 
		
			if($option['category'] === "menu"){?>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="vip_access" value="<?php echo $option['price'] ?>" name="<?php echo $option['option_id']?>">
					<label class="form-check-label" for="vip_access" name="<?php echo $option['name']?>"><?php echo $option['name'] . ' ' . $option['price'] ?> €</label>
			</div>
				
			<?php }; ?>
		<?php endforeach; ?>
	</div>
	<br>
	<?php 
	$db = DataBase::getPdo();
	$options = $db->query('SELECT * FROM options'); ?>
	<div style="border-style:solid; width:400px; padding:20px">
		<p>choisir un siège </p>
		<?php
		foreach ($options as $option): 
			if($option['category'] === "seats"){ ?>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="vip_access" value="<?php echo $option['price'] ?>" name="<?php echo $option['option_id']?>">
					<label class="form-check-label" for="vip_access" name="<?php echo $option['name']?>"><?php echo $option['name'] . ' ' . $option['price'] ?> €</label>
				</div>
			<?php }; ?>
		<?php endforeach; ?>
	</div>
	<br>
	<div style="border-style:solid; width:400px; padding:20px">
		<?php 
		$db = DataBase::getPdo();
		$options = $db->query('SELECT * FROM options'); ?>
		<p>choisir une assistance </p>
		<?php
		foreach ($options as $option): 
			if($option['category'] === "assistance"){ ?>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="vip_access" value="<?php echo $option['price'] ?>" name="<?php echo $option['option_id']?>">
					<label class="form-check-label" for="vip_access" name="<?php echo $option['name']?>"><?php echo $option['name'] . ' ' . $option['price'] ?> €</label>
				</div>
				
			<?php }; ?>
		<?php endforeach; ?>
	</div>	
		
	<input type="submit" value="Ajouter">
</form>

</div>
