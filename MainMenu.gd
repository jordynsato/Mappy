extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Start_OG_Game_pressed():
	get_tree().change_scene("res://World.tscn")
	pass # replace with function body


func _on_Sound_Menu_pressed():
	get_tree().change_scene("res://SoundMenu.tscn")
	pass # replace with function body
