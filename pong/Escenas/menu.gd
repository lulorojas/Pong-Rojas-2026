extends Control





func _on_ia_pressed() -> void:
	
	# Mostramos
	$Botones_inicio.hide()
	
	$Dificultades.show()
	
	$Volver_box.show()	


func _on_volver_pressed() -> void:
	$Botones_inicio.show()
	
	$Dificultades.hide()
	
	$Volver_box.hide()	


func _on_local_pressed() -> void:	

	Global.modo_ia = false
	get_tree().change_scene_to_file("res://Escenas/principal.tscn")
	
	




func _on_facil_pressed():
	Global.modo_ia = true
	Global.dificultad = "facil"
	get_tree().change_scene_to_file("res://Escenas/principal.tscn")

func _on_medio_pressed():
	Global.modo_ia = true
	Global.dificultad = "medio"
	get_tree().change_scene_to_file("res://Escenas/principal.tscn")

func _on_dificil_pressed():
	Global.modo_ia = true
	Global.dificultad = "dificil"
	get_tree().change_scene_to_file("res://Escenas/principal.tscn")
