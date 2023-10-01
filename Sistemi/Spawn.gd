extends AnimatedSprite2D


@export var time : float = 3
@export var id : int = 1

# a ogni numero corrisponde un nemico
var diz_nemici = {
	1 : "res://Nemici/nemico_base.tscn" #solo per testing
	}

var nemico

func _ready():
	$Timer.wait_time = time
	$Timer.start()

func crea_nemico():
	var nnem = load(diz_nemici[id])
	nemico = nnem.instantiate()

func spawna_nemico():
	nemico.global_position = global_position
	Global.tree.add_child(nemico)

func _on_timer_timeout():
	crea_nemico()
	$Sprite2D.texture = nemico.get_node("Sprite2D").texture
	play("default")
	$AnimationPlayer.play("fade")

func _on_animation_player_animation_finished(anim_name):
	spawna_nemico()
	queue_free()
