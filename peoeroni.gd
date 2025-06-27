extends Node2D

func _ready():
	# Connect to item pickup signal (e.g., in player or game manager script)
	var item = get_node("path_to_item")
	item.item_picked_up.connect(_on_item_picked_up)

func _on_item_picked_up(item):
	print("Picked up: ", item.item_name)
	# Add to inventory or trigger other logic
