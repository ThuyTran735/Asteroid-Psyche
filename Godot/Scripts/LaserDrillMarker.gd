extends Marker2D

const max_range = 5000

var based_width = 3
var widthy = based_width
var shoot = false 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Laser.width = widthy
	
	var mouse_position = get_local_mouse_position()
	var max_cast_to = mouse_position.normalized() * max_range
	$RayCast2D.target_position = max_cast_to
	
	if $RayCast2D.is_colliding():
		$LaserDrillMarker.global_position = $RayCast2D.get_collision_point()
		$Laser.set_point_position(1, $Laser.to_local($LaserDrillMarker.global_position))
	else:
		$LaserDrillMarker.global_position = $RayCast2D.target_position
		$Laser.points[1] = $LaserDrillMarker.global_position
