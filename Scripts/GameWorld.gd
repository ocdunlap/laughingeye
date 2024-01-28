extends Node

@onready var quota_text = $CanvasLayer/UIMain/RightPanel/CenterContainer/VBoxContainer/QuotaAmount
@onready var fuel_meter = $CanvasLayer/UIMain/FuelMeter
@onready var watcher = $CanvasLayer/UIMain/Watcher
@onready var game_over_menu = $CanvasLayer/GameOverMenu
@onready var intro_menu = $CanvasLayer/IntroMenu

signal game_over()
signal quota_met()

var current_quota:int = 20
var current_count:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
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
		emit_signal("quota_met")
	quota_text.text = str(current_count) + "/" + str(current_quota)


func _on_retry_button_button_down():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_button_button_down():
	get_tree().quit()


func _on_fuel_meter_fuel_empty():
	#emit_signal("game_over")
	game_over_menu.visible = true
	get_tree().paused = true


func _on_start_button_button_down():
	get_tree().paused = false
	intro_menu.visible = false

