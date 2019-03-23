extends KinematicBody2D

var velocity = Vector2(0,0)
export var SPEED = 300

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$Sprite.flip_h = true
		$Sprite.frame = $Sprite.frame + 1
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$Sprite.flip_h = false
		$Sprite.frame = $Sprite.frame + 1
	else:
		velocity.x = 0
		$Sprite.frame = 0
	
	move_and_slide(velocity)
