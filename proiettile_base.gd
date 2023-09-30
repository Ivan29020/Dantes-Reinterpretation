extends Area2D

@export var danni : int = 10
@export var proiettile_giocatore : bool = false #false = proiettile nemico, true = proiettile giocatore

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
