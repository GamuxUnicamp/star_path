extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$NewGame.connect("pressed",self,"_new_game")
	$Credits.connect("pressed",self,"_credits")
	$Quit.connect("pressed",self,"_quit")
	pass # Replace with function body.

func _new_game():
	pass
func _credits():
	pass
func _quit():
	get_tree().quit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
