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
	
	update_animation(movement)
	
	velocity = movement * vel_attuale
	move_and_slide()


#Funzione per Animazioni in movimento	
func update_animation(movement): 
	if movement.x > 0:
		$DanteAlighieri.play("walk_right")
		$Libro.play("book_idle_right")
		$Libro.position = Vector2(10,0)
		$Libro.visible = true
		
	elif movement.x < 0:
		$DanteAlighieri.play("walk_left")
		$Libro.play("book_idle_left")
		$Libro.position = Vector2(-10,0)
		$Libro.visible = true
		
	elif movement.y > 0:
		$DanteAlighieri.play("walk_down")
		$Libro.play("book_idle_down")
		$Libro.position = Vector2(0,10)
		$Libro.visible = true
				
	elif movement.y < 0:
		$DanteAlighieri.play("walk_up")
		$Libro.visible = false
		
