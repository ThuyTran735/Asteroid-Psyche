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
					
	# Generates amethyst ore: 
	var amethyst_ore_x = -81
	var amethyst_ore_y = -5

	# Seed the random number generator for more randomness
	randomize()

	for x in range(amethyst_ore_x, amethyst_ore_x + 169):
		for y in range(amethyst_ore_y, amethyst_ore_y + 50):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var amethyst_ore_probability = 0.0
				if y in range(-5, 1):
					amethyst_ore_probability = 0.0006  # 0.06% probability
				elif y in range(1, 6):
					amethyst_ore_probability = 0.0006  # 0.06% probability
				elif y in range(6, 11):
					amethyst_ore_probability = 0.00065  # 0.065% probability
				if y in range(11, 16):
					amethyst_ore_probability = 0.00065  # 0.065% probability
				elif y in range(16, 21):
					amethyst_ore_probability = 0.0007  # 0.07% probability
				elif y in range(21, 26):
					amethyst_ore_probability = 0.0007  # 0.07% probability
				elif y in range(26, 31):
					amethyst_ore_probability = 0.00075  # 0.075% probability
				elif y in range(31, 36):
					amethyst_ore_probability = 0.00075  # 0.075% probability
				elif y in range(36, 40):
					amethyst_ore_probability = 0.0008  # 0.08% probability
				
				# Place a block based on probability
				if randf() < amethyst_ore_probability:
					set_cell(0, Vector2i(x, y), 4, Vector2i(0, 0))
					
	# Generates sapphire ore: 
	var sapphire_ore_x = -81
	var sapphire_ore_y = -5

	# Seed the random number generator for more randomness
	randomize()

	for x in range(sapphire_ore_x, sapphire_ore_x + 169):
		for y in range(sapphire_ore_y, sapphire_ore_y + 50):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var sapphire_ore_probability = 0.0
				if y in range(-5, 1):
					sapphire_ore_probability = 0.0004  # 0.04% probability
				elif y in range(1, 6):
					sapphire_ore_probability = 0.0004  # 0.04% probability
				elif y in range(6, 11):
					sapphire_ore_probability = 0.00045  # 0.045% probability
				if y in range(11, 16):
					sapphire_ore_probability = 0.00045  # 0.045% probability
				elif y in range(16, 21):
					sapphire_ore_probability = 0.0005  # 0.05% probability
				elif y in range(21, 26):
					sapphire_ore_probability = 0.0005  # 0.05% probability
				elif y in range(26, 31):
					sapphire_ore_probability = 0.00055  # 0.055% probability
				elif y in range(31, 36):
					sapphire_ore_probability = 0.00055  # 0.055% probability
				elif y in range(36, 40):
					sapphire_ore_probability = 0.0006  # 0.06% probability
				
				# Place a block based on probability
				if randf() < sapphire_ore_probability:
					set_cell(0, Vector2i(x, y), 5, Vector2i(0, 0))
					
	# Generates emerald ore: 
	var emerald_ore_x = -81
	var emerald_ore_y = -5

	# Seed the random number generator for more randomness
	randomize()

	for x in range(emerald_ore_x, emerald_ore_x + 169):
		for y in range(emerald_ore_y, emerald_ore_y + 50):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var emerald_ore_probability = 0.0
				if y in range(-5, 1):
					emerald_ore_probability = 0.0003  # 0.03% probability
				elif y in range(1, 6):
					emerald_ore_probability = 0.0003  # 0.03% probability
				elif y in range(6, 11):
					emerald_ore_probability = 0.00035  # 0.035% probability
				if y in range(11, 16):
					emerald_ore_probability = 0.00035  # 0.035% probability
				elif y in range(16, 21):
					emerald_ore_probability = 0.0004  # 0.04% probability
				elif y in range(21, 26):
					emerald_ore_probability = 0.0004  # 0.04% probability
				elif y in range(26, 31):
					emerald_ore_probability = 0.00045  # 0.045% probability
				elif y in range(31, 36):
					emerald_ore_probability = 0.00045  # 0.045% probability
				elif y in range(36, 40):
					emerald_ore_probability = 0.0005  # 0.05% probability
				
				# Place a block based on probability
				if randf() < emerald_ore_probability:
					set_cell(0, Vector2i(x, y), 6, Vector2i(0, 0))
					
	# Generates ruby ore: 
	var ruby_ore_x = -81
	var ruby_ore_y = -5

	# Seed the random number generator for more randomness
	randomize()

	for x in range(ruby_ore_x, ruby_ore_x + 169):
		for y in range(ruby_ore_y, ruby_ore_y + 50):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var ruby_ore_probability = 0.0
				if y in range(-5, 1):
					ruby_ore_probability = 0.0002  # 0.02% probability
				elif y in range(1, 6):
					ruby_ore_probability = 0.0002  # 0.02% probability
				elif y in range(6, 11):
					ruby_ore_probability = 0.00025  # 0.025% probability
				if y in range(11, 16):
					ruby_ore_probability = 0.00025  # 0.025% probability
				elif y in range(16, 21):
					ruby_ore_probability = 0.0003  # 0.03% probability
				elif y in range(21, 26):
					ruby_ore_probability = 0.0003  # 0.03% probability
				elif y in range(26, 31):
					ruby_ore_probability = 0.00035  # 0.035% probability
				elif y in range(31, 36):
					ruby_ore_probability = 0.00035  # 0.035% probability
				elif y in range(36, 40):
					ruby_ore_probability = 0.0004  # 0.04% probability
				
				# Place a block based on probability
				if randf() < ruby_ore_probability:
					set_cell(0, Vector2i(x, y), 7, Vector2i(0, 0))
					
	# Generates diamond ore instead of ruby ore
	var diamond_ore_x = -81
	var diamond_ore_y = -5

	# Seed the random number generator for more randomness
	randomize()

	for x in range(diamond_ore_x, diamond_ore_x + 169):
		for y in range(diamond_ore_y, diamond_ore_y + 50):
			if get_cell_source_id(0, Vector2i(x, y)) == 0:  # Check if the tile is ID 0
				# Determine the probability based on y-level
				var diamond_ore_probability = 0.0
				if y in range(-5, 1):
					diamond_ore_probability = 0.0000  # 0.00% probability
				elif y in range(1, 6):
					diamond_ore_probability = 0.0000  # 0.00% probability
				elif y in range(6, 11):
					diamond_ore_probability = 0.00005  # 0.005% probability
				elif y in range(11, 16):
					diamond_ore_probability = 0.00005  # 0.005% probability
				elif y in range(16, 21):
					diamond_ore_probability = 0.0001  # 0.01% probability
				elif y in range(21, 26):
					diamond_ore_probability = 0.0001  # 0.01% probability
				elif y in range(26, 31):
					diamond_ore_probability = 0.00015  # 0.015% probability
				elif y in range(31, 36):
					diamond_ore_probability = 0.00015  # 0.015% probability
				elif y in range(36, 40):
					diamond_ore_probability = 0.0002  # 0.02% probability
				
				# Place a block based on probability
				if randf() < diamond_ore_probability:
					set_cell(0, Vector2i(x, y), 8, Vector2i(0, 0))
				
func _process(_delta):
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
				get_parent().breaking()
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
				get_parent().breaking()
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
				get_parent().breaking()
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
				if tile_clicks[tile_pos] * Global.damage >= 64:
					Global.tile_money = 30
					# Tile has been clicked enough times, remove it and reward money
					erase_cell(0, tile_pos)
					Global.money += money_for_break * Global.money_multiplier * Global.tile_money
					# Reset the click counter for this tile position
					tile_clicks.erase(tile_pos)
					# Add 1 to Global.blocks when a tile is broken"physics_layer_0/collision_layer"
					Global.blocks += 1
					Global.amethyst_ore_amount += 1
					
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
				if tile_clicks[tile_pos] * Global.damage >= 80:
					Global.tile_money = 45
					# Tile has been clicked enough times, remove it and reward money
					erase_cell(0, tile_pos)
					Global.money += money_for_break * Global.money_multiplier * Global.tile_money
					# Reset the click counter for this tile position
					tile_clicks.erase(tile_pos)
					# Add 1 to Global.blocks when a tile is broken"physics_layer_0/collision_layer"
					Global.blocks += 1
					Global.sapphire_ore_amount += 1
					
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
				if tile_clicks[tile_pos] * Global.damage >= 96:
					Global.tile_money = 60
					# Tile has been clicked enough times, remove it and reward money
					erase_cell(0, tile_pos)
					Global.money += money_for_break * Global.money_multiplier * Global.tile_money
					# Reset the click counter for this tile position
					tile_clicks.erase(tile_pos)
					# Add 1 to Global.blocks when a tile is broken"physics_layer_0/collision_layer"
					Global.blocks += 1
					Global.emerald_ore_amount += 1
					
			if tile_source_id == 7:
				# Tile exists, handle clicks
				if tile_pos in tile_clicks:
					tile_clicks[tile_pos] += 1
				else:
					tile_clicks[tile_pos] = 1

				# Debug print
				print("Tile position: ", tile_pos, " Click count: ", tile_clicks[tile_pos])
				get_parent().breaking()
				# Check if the tile has been clicked enough times to break
				if tile_clicks[tile_pos] * Global.damage >= 112:
					Global.tile_money = 75
					# Tile has been clicked enough times, remove it and reward money
					erase_cell(0, tile_pos)
					Global.money += money_for_break * Global.money_multiplier * Global.tile_money
					# Reset the click counter for this tile position
					tile_clicks.erase(tile_pos)
					# Add 1 to Global.blocks when a tile is broken"physics_layer_0/collision_layer"
					Global.blocks += 1
					Global.ruby_ore_amount += 1
					
			if tile_source_id == 8:
				# Tile exists, handle clicks
				if tile_pos in tile_clicks:
					tile_clicks[tile_pos] += 1
				else:
					tile_clicks[tile_pos] = 1

				# Debug print
				print("Tile position: ", tile_pos, " Click count: ", tile_clicks[tile_pos])
				get_parent().breaking()
				# Check if the tile has been clicked enough times to break
				if tile_clicks[tile_pos] * Global.damage >= 200:
					Global.tile_money = 150
					# Tile has been clicked enough times, remove it and reward money
					erase_cell(0, tile_pos)
					Global.money += money_for_break * Global.money_multiplier * Global.tile_money
					# Reset the click counter for this tile position
					tile_clicks.erase(tile_pos)
					# Add 1 to Global.blocks when a tile is broken"physics_layer_0/collision_layer"
					Global.blocks += 1
					Global.diamond_ore_amount += 1
