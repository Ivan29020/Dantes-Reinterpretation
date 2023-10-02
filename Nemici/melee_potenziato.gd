extends nemico_base

var direction

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
	
	return direction
