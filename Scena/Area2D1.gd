extends Area2D


var entered = false

func _ready():
	Global.scene_changed()

func _on_body_entered(body: PhysicsBody2D):
	entered = true

func _on_body_exited(body):
	entered = false
	
func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("button3"):
			get_tree().change_scene_to_file("res://Scena/piano_2.tscn")
