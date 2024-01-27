extends CharacterBody2D

@onready var explode_effect:AnimatedSprite2D = $ExplodeEffect

# How fast the player moves
@export var speed = 180

var target_velocity = Vector2.ZERO

var current_hovered:Node2D

var play_shoot_anim:bool = false

#func _process(_delta):
	#if (play_shoot_anim):
		#explode_effect.play("fire")
	#else:
		#explode_effect.stop()
	#pass

func _physics_process(_delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1


	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.y = direction.y * speed

	# Moving the Character
	velocity = target_velocity
	move_and_slide()


func _on_fire_button_button_down():
	play_shoot_anim = true;
	explode_effect.play("fire")
	pass # Replace with function body.


func _on_explode_effect_animation_finished():
	play_shoot_anim = false;
	pass # Replace with function body.
