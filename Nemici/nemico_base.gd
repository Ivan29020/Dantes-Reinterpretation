class_name nemico_base extends CharacterBody2D

@export var vel : int = 50
@export var maxhp : int = 30
@export var hp : int = 30 : set = aggiorna_hp
@export var regen : int = 10 #quantita di spazio rigenerato quando uccidi il nemico
@export var punteggio : int = 5
@export var danni_melee : int = 10

var morte = preload("res://animazione_morte.tscn")

func aggiorna_hp(newhp):
	
	
	hp = newhp
	if hp >= maxhp:
		hp = maxhp
	if hp <= 0:
		muori()
	$healthbar.value = hp

func muori():
	Global.Restrizione.dimensione += regen
	Global.Killcount.punteggio += punteggio
	var animorte = morte.instantiate()
	animorte.global_position = global_position
	get_tree().get_root().add_child(animorte) 
	queue_free()

func _process(delta):
	
	var dir = move_ai()
	
	#update_animation(movement)
	
	velocity = dir * vel
	move_and_slide()
	
	
	
	

func move_ai():
	
	var dir : Vector2 = (Global.Giocatore.global_position - global_position).normalized()
	
	return dir

func _on_healthbar_ready():
	$healthbar.max_value = maxhp
