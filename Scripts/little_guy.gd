extends RigidBody2D

@onready var navAgent = $NavigationAgent2D

var timeUntilMove:float = 0
var minTimeRange:float = 3
var maxTimeRange:float = 8

var minDistance:float = -30
var maxDistance:float = 30

var target
var speed:float = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _physics_process(delta):
	if timeUntilMove <= 0:
		print ("moving")
		navAgent.target_position = position + Vector2(randf_range(minDistance,maxDistance), randf_range(minDistance,maxDistance))
		timeUntilMove = randf_range(minTimeRange, maxTimeRange)
	else:
		timeUntilMove -= delta
	
	if not navAgent.is_navigation_finished():
		target = navAgent.get_next_path_position()
		if global_position.distance_to(target) > 10:
			linear_velocity = position.direction_to(target) * speed
	
	pass
