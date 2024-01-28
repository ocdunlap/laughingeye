extends Control

@onready var fill_texture:CanvasItem = $TextureRect

signal fuel_empty()

var fill_amount = 1;
var change_rate = 0.015;
var stop_fuel:bool = false # to prevent signal from continuing to emit


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not stop_fuel:
		fill_amount -= change_rate * delta;
		fill_texture.material.set_shader_parameter("fV", fill_amount)
		if fill_amount <= 0:
			stop_fuel = true
			emit_signal("fuel_empty")
	

func refill_fuel():
	fill_amount = 1;
