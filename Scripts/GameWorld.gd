extends Node

@onready var quota_text = $CanvasLayer/UIMain/RightPanel/CenterContainer/VBoxContainer/QuotaAmount

var current_quota:int = 20
var current_count:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	

func _on_player_reticle_update_quota(amount):
	current_count += amount
	quota_text.text = str(current_count) + "/" + str(current_quota)
	pass # Replace with function body.
