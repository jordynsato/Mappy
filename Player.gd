extends KinematicBody2D

var velocity = Vector2(0,0)
export var SPEED = 300

func _ready():
    # Called when the node is added to the scene for the first time.
    # Initialization here
    pass

func _process(delta):
    if(Input.is_action_pressed("move_left")):
        velocity.x = -SPEED
        $AnimatedSprite.flip_h = true
        $AnimatedSprite.play("walk")
    elif(Input.is_action_pressed("move_right")):
        velocity.x = SPEED
        $AnimatedSprite.flip_h = false
        $AnimatedSprite.play("walk")
    else:
        velocity.x = 0
        $AnimatedSprite.play("idle")

    move_and_slide(velocity)

    pass