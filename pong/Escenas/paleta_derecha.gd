extends CharacterBody2D

var speed_humano = 450.0

@onready var pelota = get_parent().get_node("Pelota")


func _physics_process(delta):
	if Global.modo_ia:
		ejecutar_ia(delta)
	else:
		mover_jugador_humano()


func mover_jugador_humano():
	var direction = Input.get_axis("Subir_derecha", "Bajar_derecha")
	velocity.y = direction * speed_humano
	move_and_slide()


# IA

func ejecutar_ia(delta):
	if pelota == null:
		print("No encuentra la pelota")
		return

	var y_pelota = pelota.global_position.y
	var y_paleta = global_position.y

	var vel_ia = 400.0
	var margen_reaccion = 20.0

	match Global.dificultad:
		"facil":
			vel_ia = 200.0
			margen_reaccion = 60.0
		"medio":
			vel_ia = 380.0
			margen_reaccion = 25.0
		"dificil":
			vel_ia = 600.0
			margen_reaccion = 5.0

	if y_pelota > y_paleta + margen_reaccion:
		velocity.y = vel_ia
	elif y_pelota < y_paleta - margen_reaccion:
		velocity.y = -vel_ia
	else:
		velocity.y = move_toward(velocity.y, 0, vel_ia * delta * 8)

	move_and_slide()
	
	
	
	
