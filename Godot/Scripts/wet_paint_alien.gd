extends AnimatedSprite2D

func _ready():
	self.flip_h = true

func _process(delta):
	if Global.talked_to_tut_alien2 == 1:
		$"Press E".visible = false
