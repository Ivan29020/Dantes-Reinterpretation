extends nemico_base

var direction
var stopped = false

func _physics_process(delta):
	var dir = (Global.Giocatore.global_position  - global_position).normalized() 
	update_animation(dir)

func get_direction_as_string():
	var dir = (Global.Giocatore.global_position  - global_position).normalized() 
	if dir.x >= 0 :
		return "right"
	if dir.x < 0 :
		return "left"

func update_animation(dir): 
		$Sprite2D.play("Idle_" + get_direction_as_string())

func move_ai():
	
	var direction = (Global.Giocatore.global_position  - global_position).normalized() 
	
	if !stopped:
		if global_position.distance_to(Global.Giocatore.global_position) > 5:
			return direction
		else: 
			stopped = true
			$Timer.start()
	else:
		direction = Vector2.ZERO
	
	return direction


func _on_timer_timeout():
	stopped = false
