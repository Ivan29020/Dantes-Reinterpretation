extends Control

# texture/descrizione
var move_to

const NBUFF = 4
var buff : Dictionary = {
	1 : ["res://Grafiche/Stats/Attack Up Power Up.png","Attack damage Up"], 
	2 : ["res://Grafiche/Stats/Attack Speed Up Power Up.png","Attack Speed Up"],
	3 : ["res://Grafiche/Stats/Defence Up Buff.png","Defence Up"],
	4 : ["res://Grafiche/Stats/Speed Up power up.png","Speed Up"]
}

const NDEBUFF = 4
var debuff : Dictionary = {
	1 : ["res://Grafiche/Stats/Attack Down Debuff.png","Attack damage down"],
	2 : ["res://Grafiche/Stats/Attack Speed Down Debuff.png","Attack Speed Down"],
	3 : ["res://Grafiche/Stats/Defence Down Debuff.png","Defence Down"],
	4 : ["res://Grafiche/Stats/Speed Down Debuff.png","Speed Down"]
}

var random = RandomNumberGenerator.new()
var arr = [0,0,0]
var is_debuff : bool = false

var is_hardmode : bool = false
var is_forced : bool = false

func visibility(vis):
	visible = vis
	$CanvasLayer.visible = vis
	$CanvasLayer/MarginContainer/HBoxContainer/MarginContainer/Button1.disabled = !vis
	$CanvasLayer/MarginContainer/HBoxContainer/MarginContainer2/Button2.disabled = !vis
	$CanvasLayer/MarginContainer/HBoxContainer/MarginContainer3/Button3.disabled = !vis

func start_selection():
	select_buff()
	is_hardmode = Global.Killcount.hard_active
	is_forced = Global.Killcount.is_forced_hard

func select_buff():
	generate(NBUFF)
	set_graphics_buff()
	is_debuff = false

func select_debuff():
	generate(NDEBUFF)
	set_graphics_debuff()
	is_debuff = true

func generate(num):
	random.randomize()
	var i = 2 
	while i >= 0: 
		var cont = false
		var n  = (randi() % num) + 1
		for elem in arr:
			if elem == n:
				cont = true
		if cont:
			continue
		arr[i] = n
		i -= 1

func set_graphics_buff():
	$CanvasLayer/MarginContainer/HBoxContainer/MarginContainer/Up1/TextureRect.texture = load(buff[arr[0]][0])
	$CanvasLayer/MarginContainer/HBoxContainer/MarginContainer/Up1/Label.text = buff[arr[0]][1]
	$CanvasLayer/MarginContainer/HBoxContainer/MarginContainer2/Up2/TextureRect.texture = load(buff[arr[1]][0])
	$CanvasLayer/MarginContainer/HBoxContainer/MarginContainer2/Up2/Label.text = buff[arr[1]][1]
	$CanvasLayer/MarginContainer/HBoxContainer/MarginContainer3/Up3/TextureRect.texture = load(buff[arr[2]][0])
	$CanvasLayer/MarginContainer/HBoxContainer/MarginContainer3/Up3/Label.text = buff[arr[2]][1]

func set_graphics_debuff():
	$CanvasLayer/MarginContainer/HBoxContainer/MarginContainer/Up1/TextureRect.texture = load(debuff[arr[0]][0])
	$CanvasLayer/MarginContainer/HBoxContainer/MarginContainer/Up1/Label.text = debuff[arr[0]][1]
	$CanvasLayer/MarginContainer/HBoxContainer/MarginContainer2/Up2/TextureRect.texture = load(debuff[arr[1]][0])
	$CanvasLayer/MarginContainer/HBoxContainer/MarginContainer2/Up2/Label.text = debuff[arr[1]][1]
	$CanvasLayer/MarginContainer/HBoxContainer/MarginContainer3/Up3/TextureRect.texture = load(debuff[arr[2]][0])
	$CanvasLayer/MarginContainer/HBoxContainer/MarginContainer3/Up3/Label.text = debuff[arr[2]][1]

func buff_effects(idbuff):
	match idbuff:
		1:
			StatManager.damage *= 1.35
		2:
			StatManager.attack_speed *= 0.8
		3:
			StatManager.defence += 15
		4:
			StatManager.speed *= 1.15

func debuff_effects(iddebuff):
	match iddebuff:
		1:
			StatManager.damage *= 0.35
		2:
			StatManager.attack_speed *= 1.2
		3:
			StatManager.defence -= 15
		4:
			StatManager.speed *= 0.15

func select(selection):
	if is_debuff:
		$debuffpickup.play()
		debuff_effects(arr[selection])
		get_tree().change_scene_to_file(move_to)
		return
	$buffpickup.play()
	buff_effects(arr[selection])
	if is_hardmode:
		select_buff()
		is_hardmode = false
		return
	if is_forced:
		select_debuff()
		is_forced = false
		return
	get_tree().change_scene_to_file(move_to)

func _on_button_1_pressed():
	select(0)

func _on_button_2_pressed():
	select(1)

func _on_button_3_pressed():
	select(2)

