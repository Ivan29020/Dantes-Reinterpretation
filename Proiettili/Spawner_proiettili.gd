class_name spawner_proiettili extends Node2D

@export var proiettile_arma : PackedScene

@export var velocita_fuoco : float = 1
@export var danno_proiettile : int = 10
@export var velocita_proiettile : int = 100
@export var spawner_giocatore : bool = false #false = spawner nemico, true = spawner giocatore

func crea_proiettile(dir) -> Area2D:
	
	var npro = proiettile_arma.instantiate()
	npro.vel = velocita_proiettile
	npro.danni = danno_proiettile
	npro.proiettile_giocatore = spawner_giocatore
	npro.dir = dir
	npro.global_position = global_position
	
	return npro

func spara(dir):
	if $velocitafuoco.is_stopped():
		var npro = crea_proiettile(dir)
		get_tree().get_root().add_child(npro) #migliorare
		$velocitafuoco.start()

func _on_velocitafuoco_ready():
	$velocitafuoco.wait_time = velocita_fuoco
