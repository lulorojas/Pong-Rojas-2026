extends CanvasLayer

# Referencia al fondo que creaste (ajustá el nombre si es distinto)
@onready var fondo_pausa = $ColorRect 

func _ready():
	# Nos aseguramos de que empiece escondido al arrancar el juego
	fondo_pausa.hide()

func _input(event):
	# "ui_cancel" es la tecla Escape por defecto en Godot
	if event.is_action_pressed("Abri_menu_pausa"):
		toggle_pausa()

func toggle_pausa():
	# Invertimos el estado: si estaba pausado, se despausa, y viceversa
	var estado_actual = get_tree().paused
	get_tree().paused = !estado_actual
	
	# Mostramos u ocultamos el menú visualmente
	fondo_pausa.visible = !estado_actual

# --- CONEXIÓN DE BOTONES ---



	

	


func _on_continuar_pressed() -> void:
	toggle_pausa()


func _on_reiniciar_pressed() -> void:
	toggle_pausa() # Despausamos antes de reiniciar
	get_tree().reload_current_scene()


func _on_salir_pressed() -> void:
	toggle_pausa() # Despausamos para que el menú de inicio funcione
	get_tree().change_scene_to_file("res://Escenas/menu.tscn")
