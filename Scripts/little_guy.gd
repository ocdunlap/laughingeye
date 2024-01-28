extends RigidBody2D

@onready var navAgent = $NavigationAgent2D

var timeUntilMove:float = 0
var minTimeRange:float = 1
var maxTimeRange:float = 8

var minDistance:float = -50
var maxDistance:float = 50

var target
var speed:float = 50


func _ready():
	pass
	
	
func _physics_process(delta):
	if timeUntilMove <= 0:
		navAgent.target_position = random_pos_in_range()
		timeUntilMove = randf_range(minTimeRange, maxTimeRange)
	else:
		timeUntilMove -= delta
	
	if not navAgent.is_navigation_finished():
		target = navAgent.get_next_path_position()
		if global_position.distance_to(target) > 5:
			linear_velocity = position.direction_to(target) * speed
	
	pass
	
	
func random_pos_in_range():
	return position + Vector2(randf_range(minDistance,maxDistance), randf_range(minDistance,maxDistance))
