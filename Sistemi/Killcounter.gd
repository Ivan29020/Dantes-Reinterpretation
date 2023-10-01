extends Control

var punteggio : int = 0 : set = aggiorna_punteggio
var obbiettivo : int = 10 : set = aggiorna_obbiettivo

signal obbiettivo_raggiunto(raggiunto : bool)

func aggiorna_punteggio(nuovo):
	punteggio += nuovo
	$Label.text = "Enemies to kill: " + str(punteggio) + "/" + str(obbiettivo)
	obbiettivo_raggiunto.emit(punteggio >= obbiettivo)

func aggiorna_obbiettivo(nuovo):
	obbiettivo += nuovo
	$Label.text = "Enemies to kill: " + str(punteggio) + "/" + str(obbiettivo)

