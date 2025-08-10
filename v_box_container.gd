extends Control

func _ready():
	$VBoxContainer/Margherita.pressed.connect(_on_pizza_chosen)
	$VBoxContainer/Pepperoni.pressed.connect(_on_pizza_chosen)
	$VBoxContainer/Veggie.pressed.connect(_on_pizza_chosen)

func _on_pizza_chosen():
	get_tree().change_scene_to_file("res://game.tscn")
