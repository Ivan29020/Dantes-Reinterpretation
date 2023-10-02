extends Node2D

const DEFAULT_DAMAGE = 10
const DEFAULT_ATKSPEED = 1
const DEFAULT_DEFENCE = 200
const DEFAULT_SPEED = 175

var damage : int = DEFAULT_DAMAGE
var attack_speed : float = DEFAULT_ATKSPEED
var defence : int = DEFAULT_DEFENCE
var speed : int = DEFAULT_SPEED


func set_stats():
	Global.Giocatore.get_node("Spawner_proiettili").danno_proiettile = damage
	Global.Giocatore.get_node("Spawner_proiettili").velocita_fuoco = attack_speed
	Global.Giocatore.SPEED = speed
	Global.Restrizione.dimensione = defence

func reset():
	damage = DEFAULT_DAMAGE
	attack_speed = DEFAULT_ATKSPEED
	defence = DEFAULT_DEFENCE
	speed = DEFAULT_SPEED
