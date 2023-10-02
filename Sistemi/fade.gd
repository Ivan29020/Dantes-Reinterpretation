extends CanvasModulate

var is_fading = false

func _on_fades_animation_finished(anim_name):
	if anim_name == "fade_out":
		Global.upgrades.visibility(true)
		Global.upgrades.start_selection()
