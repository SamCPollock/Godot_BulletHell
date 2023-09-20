extends Sprite2D


var speed = 100
var launchSpeed = 80;
@export var projectile : PackedScene
var isCharging : bool
var minimumCharge: float = 10
var chargeTime : float = minimumCharge
var chargeSpeed : float = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_movement(delta)
	handle_firing()
	if (isCharging):
		chargeTime += delta
	
		

func handle_movement(_delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("left"):
		velocity.x += -1; 
	if Input.is_action_pressed("right"):
		velocity.x += 1; 
	if Input.is_action_pressed("up"):
		velocity.y += -1; 
	if Input.is_action_pressed("down"):
		velocity.y += 1;
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		if (isCharging):
			velocity = velocity * 0.3
			
		if (velocity.x > 0):
			flip_h = false 
		elif (velocity.x < 0):
			flip_h = true
		
	position += velocity * _delta

func handle_firing():
	if Input.is_action_just_pressed("fire"):
		start_firing()
	if (Input.is_action_just_released("fire")):
		release_firing()
				
func start_firing():
	isCharging = true
	pass
	
func release_firing():
	var inst = projectile.instantiate()
	owner.add_child(inst)
	inst.transform = transform 
	if (flip_h == true):
		inst.launch(-chargeTime * chargeSpeed, -launchSpeed)
	else:
		inst.launch(-chargeTime * chargeSpeed, launchSpeed)
	isCharging = false
	chargeTime = minimumCharge

func _on_area_2d_area_entered(area):
	if area.is_in_group("enemy"):
		print ("OUGH")
