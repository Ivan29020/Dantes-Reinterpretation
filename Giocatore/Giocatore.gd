extends CharacterBody2D


@export var SPEED = 2000.0
const RALLENTAMENTO = 0.5


#Movimento giocatore
func _physics_process(delta):
	var vel_attuale = SPEED
	if Input.is_action_pressed("button2"):
		vel_attuale = SPEED * RALLENTAMENTO	
	var movement = Vector2()
	movement.x = Input.get_axis("button_left","button_right")
	movement.y = Input.get_axis("button_up","button_down")
	movement = movement.normalized()
	if movement != Vector2.ZERO :
		$RayCast2D.target_position = movement * 32
	update_animation(movement)
	
	velocity = movement * vel_attuale
	move_and_slide()
func get_direction_as_string():
	var dir = $RayCast2D.target_position
	if dir.x > 0 :
		return "right"
	if dir.x < 0 :
		return "left"
	if dir.y > 0 :
		return "down"
	if dir.y < 0 :
		return "up"
	

#Funzione per Animazioni in movimento	
func update_animation(movement): 
	if movement != Vector2.ZERO :
		$DanteAlighieri.play("walk_" + get_direction_as_string())
		$Libro.play("book_idle_" + get_direction_as_string())
		if get_direction_as_string() == "right":
			$Libro.position = Vector2(10,0)
		elif get_direction_as_string() == "left":
			$Libro.position = Vector2(-10,0)
		elif get_direction_as_string() == "down":
			$Libro.position = Vector2(0,10)
		elif get_direction_as_string() == "up":
			$Libro.position = Vector2(0,-10)
		if get_direction_as_string() != "up" :
			$Libro.visible = true
		else:
			$Libro.visible = false
	else :
		$DanteAlighieri.play("Idle_" + get_direction_as_string())
		

func _on_hitbox_body_entered(body):
	if body is nemico_base:
		Global.Restrizione.dimensione -= body.danni_melee
