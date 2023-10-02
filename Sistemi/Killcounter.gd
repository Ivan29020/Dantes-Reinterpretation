extends Control

@export var punteggio : int = 0 : set = aggiorna_punteggio
@export var obbiettivo : int = 5 : set = aggiorna_obbiettivo
@export var obbiettivo_hard : int = 10

var hard_active : bool = false
var is_forced_hard : bool = false

func aggiorna_punteggio(nuovo):
	punteggio = nuovo
	$Label.text = "Enemies to kill: " + str(punteggio) + "/" + str(obbiettivo)
	if punteggio >= obbiettivo and hard_active == false:
		#disattiva spawner
		Global.tree.get_node("Porta").open(true)
		for node in get_tree().get_nodes_in_group("spawner"):
			if !node.hard_mode:
				node.queue_free()
		if Global.Restrizione.dimensione < Global.Restrizione.max_dimensione * Global.Restrizione.PERCENTUALE_MODALITA_HARD:
			if $Timer.is_stopped():
				$Timer.start()
			is_forced_hard = true
			#hard mode forzata
		else:
			if $Timer.is_stopped():
				$Timer.start()
			is_forced_hard = false
			#hard mode volontaria
	elif punteggio >= obbiettivo and hard_active == true:
		Global.tree.get_node("Porta").open(true)

func aggiorna_obbiettivo(nuovo):
	obbiettivo = nuovo
	$Label.text = "Enemies to kill: " + str(punteggio) + "/" + str(obbiettivo)

func _on_timer_timeout():
	#inizia hard mode
	if !Global.fade.is_fading == true:
		hard_active = true
		Global.tree.get_node("Porta").open(false)
		for node in get_tree().get_nodes_in_group("spawner"):
			if node.hard_mode:
				node.get_node("Timer").start()
		$Label.modulate = Color(0.71,0.04,0.08,1)
		punteggio = 0
		obbiettivo = obbiettivo_hard
	
