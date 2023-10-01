extends Control

@export var punteggio : int = 0 : set = aggiorna_punteggio
@export var obbiettivo : int = 50 : set = aggiorna_obbiettivo

func aggiorna_punteggio(nuovo):
	punteggio = nuovo
	$Label.text = "Enemies to kill: " + str(punteggio) + "/" + str(obbiettivo)
	if punteggio >= obbiettivo:
		for node in get_tree().get_nodes_in_group("spawner"):
			node.queue_free()
			$Timer.start()

func aggiorna_obbiettivo(nuovo):
	obbiettivo = nuovo
	$Label.text = "Enemies to kill: " + str(punteggio) + "/" + str(obbiettivo)

func _on_timer_timeout():
	#inizia hard mode
	for node in get_tree().get_nodes_in_group("hardmode"):
		node.get_node("Timer").start()
