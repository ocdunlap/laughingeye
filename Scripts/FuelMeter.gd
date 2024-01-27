extends Control

@onready var fill_texture:CanvasItem = $TextureRect

var fill_amount = 1;
var change_rate = 0.015;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print (fill_amount)
	fill_amount -= change_rate * delta;
	fill_texture.material.set_shader_parameter("fV", fill_amount)
	pass
