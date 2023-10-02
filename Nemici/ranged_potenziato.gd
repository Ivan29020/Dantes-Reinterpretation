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

func move_ai():
	
	return Vector2.ZERO

func update_animation(dir): 
		$Sprite2D.play("Idle_" + get_direction_as_string())
