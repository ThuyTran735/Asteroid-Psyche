extends Node

# Global Variables
var money = 0
var blocks = 0
var tile_money = 1 # Money for each tile, can be changed in each TileMap script

var amethyst_ore_amount = 0
var copper_ore_amount = 0
var diamond_ore_amount = 0
var emerald_ore_amount = 0
var gold_ore_amount = 0
var iron_ore_amount = 0
var lead_ore_amount = 0
var nickel_ore_amount = 0
var palladium_ore_amount = 0
var plutonium_ore_amount = 0
var ruby_ore_amount = 0
var sapphire_ore_amount = 0
var silver_ore_amount = 0
var tungsten_ore_amount = 0
var uranium_ore_amount = 0

var volume = 0

var item_main = 0 # Tool type
var damage = 1 # Tool damage
var information_menu_exit_button = 0

var back_button = 0
var quit_button = 0

var previous_scene = 0

signal alien_signal
var talked_to_tut_alien2 = 0

var money_multiplier = 1 # Money gets multiplied with the tile money
var game_ended = false
var elapsed_time: float = 0.0

var reset = 0

func _ready():
	alien_signal.connect(talked_to_tut_alien1)

func talked_to_tut_alien1(v):
	talked_to_tut_alien2 = 1

func reset_state():
	# Reset global state
	money = 0
	blocks = 0
	tile_money = 1

	amethyst_ore_amount = 0
	copper_ore_amount = 0
	diamond_ore_amount = 0
	emerald_ore_amount = 0
	gold_ore_amount = 0
	iron_ore_amount = 0
	lead_ore_amount = 0
	nickel_ore_amount = 0
	palladium_ore_amount = 0
	plutonium_ore_amount = 0
	ruby_ore_amount = 0
	sapphire_ore_amount = 0
	silver_ore_amount = 0
	tungsten_ore_amount = 0
	uranium_ore_amount = 0

	volume = 0
	item_main = 0
	damage = 1
	information_menu_exit_button = 0

	back_button = 0
	quit_button = 0

	previous_scene = 0
	talked_to_tut_alien2 = 0

	money_multiplier = 1
	game_ended = false
	elapsed_time = 0.0
	reset = 0

func end_game():
	var minutes = int(elapsed_time / 60)
	var seconds = int(elapsed_time) % 60
	var final = str(minutes).pad_zeros(2) + ":" + str(seconds).pad_zeros(2)
	if money >= 1000000 and not game_ended:
		game_ended = true
		print("You Win! Score: ", final)
