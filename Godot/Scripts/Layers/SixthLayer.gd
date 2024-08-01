extends TileMap

var ZERO: int = 0
var money_for_break: int = 1

# Dictionary to track clicks on each tile
var tile_clicks := {}

func _ready() -> void:
	# Generation
	var start_x1 = -81
	var start_y1 = 82
	for x1 in range(start_x1, start_x1 + 169):
		for y1 in range(start_y1, start_y1 + 60):
			set_cell(0, Vector2i(x1, y1), 0, Vector2i(0, 0))
			
	# Generates gold ore: 
	var gold_ore_x = -81
	var gold_ore_y = 82

	# Seed the random number generator for more randomness
	randomize()

	for x in range(gold_ore_x, gold_ore_x + 169):
		for y in range(gold_ore_y, gold_ore_y + 70):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var gold_ore_probability = 0.0
				if y in range(79, 76):
					gold_ore_probability = 0.025  # 2.5% probability
				elif y in range(76, 81):
					gold_ore_probability = 0.03  # 3% probability
				elif y in range(81, 86):
					gold_ore_probability = 0.035  # 3.5% probability
				elif y in range(86, 91):
					gold_ore_probability = 0.04  # 4% probability
				elif y in range(81, 86):
					gold_ore_probability = 0.045  # 4.5% probability
				elif y in range(86, 91):
					gold_ore_probability = 0.05  # 5% probability
				elif y in range(91, 96):
					gold_ore_probability = 0.045  # 4.5% probability
				elif y in range(96, 101):
					gold_ore_probability = 0.04  # 4% probability
				elif y in range(101, 106):
					gold_ore_probability = 0.035  # 3.5% probability
				elif y in range(106, 111):
					gold_ore_probability = 0.03  # 3% probability
				elif y in range(111, 116):
					gold_ore_probability = 0.025  # 2.5% probability
				elif y in range(116, 121):
					gold_ore_probability = 0.02  # 2% probability
				elif y in range(121, 126):
					gold_ore_probability = 0.015  # 1.5% probability
				elif y in range(126, 131):
					gold_ore_probability = 0.01  # 1% probability
				elif y in range(131, 136):
					gold_ore_probability = 0.005  # 0.5% probability
				elif y in range(136, 141):
					gold_ore_probability = 0.001  # 0.1% probability
				
				# Place a block based on probability
				if randf() < gold_ore_probability:
					set_cell(0, Vector2i(x, y), 1, Vector2i(0, 0))
					
	# Generates amethyst ore: 
	var amethyst_ore_x = -81
	var amethyst_ore_y = 82

	# Seed the random number generator for more randomness
	randomize()

	for x in range(amethyst_ore_x, amethyst_ore_x + 169):
		for y in range(amethyst_ore_y, amethyst_ore_y + 70):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var amethyst_ore_probability = 0.0
				if y in range(79, 76):
					amethyst_ore_probability = 0.001  # 0.1% probability
				elif y in range(76, 81):
					amethyst_ore_probability = 0.00105  # 0.105% probability
				elif y in range(81, 86):
					amethyst_ore_probability = 0.0011  # 0.11% probability
				elif y in range(86, 91):
					amethyst_ore_probability = 0.00115  # 0.115% probability
				elif y in range(81, 86):
					amethyst_ore_probability = 0.0012  # 0.12% probability
				elif y in range(86, 91):
					amethyst_ore_probability = 0.00125  # 0.125% probability
				elif y in range(91, 96):
					amethyst_ore_probability = 0.0013  # 0.13% probability
				elif y in range(96, 101):
					amethyst_ore_probability = 0.00135  # 0.135% probability
				elif y in range(101, 106):
					amethyst_ore_probability = 0.0014  # 0.14% probability
				elif y in range(106, 111):
					amethyst_ore_probability = 0.00145  # 0.145% probability
				elif y in range(111, 116):
					amethyst_ore_probability = 0.0015  # 0.15% probability
				elif y in range(116, 121):
					amethyst_ore_probability = 0.00155  # 0.155% probability
				elif y in range(121, 126):
					amethyst_ore_probability = 0.0016  # 0.16% probability
				elif y in range(126, 131):
					amethyst_ore_probability = 0.00165  # 0.165% probability
				elif y in range(131, 136):
					amethyst_ore_probability = 0.0017  # 0.17% probability
				elif y in range(136, 141):
					amethyst_ore_probability = 0.00175  # 0.175% probability
				
				# Place a block based on probability
				if randf() < amethyst_ore_probability:
					set_cell(0, Vector2i(x, y), 2, Vector2i(0, 0))
					
	# Generates sapphire ore: 
	var sapphire_ore_x = -81
	var sapphire_ore_y = 82

	# Seed the random number generator for more randomness
	randomize()

	for x in range(sapphire_ore_x, sapphire_ore_x + 169):
		for y in range(sapphire_ore_y, sapphire_ore_y + 70):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var sapphire_ore_probability = 0.0
				if y in range(79, 76):
					sapphire_ore_probability = 0.0008  # 0.08% probability
				elif y in range(76, 81):
					sapphire_ore_probability = 0.00085  # 0.085% probability
				elif y in range(81, 86):
					sapphire_ore_probability = 0.0009  # 0.09% probability
				elif y in range(86, 91):
					sapphire_ore_probability = 0.00095  # 0.095% probability
				elif y in range(81, 86):
					sapphire_ore_probability = 0.001  # 0.1% probability
				elif y in range(86, 91):
					sapphire_ore_probability = 0.00105  # 0.105% probability
				elif y in range(91, 96):
					sapphire_ore_probability = 0.00110  # 0.110% probability
				elif y in range(96, 101):
					sapphire_ore_probability = 0.00115  # 0.115% probability
				elif y in range(101, 106):
					sapphire_ore_probability = 0.0012  # 0.12% probability
				elif y in range(106, 111):
					sapphire_ore_probability = 0.00125  # 0.125% probability
				elif y in range(111, 116):
					sapphire_ore_probability = 0.0013  # 0.13% probability
				elif y in range(116, 121):
					sapphire_ore_probability = 0.00135  # 0.135% probability
				elif y in range(121, 126):
					sapphire_ore_probability = 0.0014  # 0.14% probability
				elif y in range(126, 131):
					sapphire_ore_probability = 0.00145  # 0.145% probability
				elif y in range(131, 136):
					sapphire_ore_probability = 0.0015  # 0.15% probability
				elif y in range(136, 141):
					sapphire_ore_probability = 0.00155  # 0.155% probability
				
				# Place a block based on probability
				if randf() < sapphire_ore_probability:
					set_cell(0, Vector2i(x, y), 3, Vector2i(0, 0))
					
	# Generates emerald ore: 
	var emerald_ore_x = -81
	var emerald_ore_y = 82

	# Seed the random number generator for more randomness
	randomize()

	for x in range(emerald_ore_x, emerald_ore_x + 169):
		for y in range(emerald_ore_y, emerald_ore_y + 70):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var emerald_ore_probability = 0.0
				if y in range(79, 76):
					emerald_ore_probability = 0.0007  # 0.07% probability
				elif y in range(76, 81):
					emerald_ore_probability = 0.00075  # 0.075% probability
				elif y in range(81, 86):
					emerald_ore_probability = 0.0008  # 0.08% probability
				elif y in range(86, 91):
					emerald_ore_probability = 0.00085  # 0.085% probability
				elif y in range(81, 86):
					emerald_ore_probability = 0.0009  # 0.09% probability
				elif y in range(86, 91):
					emerald_ore_probability = 0.00095  # 0.095% probability
				elif y in range(91, 96):
					emerald_ore_probability = 0.001  # 0.1% probability
				elif y in range(96, 101):
					emerald_ore_probability = 0.00105  # 0.105% probability
				elif y in range(101, 106):
					emerald_ore_probability = 0.0011  # 0.11% probability
				elif y in range(106, 111):
					emerald_ore_probability = 0.00115  # 0.115% probability
				elif y in range(111, 116):
					emerald_ore_probability = 0.0012  # 0.12% probability
				elif y in range(116, 121):
					emerald_ore_probability = 0.00125  # 0.125% probability
				elif y in range(121, 126):
					emerald_ore_probability = 0.0013  # 0.13% probability
				elif y in range(126, 131):
					emerald_ore_probability = 0.00135  # 0.135% probability
				elif y in range(131, 136):
					emerald_ore_probability = 0.0014  # 0.14% probability
				elif y in range(136, 141):
					emerald_ore_probability = 0.00145  # 0.145% probability
				
				# Place a block based on probability
				if randf() < emerald_ore_probability:
					set_cell(0, Vector2i(x, y), 4, Vector2i(0, 0))
					
	# Generates ruby ore:
	var ruby_ore_x = -81
	var ruby_ore_y = 82

	# Seed the random number generator for more randomness
	randomize()

	for x in range(ruby_ore_x, ruby_ore_x + 169):
		for y in range(ruby_ore_y, ruby_ore_y + 70):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var ruby_ore_probability = 0.0
				if y in range(79, 76):
					ruby_ore_probability = 0.0006  # 0.06% probability
				elif y in range(76, 81):
					ruby_ore_probability = 0.00065  # 0.065% probability
				elif y in range(81, 86):
					ruby_ore_probability = 0.0007  # 0.07% probability
				elif y in range(86, 91):
					ruby_ore_probability = 0.00075  # 0.075% probability
				elif y in range(81, 86):
					ruby_ore_probability = 0.0008  # 0.08% probability
				elif y in range(86, 91):
					ruby_ore_probability = 0.00085  # 0.085% probability
				elif y in range(91, 96):
					ruby_ore_probability = 0.0009  # 0.09% probability
				elif y in range(96, 101):
					ruby_ore_probability = 0.00095  # 0.095% probability
				elif y in range(101, 106):
					ruby_ore_probability = 0.001  # 0.1% probability
				elif y in range(106, 111):
					ruby_ore_probability = 0.00105  # 0.105% probability
				elif y in range(111, 116):
					ruby_ore_probability = 0.0011  # 0.11% probability
				elif y in range(116, 121):
					ruby_ore_probability = 0.00115  # 0.115% probability
				elif y in range(121, 126):
					ruby_ore_probability = 0.0012  # 0.12% probability
				elif y in range(126, 131):
					ruby_ore_probability = 0.00125  # 0.125% probability
				elif y in range(131, 136):
					ruby_ore_probability = 0.0013  # 0.13% probability
				elif y in range(136, 141):
					ruby_ore_probability = 0.00135  # 0.135% probability
					
				# Place a block based on probability
				if randf() < ruby_ore_probability:
					set_cell(0, Vector2i(x, y), 5, Vector2i(0, 0))
					
	# Generates diamond ore instead of ruby ore
	var diamond_ore_x = -81
	var diamond_ore_y = 82

	# Seed the random number generator for more randomness
	randomize()

	for x in range(diamond_ore_x, diamond_ore_x + 169):
		for y in range(diamond_ore_y, diamond_ore_y + 70):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var diamond_ore_probability = 0.0
				if y in range(79, 76):
					diamond_ore_probability = 0.0004  # 0.04% probability
				elif y in range(76, 81):
					diamond_ore_probability = 0.00045  # 0.045% probability
				elif y in range(81, 86):
					diamond_ore_probability = 0.0005  # 0.05% probability
				elif y in range(86, 91):
					diamond_ore_probability = 0.00055  # 0.055% probability
				elif y in range(91, 96):
					diamond_ore_probability = 0.0006  # 0.06% probability
				elif y in range(96, 101):
					diamond_ore_probability = 0.00065  # 0.065% probability
				elif y in range(101, 106):
					diamond_ore_probability = 0.0007  # 0.07% probability
				elif y in range(106, 111):
					diamond_ore_probability = 0.00075  # 0.075% probability
				elif y in range(111, 116):
					diamond_ore_probability = 0.0008  # 0.08% probability
				elif y in range(116, 121):
					diamond_ore_probability = 0.00085  # 0.085% probability
				elif y in range(121, 126):
					diamond_ore_probability = 0.0009  # 0.09% probability
				elif y in range(126, 131):
					diamond_ore_probability = 0.00095  # 0.095% probability
				elif y in range(131, 136):
					diamond_ore_probability = 0.001  # 0.1% probability
				elif y in range(136, 141):
					diamond_ore_probability = 0.00105  # 0.105% probability
				
				# Place a block based on probability
				if randf() < diamond_ore_probability:
					set_cell(0, Vector2i(x, y), 6, Vector2i(0, 0))
			
func _process(delta):
	if $"../Billy/Control/Settings Menu".visible == false:
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
				if tile_clicks[tile_pos] * Global.damage >= 160:
					Global.tile_money = 8
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
				get_parent().breaking()
				# Check if the tile has been clicked enough times to break
				if tile_clicks[tile_pos] * Global.damage >= 900:
					Global.tile_money = 65
					# Tile has been clicked enough times, remove it and reward money
					erase_cell(ZERO, tile_pos)
					Global.money += money_for_break * Global.money_multiplier * Global.tile_money
					# Reset the click counter for this tile position
					tile_clicks.erase(tile_pos)
					# Add 1 to Global.blocks when a tile is broken
					Global.blocks += 1
					Global.gold_ore_amount += 1
					
			if tile_source_id == 2:
				# Tile exists, handle clicks
				if tile_pos in tile_clicks:
					tile_clicks[tile_pos] += 1
				else:
					tile_clicks[tile_pos] = 1

				# Debug print
				print("Tile position: ", tile_pos, " Click count: ", tile_clicks[tile_pos])
				get_parent().breaking()
				# Check if the tile has been clicked enough times to break
				if tile_clicks[tile_pos] * Global.damage >= 2800:
					Global.tile_money = 150
					# Tile has been clicked enough times, remove it and reward money
					erase_cell(ZERO, tile_pos)
					Global.money += money_for_break * Global.money_multiplier * Global.tile_money
					# Reset the click counter for this tile position
					tile_clicks.erase(tile_pos)
					# Add 1 to Global.blocks when a tile is broken
					Global.blocks += 1
					Global.amethyst_ore_amount += 1
					
			if tile_source_id == 3:
				# Tile exists, handle clicks
				if tile_pos in tile_clicks:
					tile_clicks[tile_pos] += 1
				else:
					tile_clicks[tile_pos] = 1

				# Debug print
				print("Tile position: ", tile_pos, " Click count: ", tile_clicks[tile_pos])
				get_parent().breaking()
				# Check if the tile has been clicked enough times to break
				if tile_clicks[tile_pos] * Global.damage >= 3200:
					Global.tile_money = 240
					# Tile has been clicked enough times, remove it and reward money
					erase_cell(ZERO, tile_pos)
					Global.money += money_for_break * Global.money_multiplier * Global.tile_money
					# Reset the click counter for this tile position
					tile_clicks.erase(tile_pos)
					# Add 1 to Global.blocks when a tile is broken
					Global.blocks += 1
					Global.sapphire_ore_amount += 1
					
			if tile_source_id == 4:
				# Tile exists, handle clicks
				if tile_pos in tile_clicks:
					tile_clicks[tile_pos] += 1
				else:
					tile_clicks[tile_pos] = 1

				# Debug print
				print("Tile position: ", tile_pos, " Click count: ", tile_clicks[tile_pos])
				get_parent().breaking()
				# Check if the tile has been clicked enough times to break
				if tile_clicks[tile_pos] * Global.damage >= 3600:
					Global.tile_money = 340
					# Tile has been clicked enough times, remove it and reward money
					erase_cell(ZERO, tile_pos)
					Global.money += money_for_break * Global.money_multiplier * Global.tile_money
					# Reset the click counter for this tile position
					tile_clicks.erase(tile_pos)
					# Add 1 to Global.blocks when a tile is broken
					Global.blocks += 1
					Global.emerald_ore_amount += 1
					
			if tile_source_id == 5:
				# Tile exists, handle clicks
				if tile_pos in tile_clicks:
					tile_clicks[tile_pos] += 1
				else:
					tile_clicks[tile_pos] = 1

				# Debug print
				print("Tile position: ", tile_pos, " Click count: ", tile_clicks[tile_pos])
				get_parent().breaking()
				# Check if the tile has been clicked enough times to break
				if tile_clicks[tile_pos] * Global.damage >= 4000:
					Global.tile_money = 450
					# Tile has been clicked enough times, remove it and reward money
					erase_cell(ZERO, tile_pos)
					Global.money += money_for_break * Global.money_multiplier * Global.tile_money
					# Reset the click counter for this tile position
					tile_clicks.erase(tile_pos)
					# Add 1 to Global.blocks when a tile is broken
					Global.blocks += 1
					Global.ruby_ore_amount += 1
					
			if tile_source_id == 6:
				# Tile exists, handle clicks
				if tile_pos in tile_clicks:
					tile_clicks[tile_pos] += 1
				else:
					tile_clicks[tile_pos] = 1

				# Debug print
				print("Tile position: ", tile_pos, " Click count: ", tile_clicks[tile_pos])
				get_parent().breaking()
				# Check if the tile has been clicked enough times to break
				if tile_clicks[tile_pos] * Global.damage >= 5000:
					Global.tile_money = 750
					# Tile has been clicked enough times, remove it and reward money
					erase_cell(ZERO, tile_pos)
					Global.money += money_for_break * Global.money_multiplier * Global.tile_money
					# Reset the click counter for this tile position
					tile_clicks.erase(tile_pos)
					# Add 1 to Global.blocks when a tile is broken
					Global.blocks += 1
					Global.diamond_ore_amount += 1
