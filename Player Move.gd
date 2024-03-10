extends CharacterBody2D


@export var Speed = 300.0
@export var JumpVel = -500

# Get the gravity from the project settings to be synced with RigidBody nodes.
@export var Gravity = 2


func _physics_process(_delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += Gravity
		if velocity.y > 500:
				velocity.y = 500

	if Input.is_action_just_pressed("jump"):
		velocity.y = -JumpVel

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xdir = Input.get_axis("left", "right")
	
	velocity.x = xdir * Speed
	
	move_and_slide()

