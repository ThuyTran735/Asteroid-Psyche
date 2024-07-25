extends TileMap

var ZERO: int = 0
var money_for_break: int = 1

func _process(_delta):
	# Check if left mouse button is pressed
	if Input.is_action_just_pressed("mb_left"):
		var tile_pos: Vector2 = local_to_map(get_global_mouse_position())

		# Get tile data (using get_cell_v for Godot 4+)
		var cell_data = get_cell_tile_data(ZERO, tile_pos)

		# Check if cell data exists (indicating a tile at the position)
		if cell_data != null:  # Corrected line 15
			# Tile exists, remove it and reward money
			erase_cell(ZERO, tile_pos)
			Global.current_money += money_for_break
		else:
			# Optional feedback for no tile (consider visual or sound cue)
			print("No tile found at", tile_pos) 
