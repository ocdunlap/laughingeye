extends Node2D

@onready var creature_zone = $CreatureSpawner

var spawn_range:float = 2000
var creature_countdown_default:float
# Will spawn one creature every this many seconds
var creature_countdown:float = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	creature_countdown_default = creature_countdown
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	creature_countdown -= delta
	if creature_countdown <= 0:
		spawn_creature()
		creature_countdown = creature_countdown_default
	pass


func spawn_creature():
	var scene_instance = load("res://ScenesGeneral/LittleGuys/little_bat.tscn").instantiate()
	creature_zone.add_child(scene_instance)
	# I'm bad at math
	var rand_x = randf_range(-spawn_range,spawn_range)
	if rand_x <= 0: rand_x -= 200
	if rand_x > 0: rand_x += 200
	var rand_y = randf_range(-spawn_range,spawn_range)
	if rand_y <= 0: rand_y -= 200
	if rand_y > 0: rand_y += 200
	scene_instance.global_position = Vector2(rand_x, rand_y)
	pass
