extends Sprite2D

var fallSpeed = Vector2(0, 30)
var originalPosition

func _ready():
	originalPosition = position

func _process(delta):
	handle_gravity(delta)

func handle_gravity(_delta):
	position += fallSpeed * _delta

func _on_area_2d_area_entered(area):
	if area.is_in_group("respawner"):
		position = originalPosition
