extends KinematicBody2D

onready var player_scene = preload("res://Player.tscn")
var velocity = Vector2()
var SPEED = 250
var rando = 0
var _timer = null
var integer = 0

func _ready():
	#_timer = Timer.new()
	#add_child(_timer)
	
	#_timer.connect("timeou", self, "_on_Timer_timeout")
	#_timer.set_wait_time(20.0)
	#_timer.set_one_shot(false)
	#_timer.start()
	pass

func _process(delta):
	integer=integer+1
	if(integer%30 == 0):
		rando = randi()%2
    
	if(rando == 0):
        velocity.x = -SPEED
        $AnimatedSprite.flip_h = true
        $AnimatedSprite.play("walk")
	
	else: #(rando ==1):
        velocity.x = SPEED
        $AnimatedSprite.flip_h = false
        $AnimatedSprite.play("walk")
    #else:
    #    velocity.x = 0
    #    $AnimatedSprite.play("idle")
	move_and_slide(velocity)
	pass