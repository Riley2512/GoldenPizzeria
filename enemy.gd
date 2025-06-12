extends CharacterBody2D

@export var speed := 40.0
@export var gravity := 500.0

var direction := -1

func _ready():
	$hitbox.body_entered.connect(_on_hitbox_body_entered)
	$AnimatedSprite2D.play("walk")  # Start animation

func _physics_process(delta):
	velocity.y += gravity * delta
	$ground_check.position.x = 10 * direction

	if not $ground_check.is_colliding():
		direction *= -1
		$AnimatedSprite2D.flip_h = direction > 0

	velocity.x = speed * direction
	move_and_slide()

func _on_hitbox_body_entered(body):
	if body.name == "Player" and body.has_method("die"):
		body.die()
