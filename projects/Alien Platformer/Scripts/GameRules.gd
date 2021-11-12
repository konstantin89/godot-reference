extends Node

var player_lives = 3
var coins = 0

func _ready():
	add_to_group("GameRules")
	get_tree().call_group("GUI", "add_lives", player_lives)
	get_tree().call_group("GUI", "set_coins", coins)

func hurt():
	print("Game Rules hurt called")
	
	$Player.take_damage()
		
	player_lives = player_lives - 1
	
	get_tree().call_group("GUI", "remove_lives", player_lives)
	
	if(player_lives < 1):
		end_game()
	
func end_game():
	get_tree().change_scene("res://Scenes//End game control node.tscn")

func coin_up():
	coins += 1
	print("Coin UP: ", coins)
	
	get_tree().call_group("GUI", "set_coins", coins)
