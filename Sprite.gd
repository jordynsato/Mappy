extends Sprite
var opened_door = preload("res://door_open.png")
var closed_door = preload("res://closed_door.png")
var player_overlapping
var door_open
var door_pos_x 
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	player_overlapping = false
	door_open = false
	door_pos_x = position.x
	
func _process(delta):
	if(Input.is_action_just_pressed("ui_select") && player_overlapping):
		if door_open:
			texture = closed_door
			door_open = false
			position.x = door_pos_x
			$StaticBody2D.set_collision_layer_bit(0, true) 
		else:
			texture = opened_door
			door_open = true
			position.x = door_pos_x + 18
			#18 just happens to be the number that aligns closed door's left edge
			#to opened door's left edge
			$StaticBody2D.set_collision_layer_bit(0, false) 


func _on_DoorArea_body_entered(body):
	if body.get_name() == "Player":
		player_overlapping = true
		
	
	
func _on_DoorArea_body_exited(body):
	if body.get_name() == "Player":
		player_overlapping = false
		
