extends KinematicBody2D

onready var player_scene = preload("res://Player.tscn")
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
	if (is_on_floor()):
		print("floor")
	else:
		print("fu")


func _on_JumpBox1_area_entered(area):
	if area.is_in_group("jump"):
		velocity.y = jumpV
		print("jump")
	if area.is_in_group("floor"):
		velocity.y = 0
	#	print("player stopping")s # replace with function body


func _on_DownBox1_area_entered(area):
	#if area.is_in_group("down"):
		velocity.y = gravity
	 # replace with function body


func _on_JumpBox1_area_exited(area):
	rando = randi()%2
