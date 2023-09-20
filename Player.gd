extends Sprite2D


var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_movement(delta)
	
		

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
		
	position += velocity * _delta
