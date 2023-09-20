extends Sprite2D


var speed = 100
var launchSpeed = 80;
@export var projectile : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_movement(delta)
	handle_firing()
		

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
		if (velocity.x > 0):
			flip_h = false 
		elif (velocity.x < 0):
			flip_h = true
		
	position += velocity * _delta

func handle_firing():
	if Input.is_action_just_pressed("fire"):
		var inst = projectile.instantiate()
		owner.add_child(inst)
		inst.transform = transform 
		#var projectile = inst.get_node("projectile.gd")
		#projectile.launch(1000)
		if (flip_h == true):
			inst.launch(-launchSpeed)
		else:
			inst.launch(launchSpeed)
		
func _on_area_2d_area_entered(area):
	if area.is_in_group("enemy"):
		print ("OUGH")
