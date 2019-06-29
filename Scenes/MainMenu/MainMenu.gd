extends Control

func _ready():
	$NewGame.connect("pressed",self,"_new_game")
	$Credits.connect("pressed",self,"_credits")
	$Quit.connect("pressed",self,"_quit")

func _new_game():
	get_tree().change_scene("res://Scenes/ShipScene/ShipScene.tscn")
	pass
func _credits():
	pass
func _quit():
	get_tree().quit()