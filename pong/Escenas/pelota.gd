extends CharacterBody2D

@export var initial_speed = 400.0
@export var speed_increment = 40.0 
@export var max_speed = 1500.0

var speed = 0.0
var direction = Vector2.ZERO
var start_position : Vector2 
var score_izq = 0
var score_der = 0


@onready var label_marcador = get_node("../CanvasLayer/Marcador")

func _ready():
	
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

	position = start_position 
	speed = initial_speed
	randomize_direction()
	actualizar_interfaz()

func randomize_direction():
	direction.x = [1, -1].pick_random()
	direction.y = randf_range(-0.7, 0.7)
	direction = direction.normalized()

func actualizar_interfaz():
	# Si alguien llegó a 5, reseteamos todo el marcador
	if score_izq >= 5 or score_der >= 5:
		score_izq = 0
		score_der = 0
	
	if label_marcador:
		label_marcador.text = str(score_izq) + " - " + str(score_der)

# --- 

func _on_arco_izquierdo_body_entered(body):
	if body == self: 
		
		score_izq += 1 
		reset_pelota()

func _on_arco_derecho_body_entered(body):
	if body == self: 
		
		score_der += 1 
		reset_pelota()
