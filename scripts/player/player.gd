class_name Player extends CharacterBody2D

@export_category("Variaveis")
@export var _move_speed: float = 75.0

@export_category("Objetos")
@export var _animation: AnimationPlayer

@onready var _texture := $Texture


func _physics_process(_delta: float) -> void:
	move()
	flip_sprite()
	animate()


func move() -> void:
	# o get_vector automagicamente normaliza o vetor
	var _direction: Vector2 = Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)
	
	velocity = _direction * _move_speed
	move_and_slide()


func animate() -> void:
	if velocity:
		_animation.play("walk")
	else:
		_animation.play("idle")


func flip_sprite() -> void:
	if velocity.x > 0:
		_texture.flip_h = true
	elif velocity.x < 0:
		_texture.flip_h = false


func _plantou_tomate() -> void:
	global_dados.sementes -= 1


func _on_sementes_body_entered(_body: Node2D) -> void:
	global_dados.sementes += 1
