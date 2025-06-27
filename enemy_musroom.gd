extends CharacterBody2D

const SPEED = 100

var direction = 1
@onready var ray_cast_left: RayCast2D = $"RayCast Left"
@onready var ray_cast_right: RayCast2D = $"RayCast Left/RayCast Right"
@onready var animated_sprite_2d = $AnimatedSprite2D
func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	position.x += direction * SPEED * delta
	
	velocity.x = direction * SPEED
	move_and_slide()

func _on_hitbox_body_entered(body):
	print("Hello")


func _on_kill_zone_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # Or use body is CharacterBody2D if you're more flexible
		body.queue_free()  # Instantly kills the player with no code in their script
		# OR restart scene:
		# get_tree().reload_current_scene()
		get_tree().reload_current_scene()
