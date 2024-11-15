class_name Principal extends Node2D

@onready var player := $Player
@onready var tomate := $Tomate
@onready var label_sementes := $UI/Label_Sementes


func _process(_delta: float) -> void:
	label_sementes.text = str('Sementes: ', player.sementes)
