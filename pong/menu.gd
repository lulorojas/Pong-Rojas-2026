extends Control


# Called when the node enters the scene tree for the first time.


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

	
	get_tree().change_scene_to_file("res://Escenas/principal.tscn")
	
