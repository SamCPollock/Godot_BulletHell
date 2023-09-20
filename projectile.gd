extends Sprite2D

@export var verticalSpeed = -160 
var horizontalSpeed = 60
@export var rotationSpeed = 800
var speedDecay = -200
var isFiringRight : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += verticalSpeed * delta
	position.x += horizontalSpeed * delta
	verticalSpeed -= speedDecay * delta 
	
	rotation_degrees += rotationSpeed * delta
	
func launch(_horizontalSpeed):
	horizontalSpeed = _horizontalSpeed
	if (horizontalSpeed > 0):
		rotationSpeed = 800
	else:
		rotationSpeed = -800
	


func _on_area_2d_area_entered(area):
	if area.is_in_group("respawner"):
		queue_free()
