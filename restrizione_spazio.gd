extends Area2D

var max_dimensione : int = 400
var dimensione : int = 400 : set = cambia_dimensione;
var velocita_restrizione : float = 0.5

const PERCENTUALE_MODALITA_HARD = 0.35
const PERCENTUALE_MORTE = 0.05

signal hard_mode_threshold(is_hard_mode : bool)

func cambia_dimensione(dim : int): 
	dimensione += dim
	$CollisionShape2D.shape.radius = dimensione 
	$PointLight2D.Texture_scale = dimensione/50
	hard_mode_threshold.emit(dimensione < max_dimensione * PERCENTUALE_MODALITA_HARD)
	if dimensione < max_dimensione * PERCENTUALE_MODALITA_HARD:
		$PointLight2D.Color = Color(0.96,1.0,0.66,1)
	else:
		$PointLight2D.Color = Color(0.96,0.47,0.48,1)

func _on_restriction_tick_timeout():
	cambia_dimensione(-velocita_restrizione)

func _on_body_exited(body):
	if body is CharacterBody2D: #NOTA: Inserire la classe del giocatore
		$timer_morte.start()

func _on_body_entered(body):
	if body is CharacterBody2D: #NOTA: Inserire la classe del giocatore
		$timer_morte.stop()

func _on_timer_morte_timeout():
	# Codice per il game over
	get_tree().change_scene_to_file("res://Menu/menu.tscn")
