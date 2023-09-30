extends CharacterBody2D


@export var SPEED = 2000.0
const RALLENTAMENTO = 0.5


#Movimento giocatore
func _physics_process(delta):
	var vel_attuale = SPEED
	if Input.is_action_pressed("ui_accept"):
		vel_attuale = SPEED * RALLENTAMENTO 
	
	
	
	var movement = Vector2()
	movement.x = Input.get_axis("ui_left","ui_right")
	movement.y = Input.get_axis("ui_up","ui_down")
	movement = movement.normalized()
	
	
	
	update_animation(movement)
	
	velocity = movement * vel_attuale
	move_and_slide()
	
func update_animation(movement): 
	if movement.x > 0:
		$DanteAlighieri.play("walk_right")
	elif movement.x < 0:
		$DanteAlighieri.play("walk_left")
	elif movement.y > 0:
		$DanteAlighieri.play("walk_down")
	elif movement.y < 0:
		$DanteAlighieri.play("walk_up")
