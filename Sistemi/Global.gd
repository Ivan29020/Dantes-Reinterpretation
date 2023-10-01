extends Node2D

var Giocatore
var Restrizione 
var Killcount 

func scene_changed():
	if !get_tree().current_scene.name == "Menu":
		var tree = get_tree().current_scene
		Giocatore = tree.get_node("Giocatore")
		Restrizione = tree.get_node("TileMap").get_node("Restrizione")
		Killcount = tree.get_node("TileMap").get_node("Killcounter")
