extends CharacterBody2D




var speed = 400

func _physics_process(delta):

	var direction = 0

	if Input.is_action_pressed("Subir_izquierda"):
		direction -= 1

	if Input.is_action_pressed("Bajar_izquierda"):
		direction += 1

	velocity.y = direction * speed

	move_and_slide()
