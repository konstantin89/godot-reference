extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("GUI")

func add_lives(lives_number):
	print("Adding lives: ", lives_number)
	
	while lives_number > $Control/Lives.get_child_count():
		$Control/Lives.add_child(load("res://Scenes/heart.tscn").instance())
	
	
func remove_lives(lives_number):
	print("Removing lives: ", lives_number)
		
	if lives_number <  $Control/Lives.get_child_count():
		var heart =  $Control/Lives.get_child(0)
		heart.queue_free()

func set_coins(coins):
	$Control/Label_coins.text = str(coins)
