class_name Principal extends Node2D

@onready var tomate := $Tomate
@onready var label_sementes := $UI/Label_Sementes


func _process(_delta: float) -> void:
	label_sementes.text = str('Sementes: ', Player.sementes)


func _on_sementes_body_entered(body: Node2D) -> void:
	if body is Player:
		Player.sementes += 1
