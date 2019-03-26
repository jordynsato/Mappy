extends Control

var count = 0
var soundCount = 0

func _ready():
	$AudioStreamPlayer2D.play()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://MainMenu.tscn")


func _on_Music_toggled(button_pressed):
	count = count+1
	if(count%2== 0):
		$AudioStreamPlayer2D.play()
	else:
		$AudioStreamPlayer2D.stop()

	#	musicPlayer.volume_db=0
	pass # replace with function body




