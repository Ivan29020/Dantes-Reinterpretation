extends AnimatedSprite2D


@export var time : float = 3
@export var id : int = 1
@export var hard_mode : bool = false

# a ogni numero corrisponde un nemico
var diz_nemici = {
	1 : "res://Nemici/nemico_base.tscn", #solo per testing
	2 : "res://Nemici/nemico_melee.tscn",
	3 : "res://Nemici/nemico_ranged.tscn",
	4 : "res://Nemici/mosca_ranged.tscn",
	5 : "res://Nemici/melee_potenziato.tscn",
	6 : "res://Nemici/ranged_potenziato.tscn",
	7 : "res://Nemici/mosca_potenziata.tscn",
	8 : "res://Nemici/mage.tscn"
	}
var nemico

func _ready():
	$Timer.wait_time = time
	if !hard_mode:
		$Timer.start()
		return
	

func crea_nemico():
	var nnem = load(diz_nemici[id])
	nemico = nnem.instantiate()

func spawna_nemico():
	nemico.global_position = global_position
	Global.tree.add_child(nemico)

func _on_timer_timeout():
	crea_nemico()
	$Sprite2D.texture = nemico.get_node("Sprite2D").sprite_frames.get_frame_texture("Idle_right",0)
	visible = true
	play("default")
	$AnimationPlayer.play("fade")

func _on_animation_player_animation_finished(anim_name):
	spawna_nemico()
	queue_free()
