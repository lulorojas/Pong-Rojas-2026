extends CharacterBody2D

@export var initial_speed = 400.0
@export var speed_increment = 40.0 
@export var max_speed = 1500.0

var speed = 0.0
var direction = Vector2.ZERO
var start_position : Vector2 # Aquí guardamos tu posición manual
var score_izq = 0
var score_der = 0

# Referencia al marcador
@onready var label_marcador = get_node("../CanvasLayer/Marcador")

func _ready():
	# Guardamos la posición donde la pusiste vos en el editor
	start_position = position 
	reset_pelota()

func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	
	if collision:
		direction = direction.bounce(collision.get_normal())
		if collision.get_collider().is_in_group("paletas"):
			apply_speed_boost()

func apply_speed_boost():
	if speed < max_speed:
		speed += speed_increment

func reset_pelota():
	# Vuelve al lugar original y reinicia velocidad
	position = start_position 
	speed = initial_speed
	randomize_direction()
	actualizar_interfaz()

func randomize_direction():
	direction.x = [1, -1].pick_random()
	direction.y = randf_range(-0.7, 0.7)
	direction = direction.normalized()

func actualizar_interfaz():
	if label_marcador:
		label_marcador.text = str(score_izq) + " - " + str(score_der)

# --- ESTAS FUNCIONES SE ACTIVAN CON LOS AREA2D ---

func _on_arco_izquierdo_body_entered(body):
	if body == self: # Si la pelota entró al arco izquierdo
		score_der += 1
		reset_pelota()

func _on_arco_derecho_body_entered(body):
	if body == self: # Si la pelota entró al arco derecho
		score_izq += 1
		reset_pelota()
