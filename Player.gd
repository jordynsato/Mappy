extends KinematicBody2D

var velocity = Vector2(0,0)
export var SPEED = 300
export var gravity = 800
export var jumpV = -800

func _ready():
    # Called when the node is added to the scene for the first time.
    # Initialization here
    pass

func _process(delta):
	if(Input.is_action_pressed("move_left") and velocity.y <= 0):#(velocity.y == 0 or velocity.y == jumpV)):
        velocity.x = -SPEED
        $AnimatedSprite.flip_h = true
        $AnimatedSprite.play("walk")
	elif(Input.is_action_pressed("move_right") and velocity.y <= 0):
        velocity.x = SPEED
        $AnimatedSprite.flip_h = false
        $AnimatedSprite.play("walk")
	else:
        velocity.x = 0
        $AnimatedSprite.play("idle")
	
	move_and_slide(velocity,Vector2(0,0))

func _on_JumpBox_area_entered(area):
	if area.is_in_group("jump"):
		velocity.y = jumpV
		print("jump")
	if area.is_in_group("floor"):
		velocity.y = 0
		print("stopping")

func _on_DownBox_area_entered(area):
	if area.is_in_group("down"):
		velocity.y = gravity
		print("down")


func _on_JumpBox_area_exited(area):
	if area.is_in_group("floor"):
		velocity.y = gravity
		print("falling")
