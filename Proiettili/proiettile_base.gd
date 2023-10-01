class_name proiettile extends Area2D

var danni : int = 10
var proiettile_giocatore : bool = false : set = cambia_tipo #false = proiettile nemico, true = proiettile giocatore

var dir : Vector2 = Vector2.ZERO 
var vel : int = 100

func _physics_process(delta):
	
	position += (dir * vel) * delta
	$Sprite2D.rotation = dir.angle()

func _on_body_entered(body):
	if proiettile_giocatore:
		body.hp -= danni
	else:
		pass #aggiungere codice per diminure dimensione qualora il giocatore viene colpito

func cambia_tipo(tipo):
	proiettile_giocatore = tipo
	if proiettile_giocatore:
		set_collision_layer_value(12,true)
		set_collision_layer_value(11,false)
		set_collision_mask_value(1,false)
		set_collision_mask_value(2,true)
	else:
		set_collision_layer_value(11,true)
		set_collision_layer_value(12,false)
		set_collision_mask_value(2,false)
		set_collision_mask_value(1,true)
