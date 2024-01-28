extends Node

@onready var quota_text = $CanvasLayer/UIMain/RightPanel/CenterContainer/VBoxContainer/QuotaAmount
@onready var fuel_meter = $CanvasLayer/UIMain/FuelMeter
@onready var watcher = $CanvasLayer/UIMain/Watcher

var current_quota:int = 20
var current_count:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(_delta):
	# Debugging
	if Input.is_action_pressed("debug_1"):
		current_count = current_quota - 1

func _on_player_reticle_update_quota(amount):
	current_count += amount
	if current_count >= current_quota:
		current_quota += 10
		current_count = 0
		fuel_meter.refill_fuel()
		watcher.say_bark()
	quota_text.text = str(current_count) + "/" + str(current_quota)
