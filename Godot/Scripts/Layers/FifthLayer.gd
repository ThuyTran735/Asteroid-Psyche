extends TileMap

var ZERO: int = 0
var money_for_break: int = 1

# Dictionary to track clicks on each tile
var tile_clicks := {}

func _process(delta):
	if $"../Billy/Control/Information Menu".visible == false:
		# Check if left mouse button is pressed
		if Input.is_action_just_pressed("mb_left"):
			var mouse_pos: Vector2 = get_global_mouse_position()
			var tile_pos: Vector2 = local_to_map(mouse_pos)

			# Get tile data
			var tile_source_id = get_cell_source_id(0, tile_pos)

			# Check if cell data exists (indicating a tile at the position)
			if tile_source_id == 0:
				# Tile exists, handle clicks
				if tile_pos in tile_clicks:
					tile_clicks[tile_pos] += 1
				else:
					tile_clicks[tile_pos] = 1

				# Debug print
				print("Tile position: ", tile_pos, " Click count: ", tile_clicks[tile_pos])
				get_parent().breaking()
				# Check if the tile has been clicked enough times to break
				if tile_clicks[tile_pos] * Global.damage >= 100:
					Global.tile_money = 6
					# Tile has been clicked enough times, remove it and reward money
					erase_cell(ZERO, tile_pos)
					Global.money += money_for_break * Global.money_multiplier * Global.tile_money
					# Reset the click counter for this tile position
					tile_clicks.erase(tile_pos)
					# Add 1 to Global.blocks when a tile is broken
					Global.blocks += 1
