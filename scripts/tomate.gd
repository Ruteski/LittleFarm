class_name Tomate extends Node2D

@onready var animated_sprite := $AnimatedSprite2D

var can_plant: bool = false


func _ready() -> void:
	hide()


func _process(_delta: float) -> void:
	plantar()


func plantar() -> void:
	if can_plant && Player.sementes > 0 && Input.is_action_just_released("ui_accept"):
		Player.plantou_tomate()
		show()
		await get_tree().create_timer(3.0).timeout
		animated_sprite.frame = 1
		
		await get_tree().create_timer(5.0).timeout
		animated_sprite.frame = 2
		
		await get_tree().create_timer(7.0).timeout
		animated_sprite.frame = 3
		
		await get_tree().create_timer(10.0).timeout
		animated_sprite.frame = 4


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		can_plant = true


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		can_plant = false
