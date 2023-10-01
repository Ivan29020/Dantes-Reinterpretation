extends Control

func _ready():
	Global.scene_changed()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scena/piano_1.tscn")

func _on_quit_pressed():
	get_tree().quit()
