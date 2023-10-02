extends spawner_proiettili

@export var amount : int = 10
@export var spacing : float = 0.2 
@export var spazio : float = 8
@export var quantita : int = 3

var shot = 0
var direction : Vector2 = Vector2.ZERO
var dirmod : Vector2 

func spara(dir):
	if $velocitafuoco.is_stopped():
		dirmod = dir
		if quantita % 2 == 0:
			dirmod = dirmod.rotated(deg_to_rad(-((float(quantita) / 2.0) - 0.5) * spazio)) 
		elif quantita != 1:
			dirmod = dirmod.rotated(deg_to_rad(-((quantita - 1) / 2) * spazio))
		$Spacing.start()
		$velocitafuoco.start()
		

func _on_spacing_timeout():
	shot += 1
	if shot <= amount:
		for i in quantita:
			var npro = crea_proiettile(dirmod.rotated(deg_to_rad((i-1)*spazio)))
			get_tree().get_root().add_child(npro) 
	else:
		shot = 0 
		$Spacing.stop()

func _on_spacing_ready():
	$Spacing.wait_time = spacing
