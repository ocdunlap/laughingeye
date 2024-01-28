extends Control

@onready var anim_player = $AnimationPlayer
@onready var barks_label = $Barks

var min_time_between_anims:float = 10
var max_time_between_anims:float = 20

var time_until_next_anim:float = 15
var bark_cooldown_default:float = 10

var bark_cooldown:float = 0 

var bark_keep_open:float = 5

var barks_list:Array = [
	"Pathetic...",
	"Don't make me laugh!",
	"Worthless.",
	"Do better.",
	"Not sufficient."
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_until_next_anim -= delta
	if time_until_next_anim <= 0:
		match randi_range(0,1):
			0: anim_player.play("eye-wander-1")
			1: anim_player.play("eye-wander-2")
			_:  anim_player.play("eye-wander-1")
		time_until_next_anim = randf_range(min_time_between_anims, max_time_between_anims)
	pass
	
	
func say_bark():
	# Set text
	barks_label.text = barks_list.pick_random()

	# Set timer, then clear
	var timer = get_tree().create_timer(bark_keep_open)
	await timer.timeout
	#timer.queue_free()
	barks_label.text = ""

