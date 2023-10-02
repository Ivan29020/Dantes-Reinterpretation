extends Area2D


var entered = false

@export var scena : String

var is_open : bool = false

func _ready():
	Global.scene_changed()

func _on_body_entered(body: PhysicsBody2D):
	if body == Global.Giocatore:
		entered = true

func _on_body_exited(body):
	if body == Global.Giocatore:
		entered = false

func open(apri):
	is_open = apri

func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("button3"):
			if is_open == true:
				Global.upgrades.move_to = scena
				Global.fade.get_node("fades").play("fade_out")
				Global.fade.is_fading = true
				Global.Restrizione.visible = false
