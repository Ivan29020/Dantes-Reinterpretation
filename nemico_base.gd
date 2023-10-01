extends CharacterBody2D

var vel : int = 200
var maxhp : int = 100
var hp : int = 100 : set = aggiorna_hp
var punteggio : int = 10 #quantita di spazio rigenerato quando uccidi il nemico

func aggiorna_hp(newhp):
	
	hp += newhp
	if hp > maxhp:
		hp = maxhp
	if hp <= 0:
		muori()

func muori():
	#aggiungere codice per incrementare dimensione
	queue_free()

func _process(delta):
	
	var dir = move_ai()
	
	#update_animation(movement)
	
	velocity = dir * vel
	move_and_slide()

func move_ai():
	
	var dir : Vector2 = Vector2.ZERO
	
	#prendere la posizione del giocatore una volta che diventa globale
	dir = (global_position - Vector2.ZERO).normalized() #Temporaneo
	
	return dir
