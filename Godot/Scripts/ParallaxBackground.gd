extends ParallaxBackground

@export var motion_scale: Vector2 = Vector2(0.5, 0.5)
@export var shader_material: ShaderMaterial

func _ready():
	var parallax_layer = get_node("ParallaxLayer")
	parallax_layer.motion_scale = motion_scale
	
	if shader_material:
		shader_material.set_shader_param("parallax_motion_scale", motion_scale)
