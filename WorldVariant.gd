extends Node2D

var numFoodCollected = 0

func _ready():
	$AudioStreamPlayer2D.play()
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	if(Input.is_action_just_pressed("ui_cancel")):
		get_tree().change_scene("res://MainMenu.tscn")
	pass
	
