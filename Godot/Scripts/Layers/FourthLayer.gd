extends TileMap

var ZERO: int = 0
var money_for_break: int = 1

# Dictionary to track clicks on each tile
var tile_clicks := {}

func _ready() -> void:
	# Generation
	var start_x1 = -81
	var start_y1 = 41
	for x1 in range(start_x1, start_x1 + 169):
		for y1 in range(start_y1, start_y1 + 40):
			set_cell(0, Vector2i(x1, y1), 0, Vector2i(0, 0))
			
	# Generates copper ore:
	var copper_ore_x = -81
	var copper_ore_y = 41

	# Seed the random number generator for more randomness
	randomize()

	for x in range(copper_ore_x, copper_ore_x + 169):
		for y in range(copper_ore_y, copper_ore_y + 50):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var copper_ore_probability = 0.0
				if y in range(40, 46):
					copper_ore_probability = 0.025  # 2.5% probability
				elif y in range(46, 50):
					copper_ore_probability = 0.02  # 2% probability
				elif y in range(50, 56):
					copper_ore_probability = 0.015  # 1.5% probability
				elif y in range(56, 60):
					copper_ore_probability = 0.01  # 1% probability
				elif y in range(60, 66):
					copper_ore_probability = 0.005  # 0.5% probability
				
				# Place a block based on probability
				if randf() < copper_ore_probability:
					set_cell(0, Vector2i(x, y), 1, Vector2i(0, 0))
					
	# Generates iron ore: 
	var iron_ore_x = -81
	var iron_ore_y = 41

	# Seed the random number generator for more randomness
	randomize()

	for x in range(iron_ore_x, iron_ore_x + 169):
		for y in range(iron_ore_y, iron_ore_y + 50):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var iron_ore_probability = 0.0
				if y in range(40, 46):
					iron_ore_probability = 0.03  # 3% probability
				elif y in range(46, 50):
					iron_ore_probability = 0.025  # 2.5% probability
				elif y in range(50, 56):
					iron_ore_probability = 0.02  # 2% probability
				elif y in range(56, 60):
					iron_ore_probability = 0.015  # 1.5% probability
				elif y in range(60, 66):
					iron_ore_probability = 0.01  # 1% probability
				elif y in range(66, 70):
					iron_ore_probability = 0.005  # 0.5% probability
				
				# Place a block based on probability
				if randf() < iron_ore_probability:
					set_cell(0, Vector2i(x, y), 2, Vector2i(0, 0))
					
	# Generates silver ore: 
	var silver_ore_x = -81
	var silver_ore_y = 41

	# Seed the random number generator for more randomness
	randomize()

	for x in range(silver_ore_x, silver_ore_x + 169):
		for y in range(silver_ore_y, silver_ore_y + 70):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var silver_ore_probability = 0.0
				if y in range(40, 46):
					silver_ore_probability = 0.05  # 5% probability
				elif y in range(46, 51):
					silver_ore_probability = 0.05  # 5% probability
				elif y in range(51, 56):
					silver_ore_probability = 0.045  # 4.5% probability
				elif y in range(56, 61):
					silver_ore_probability = 0.04  # 4% probability
				elif y in range(61, 66):
					silver_ore_probability = 0.035  # 3.5% probability
				elif y in range(66, 71):
					silver_ore_probability = 0.03  # 3% probability
				elif y in range(71, 76):
					silver_ore_probability = 0.025  # 2.5% probability
				elif y in range(76, 81):
					silver_ore_probability = 0.02  # 2% probability
				
				# Place a block based on probability
				if randf() < silver_ore_probability:
					set_cell(0, Vector2i(x, y), 3, Vector2i(0, 0))
					
	# Generates gold ore: 
	var gold_ore_x = -81
	var gold_ore_y = 60

	# Seed the random number generator for more randomness
	randomize()

	for x in range(gold_ore_x, gold_ore_x + 169):
		for y in range(gold_ore_y, gold_ore_y + 70):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var gold_ore_probability = 0.0
				if y in range(59, 66):
					gold_ore_probability = 0.01  # 1% probability
				elif y in range(66, 71):
					gold_ore_probability = 0.015  # 1.5% probability
				elif y in range(71, 76):
					gold_ore_probability = 0.02  # 2% probability
				elif y in range(76, 81):
					gold_ore_probability = 0.025  # 2.5% probability
				
				# Place a block based on probability
				if randf() < gold_ore_probability:
					set_cell(0, Vector2i(x, y), 4, Vector2i(0, 0))
					
func _process(delta):
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
			if tile_clicks[tile_pos] * Global.damage >= 48:
				Global.tile_money = 4
				# Tile has been clicked enough times, remove it and reward money
				erase_cell(ZERO, tile_pos)
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
			if tile_clicks[tile_pos] * Global.damage >= 96:
				Global.tile_money = 10
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
			if tile_clicks[tile_pos] * Global.damage >= 64:
				Global.tile_money = 6
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
			if tile_clicks[tile_pos] * Global.damage >= 160:
				Global.tile_money = 16
				# Tile has been clicked enough times, remove it and reward money
				erase_cell(0, tile_pos)
				Global.money += money_for_break * Global.money_multiplier * Global.tile_money
				# Reset the click counter for this tile position
				tile_clicks.erase(tile_pos)
				# Add 1 to Global.blocks when a tile is broken
				Global.blocks += 1
				Global.silver_ore_amount += 1
				
		if tile_source_id == 4:
			# Tile exists, handle clicks
			if tile_pos in tile_clicks:
				tile_clicks[tile_pos] += 1
			else:
				tile_clicks[tile_pos] = 1

			# Debug print
			print("Tile position: ", tile_pos, " Click count: ", tile_clicks[tile_pos])

			# Check if the tile has been clicked enough times to break
			if tile_clicks[tile_pos] * Global.damage >= 240:
				Global.tile_money = 30
				# Tile has been clicked enough times, remove it and reward money
				erase_cell(0, tile_pos)
				Global.money += money_for_break * Global.money_multiplier * Global.tile_money
				# Reset the click counter for this tile position
				tile_clicks.erase(tile_pos)
				# Add 1 to Global.blocks when a tile is broken
				Global.blocks += 1
				Global.gold_ore_amount += 1

