extends Area2D


var entered = false

@export var scena : String

func _ready():
	Global.scene_changed()

func _on_body_entered(body: PhysicsBody2D):
	if body == Global.Giocatore:
		entered = true

func _on_body_exited(body):
	if body == Global.Giocatore:
		entered = false
	
func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("button3"):
			if Global.Killcount.punteggio >= Global.Killcount.obbiettivo:
				get_tree().change_scene_to_file(scena)
