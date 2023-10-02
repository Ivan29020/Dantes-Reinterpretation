extends nemico_base

var dir 

func _on_timer_timeout():
	$Spawner_proiettili.spara(dir)

func _process(delta):
	
	dir = (Global.Giocatore.global_position  - global_position).normalized() 
	update_animation(dir)
	
	velocity = move_ai() * vel
	move_and_slide()


func get_direction_as_string():
	dir = (Global.Giocatore.global_position  - global_position).normalized() 
	if dir.x > 0 :
		return "right"
	if dir.x < 0 :
		return "left"
	if dir.y > 0 :
		return "down"
	if dir.y < 0 :
		return "up"

func move_ai():
	
	var direction : Vector2 = (Global.Giocatore.global_position - global_position).normalized()

	if global_position.distance_to(Global.Giocatore.global_position) > 160:
		return direction
	elif global_position.distance_to(Global.Giocatore.global_position) < 100:
		return -direction
	else:
		return Vector2.ZERO

func update_animation(dir): 
	$Sprite2D.play("Idle_" + get_direction_as_string())
