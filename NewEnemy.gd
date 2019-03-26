extends KinematicBody2D

#onready var player_scene = preload("res://Player.tscn")
var velocity = Vector2()
var SPEED = 100
var integer = 0
var rando = 0
var ydir = 100
#export var SPEED = 300
export var gravity = 400
export var jumpV = -400

func _ready():
    # Called when the node is added to the scene for the first time.
    # Initialization here
	velocity.x = -SPEED
	pass

func _process(delta):
	if (velocity.y <=0):
		if(rando == 0):
    	    velocity.x = -SPEED
    	    $AnimatedSprite.flip_h = true
    	    $AnimatedSprite.play("walk")
		else: 
    	    velocity.x = SPEED
    	    $AnimatedSprite.flip_h = false
    	    $AnimatedSprite.play("walk")
	else:
		velocity.x = 0
	move_and_slide(velocity,Vector2(0,0))

func _on_JumpBox_area_entered(area):
	if area.is_in_group("jump"):
		velocity.y = jumpV
		set_collision_mask_bit(2, false)
	if area.is_in_group("floor"):
		velocity.y = 0
		set_collision_mask_bit(2, true)

func _on_DownBox_area_entered(area):
	if area.is_in_group("down"):
		velocity.y = gravity
		set_collision_mask_bit(2, false)

func _on_JumpBox_area_exited(area):
	if area.is_in_group("floor"):
		velocity.y = gravity
		set_collision_mask_bit(2, false)
	rando = randi()%2
