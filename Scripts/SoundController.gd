extends Node

@onready var glitch_sfx = $GlitchSFX
@onready var shoot_sfx = $ShootSFX


func _on_fire_button_button_down():
	shoot_sfx.play()


func _on_game_world_quota_met():
	glitch_sfx.play()
