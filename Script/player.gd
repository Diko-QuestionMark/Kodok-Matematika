extends CharacterBody2D

@onready var jump_sound = $JumpSound

const SPEED = 250.0
const JUMP_VELOCITY = -400.0
var can_move = true

func _physics_process(delta: float) -> void:
	if Global.panel_aktif:
		can_move = false
	else:
		can_move = true
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor() and can_move:
		velocity.y = JUMP_VELOCITY
		var pitch = randf_range(0.9, 1.1)
		jump_sound.pitch_scale = pitch
		jump_sound.play()
	var direction := Input.get_axis("left", "right")
	if direction and can_move:
		$AnimatedSprite2D.play("run")
		velocity.x = direction * SPEED
	else:
		$AnimatedSprite2D.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
	
	#Animasi
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
	elif direction == -1:
		$AnimatedSprite2D.flip_h = true
	if velocity.y > 0:
		$AnimatedSprite2D.play("fall")
	if velocity.y < 0:
		$AnimatedSprite2D.play("jump")
