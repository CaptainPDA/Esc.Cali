extends "res://engine/entity.gd"

var death = 0

func _physics_process(delta):
	
	if death != 0:
		player_death()
	else:
		movement()
	
func movement():
	motion = move_and_slide(motion, UP)
	player_angle()
	motion.y += GRAVITY
	motion.x += ACCELERATION
	motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = JUMP_HEIGHT
	
	

func player_angle():
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			var normal = collision.normal
			$Sprite.global_rotation = normal.angle()

	
func player_death():
	motion.x = 0
	motion.y = 0


func _on_Area2D_body_entered(body):
	death = 1
