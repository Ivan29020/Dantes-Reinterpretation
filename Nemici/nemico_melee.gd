extends nemico_base

func _physics_process(delta):
	var dir = (Global.Giocatore.global_position  - global_position).normalized() 
	update_animation(dir)

func get_direction_as_string():
	var dir = (Global.Giocatore.global_position  - global_position).normalized() 
	if dir.x > 0 :
		return "right"
	if dir.x < 0 :
		return "left"
	if dir.y > 0 :
		return "down"
	if dir.y < 0 :
		return "up"

func update_animation(dir): 
		$Sprite2D.play("Idle_" + get_direction_as_string())
