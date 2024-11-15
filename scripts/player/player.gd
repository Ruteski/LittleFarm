class_name Player extends CharacterBody2D

@export_category("Variaveis")
@export var _move_speed: float = 75.0

@export_category("Objetos")
@export var _animation: AnimationPlayer

var sementes: int = 1


func _physics_process(_delta: float) -> void:
	move()
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
		if velocity.x > 0:
			_animation.play("walk_right")
		else:
			_animation.play("walk_left")
	else:
		_animation.play("idle")


func _plantou_tomate() -> void:
	sementes -= 1
