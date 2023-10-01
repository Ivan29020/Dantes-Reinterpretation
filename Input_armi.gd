extends Node2D

@export var arma : NodePath

func _process(delta):
	
	var dir = (get_global_mouse_position() - global_position).normalized()
	
	if Input.is_action_pressed("ui_accept"):
		get_node(arma).spara(dir)
