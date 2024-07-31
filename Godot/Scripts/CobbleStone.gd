extends TileMap

var ZERO: int = 0

func _process(_delta):
	# Add a tile if the right mouse button is pressed according to its global position
	if Input.is_action_just_pressed("mb_right"):
		var tile: Vector2i = local_to_map(get_global_mouse_position())

		var tile_data = get_cell_tile_data(0, tile)  # Check if tile exists in this TileMap

		# Check if the tile exists in the FirstLayer TileMap
		var FirstLayer_tilemap = get_node_or_null("../FirstLayer")
		var Metal_tilemap = get_node_or_null("../Metal")
		var SecondLayer_tilemap = get_node_or_null("../SecondLayer")
		var ThirdLayer_tilemap = get_node_or_null("../ThirdLayer")
		var FourthLayer_tilemap = get_node_or_null("../FourthLayer")
		var FifthLayer_tilemap = get_node_or_null("../FifthLayer")
		var SixthLayer_tilemap = get_node_or_null("../SixthLayer")

		if FirstLayer_tilemap == null:
			print("Error: FirstLayer TileMap 'FirstLayer' not found.")
		elif SecondLayer_tilemap == null:
			print("Error: SecondLayer TileMap 'Metal' not found.")
		elif Metal_tilemap == null:
			print("Error: Metal TileMap 'Metal' not found.")
		elif ThirdLayer_tilemap == null:
			print("Error: ThirdLayer TileMap 'ThirdLayer' not found.")
		elif FourthLayer_tilemap == null:
			print("Error: FourthLayer TileMap 'FourthLayer' not found.")
		elif FifthLayer_tilemap == null:
			print("Error: FifthLayer TileMap 'FifthLayer' not found.")
		elif SixthLayer_tilemap == null:
			print("Error: SixthLayer TileMap 'SixthLayer' not found.")
		else:
			var tile_data_FirstLayer = FirstLayer_tilemap.get_cell_tile_data(0, tile)
			var tile_data_Metal = Metal_tilemap.get_cell_tile_data(0, tile)
			var tile_data_SecondLayer = SecondLayer_tilemap.get_cell_tile_data(0, tile)
			var tile_data_ThirdLayer = ThirdLayer_tilemap.get_cell_tile_data(0, tile)
			var tile_data_FourthLayer = FourthLayer_tilemap.get_cell_tile_data(0, tile)
			var tile_data_FifthLayer = FifthLayer_tilemap.get_cell_tile_data(0, tile)
			var tile_data_SixthLayer = SixthLayer_tilemap.get_cell_tile_data(0, tile)

			if tile_data == null and tile_data_FirstLayer == null and tile_data_Metal == null and tile_data_SecondLayer == null and tile_data_ThirdLayer == null and tile_data_FourthLayer == null and tile_data_FifthLayer == null and tile_data_SixthLayer == null and Global.blocks > 0:  # Only decrement if no tile in either TileMap and blocks available
				set_cell(ZERO, tile, ZERO, Vector2i.ZERO)  # Use to place the tile
				Global.blocks -= 1
				print("Placed cobblestone tile at: ", tile)
				get_parent().place()
			else:
				print("Cannot place tile: Tile already exists or no blocks available.")

	# Remove a tile if the left mouse button is pressed according to its global position
	if Input.is_action_just_pressed("mb_left"):
		var tile: Vector2i = local_to_map(get_global_mouse_position())

		# Check if tile exists before erasing
		var tile_data = get_cell_tile_data(0, tile)

		if tile_data != null:
			erase_cell(0, tile)
			get_parent().breaking()
			Global.blocks += 1  # Add a block when a tile is broken
