extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var SPEED = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	set_physics_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.y -= SPEED*delta
	pass
