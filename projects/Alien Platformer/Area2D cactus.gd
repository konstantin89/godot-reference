extends Area2D


func _ready():
	pass

func _on_Area2D_cactus_body_entered(body):
	if !body.has_method("take_damage"):
		print("Error! body has no take_damage method")
	else:
		body.take_damage()
