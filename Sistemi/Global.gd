extends Node2D

var Giocatore
var Restrizione 
var Killcount 
var tree
var upgrades
var fade

func scene_changed():
	if !get_tree().current_scene.name == "Menu" and !get_tree().current_scene.name == "game_over" and !get_tree().current_scene.name == "victory":
		tree = get_tree().current_scene
		Giocatore = tree.get_node("Giocatore")
		Restrizione = tree.get_node("Restrizione")
		Killcount = tree.get_node("Killcounter")
		upgrades = tree.get_node("TileMap").get_node("Camera2D").get_node("Upgrades")
		fade = tree.get_node("CanvasModulate")
		fade.get_node("fades").play("fade_in")
		StatManager.set_stats()
	StatManager.reset()
