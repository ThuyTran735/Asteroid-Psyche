extends Node

var money = 10000



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

var back_button = 0
var quit_button = 0

var previous_scene = 0

signal alien_signal
var talked_to_tut_alien2 = 0
func _ready():
	alien_signal.connect(talked_to_tut_alien1)
func talked_to_tut_alien1(v):
	talked_to_tut_alien2 = 1

var money_multiplier = 1 # Money gets multiplied with the tile money

var game_ended = false
var elapsed_time: float = 0.0

func reset_state():
	var money = 10000
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
	var item_main = 0 # Tool type
	var damage = 1 # Tool damage
	var information_menu_exit_button = 0
	var money_multiplier = 1 # Money gets multiplied with the tile money
	var game_ended = false
	var elapsed_time: float = 0.0

func end_game():
	var minutes = int(elapsed_time / 60)
	var seconds = int(elapsed_time) % 60
	var final = str(minutes).pad_zeros(2) + ":" + str(seconds).pad_zeros(2)
	if money >= 1000000 and not game_ended:
		Global.game_ended = true
		print("You Win! Score: ", final)
