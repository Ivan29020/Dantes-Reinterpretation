class_name nemico_base extends CharacterBody2D

@export var vel : int = 50
@export var maxhp : int = 30
@export var hp : int = 30 : set = aggiorna_hp
@export var regen : int = 10 #quantita di spazio rigenerato quando uccidi il nemico
@export var punteggio : int = 5

func aggiorna_hp(newhp):
	
	hp = newhp
	if hp >= maxhp:
		hp = maxhp
	if hp <= 0:
		muori()

func muori():
	Global.Restrizione.dimensione += regen
	Global.Killcount.punteggio += punteggio
	queue_free()

func _process(delta):
	
	var dir = move_ai()
	
	#update_animation(movement)
	
	velocity = dir * vel
	move_and_slide()

func move_ai():
	
	var dir : Vector2 = (Global.Giocatore.global_position - global_position).normalized()
	
	return dir
