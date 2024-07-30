extends TileMap

var money_for_break: int = 1

# Dictionary to track clicks on each tile
var tile_clicks := {}

func _ready() -> void:
	# Generation
	var start_x1 = -81
	var start_y1 = 2
	for x1 in range(start_x1, start_x1 + 169):
		for y1 in range(start_y1, start_y1 + 38):
			set_cell(0, Vector2i(x1, y1), 0, Vector2i(0, 0))
			
	# Generates the left side:
	var left_sides = [
		Vector2(-81, 1), Vector2(-81, 0), Vector2(-81, -1),
		Vector2(-81, -2), Vector2(-81, -3), Vector2(-81, -4)
	]
	var left_lengths = [53, 33, 19, 10, 5, 2]
	for i in range(left_sides.size()):
		for x in range(left_sides[i].x, left_sides[i].x + left_lengths[i]):
			set_cell(0, Vector2i(x, left_sides[i].y), 0, Vector2i(0, 0))

	# Generates the right side:
	var right_sides = [
		Vector2(31, 1), Vector2(53, 0), Vector2(66, -1),
		Vector2(76, -2), Vector2(82, -3), Vector2(86, -4)
	]
	var right_lengths = [57, 35, 22, 12, 6, 2]
	for i in range(right_sides.size()):
		for x in range(right_sides[i].x, right_sides[i].x + right_lengths[i]):
			set_cell(0, Vector2i(x, right_sides[i].y), 0, Vector2i(0, 0))
			
	# Generates copper ore:
	var copper_ore_x = -81
	var copper_ore_y = -5

	# Seed the random number generator for more randomness
	randomize()

	for x in range(copper_ore_x, copper_ore_x + 169):
		for y in range(copper_ore_y, copper_ore_y + 50):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var copper_ore_probability = 0.0
				if y in range(-5, 1):
					copper_ore_probability = 0.025  # 2.5% probability
				elif y in range(1, 6):
					copper_ore_probability = 0.03  # 3% probability
				elif y in range(6, 11):
					copper_ore_probability = 0.035  # 3.5% probability
				elif y in range(11, 16):
					copper_ore_probability = 0.04  # 4% probability
				elif y in range(16, 21):
					copper_ore_probability = 0.045  # 4.5% probability
				elif y in range(21, 26):
					copper_ore_probability = 0.04  # 4% probability
				elif y in range(26, 31):
					copper_ore_probability = 0.035  # 3.5% probability
				elif y in range(31, 36):
					copper_ore_probability = 0.03  # 3% probability
				elif y in range(36, 40):
					copper_ore_probability = 0.03  # 3% probability
				
				# Place a block based on probability
				if randf() < copper_ore_probability:
					set_cell(0, Vector2i(x, y), 1, Vector2i(0, 0))
					
	# Generates iron ore: 
	var iron_ore_x = -81
	var iron_ore_y = -5

	# Seed the random number generator for more randomness
	randomize()

	for x in range(iron_ore_x, iron_ore_x + 169):
		for y in range(iron_ore_y, iron_ore_y + 50):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var iron_ore_probability = 0.0
				if y in range(-5, 1):
					iron_ore_probability = 0.035  # 3.5% probability
				elif y in range(1, 6):
					iron_ore_probability = 0.04  # 4% probability
				elif y in range(6, 11):
					iron_ore_probability = 0.045  # 4.5% probability
				elif y in range(11, 16):
					iron_ore_probability = 0.05  # 5% probability
				elif y in range(16, 21):
					iron_ore_probability = 0.055  # 5.5% probability
				elif y in range(21, 26):
					iron_ore_probability = 0.05  # 5% probability
				elif y in range(26, 31):
					iron_ore_probability = 0.045  # 4.5% probability
				elif y in range(31, 36):
					iron_ore_probability = 0.04  # 4% probability
				elif y in range(36, 40):
					iron_ore_probability = 0.035  # 3.5% probability
				
				# Place a block based on probability
				if randf() < iron_ore_probability:
					set_cell(0, Vector2i(x, y), 2, Vector2i(0, 0))
					
	# Generates silver ore: 
	var silver_ore_x = -81
	var silver_ore_y = 15

	# Seed the random number generator for more randomness
	randomize()

	for x in range(silver_ore_x, silver_ore_x + 169):
		for y in range(silver_ore_y, silver_ore_y + 50):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var silver_ore_probability = 0.0
				if y in range(11, 16):
					silver_ore_probability = 0.03  # 3% probability
				elif y in range(16, 21):
					silver_ore_probability = 0.035  # 3.5% probability
				elif y in range(21, 26):
					silver_ore_probability = 0.035  # 3.5% probability
				elif y in range(26, 31):
					silver_ore_probability = 0.04  # 4% probability
				elif y in range(31, 36):
					silver_ore_probability = 0.04  # 4% probability
				elif y in range(36, 40):
					silver_ore_probability = 0.045  # 4.5% probability
				
				# Place a block based on probability
				if randf() < silver_ore_probability:
					set_cell(0, Vector2i(x, y), 3, Vector2i(0, 0))


func _process(_delta):
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

			# Check if the tile has been clicked enough times to break
			if tile_clicks[tile_pos] * Global.damage >= 2:
				Global.tile_money = 1
				# Tile has been clicked enough times, remove it and reward money
				erase_cell(0, tile_pos)
				Global.money += money_for_break * Global.money_multiplier * Global.tile_money
				# Reset the click counter for this tile position
				tile_clicks.erase(tile_pos)
				# Add 1 to Global.blocks when a tile is broken
				Global.blocks += 1
				
		if tile_source_id == 1:
			# Tile exists, handle clicks
			if tile_pos in tile_clicks:
				tile_clicks[tile_pos] += 1
			else:
				tile_clicks[tile_pos] = 1

			# Debug print
			print("Tile position: ", tile_pos, " Click count: ", tile_clicks[tile_pos])

			# Check if the tile has been clicked enough times to break
			if tile_clicks[tile_pos] * Global.damage >= 6:
				Global.tile_money = 5
				# Tile has been clicked enough times, remove it and reward money
				erase_cell(0, tile_pos)
				Global.money += money_for_break * Global.money_multiplier * Global.tile_money
				# Reset the click counter for this tile position
				tile_clicks.erase(tile_pos)
				# Add 1 to Global.blocks when a tile is broken
				Global.blocks += 1
				Global.copper_ore_amount += 1
				
		if tile_source_id == 2:
			# Tile exists, handle clicks
			if tile_pos in tile_clicks:
				tile_clicks[tile_pos] += 1
			else:
				tile_clicks[tile_pos] = 1

			# Debug print
			print("Tile position: ", tile_pos, " Click count: ", tile_clicks[tile_pos])

			# Check if the tile has been clicked enough times to break
			if tile_clicks[tile_pos] * Global.damage >= 4:
				Global.tile_money = 3
				# Tile has been clicked enough times, remove it and reward money
				erase_cell(0, tile_pos)
				Global.money += money_for_break * Global.money_multiplier * Global.tile_money
				# Reset the click counter for this tile position
				tile_clicks.erase(tile_pos)
				# Add 1 to Global.blocks when a tile is broken
				Global.blocks += 1
				Global.iron_ore_amount += 1
				
		if tile_source_id == 3:
			# Tile exists, handle clicks
			if tile_pos in tile_clicks:
				tile_clicks[tile_pos] += 1
			else:
				tile_clicks[tile_pos] = 1

			# Debug print
			print("Tile position: ", tile_pos, " Click count: ", tile_clicks[tile_pos])

			# Check if the tile has been clicked enough times to break
			if tile_clicks[tile_pos] * Global.damage >= 16:
				Global.tile_money = 8
				# Tile has been clicked enough times, remove it and reward money
				erase_cell(0, tile_pos)
				Global.money += money_for_break * Global.money_multiplier * Global.tile_money
				# Reset the click counter for this tile position
				tile_clicks.erase(tile_pos)
				# Add 1 to Global.blocks when a tile is broken"physics_layer_0/collision_layer"
				Global.blocks += 1
				Global.silver_ore_amount += 1
