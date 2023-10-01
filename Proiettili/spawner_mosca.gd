extends spawner_proiettili

@export var amount : int = 10
@export var spacing : float = 0.2 

var shot = 0
var direction : Vector2 = Vector2.ZERO

func spara(dir):
	if $velocitafuoco.is_stopped():
		direction = dir
		$Spacing.start()
		$velocitafuoco.start()

func _on_spacing_timeout():
	shot += 1
	if shot <= amount:
		var npro = crea_proiettile(direction)
		get_tree().get_root().add_child(npro) 
	else:
		shot = 0 
		$Spacing.stop()

func _on_spacing_ready():
	$Spacing.wait_time = spacing
