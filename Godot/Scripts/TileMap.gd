extends TileMap

var ZERO: int = 0
var money_for_break: int = 1

# Dictionary to track clicks on each tile
var tile_clicks := {}

func _process(_delta):
	# Check if left mouse button is pressed
	if Input.is_action_just_pressed("mb_left"):
		var tile_pos: Vector2 = local_to_map(get_global_mouse_position())

		# Get tile data (using get_cell_v for Godot 4+)
		var cell_data = get_cell_tile_data(ZERO, tile_pos)

		# Check if cell data exists (indicating a tile at the position)
		if cell_data != null:
			# Tile exists, handle clicks
			if tile_pos in tile_clicks:
				tile_clicks[tile_pos] += 1
			else:
				tile_clicks[tile_pos] = 1

			# Check if the tile has been clicked twice
			if tile_clicks[tile_pos] * Global.damage >= 2:
				Global.tile_money = 1
				# Tile has been clicked twice, remove it and reward money
				erase_cell(ZERO, tile_pos)
				Global.money += money_for_break * Global.money_multiplier * Global.tile_money
				# Reset the click counter for this tile position
				tile_clicks.erase(tile_pos)
				
