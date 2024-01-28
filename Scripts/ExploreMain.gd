extends Node2D

@onready var creature_zone = $CreatureSpawner

@export var creature_scenes:Array

var spawn_range_x:float = 2000
var spawn_range_y:float = 1500
var creature_countdown_default:float
# Will spawn one creature every this many seconds
var creature_countdown:float = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	creature_countdown_default = creature_countdown


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	creature_countdown -= delta
	if creature_countdown <= 0:
		spawn_creature()
		creature_countdown = creature_countdown_default
	pass


func spawn_creature():
	var scene_instance = load(creature_scenes.pick_random()).instantiate()
	creature_zone.add_child(scene_instance)
	var rand_x = randf_range(-spawn_range_x,spawn_range_x)
	var rand_y = randf_range(-spawn_range_y,spawn_range_y)
	scene_instance.global_position = Vector2(rand_x, rand_y)

