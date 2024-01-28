extends CharacterBody2D

@onready var explode_effect:AnimatedSprite2D = $ExplodeEffect

# How fast the player moves
@export var speed = 180

signal update_quota(amount:int)

var target_velocity = Vector2.ZERO

var current_hovered_bodies:Array = Array()

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
	explode_effect.play("fire")
	for i in current_hovered_bodies:
		i.queue_free()
	# later should connect manually
	emit_signal("update_quota", current_hovered_bodies.size())
	current_hovered_bodies.clear()
	pass # Replace with function body.


func _on_explode_effect_animation_finished():
	pass # Replace with function body.


func _on_shoot_radius_body_entered(body):
	current_hovered_bodies.append(body)
	pass # Replace with function body.


func _on_shoot_radius_body_exited(body):
	current_hovered_bodies.remove_at(current_hovered_bodies.find(body))
	pass # Replace with function body.


func _on_game_world_game_over():
	# stop physics (input)
	set_physics_process (false)
	# stop receiving signals
	var conns = get_incoming_connections()
	for cur_conn in conns:
		cur_conn.source.disconnect(cur_conn.signal_name, self, cur_conn.method_name)
