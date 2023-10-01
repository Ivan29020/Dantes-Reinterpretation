extends spawner_proiettili

func spara(dir):
	if $velocitafuoco.is_stopped():
		var npro = crea_proiettile(dir)
		get_tree().get_root().add_child(npro) #migliorare
		$velocitafuoco.start()
