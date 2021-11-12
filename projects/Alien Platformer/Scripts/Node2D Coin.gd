extends Node2D

var is_collected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	
	if(is_collected):
		return
	
	get_tree().call_group("GameRules", "coin_up")
	$AudioStreamPlayer2D.play()
	is_collected = true
	
	hide()


func _on_Timer_timeout():
	queue_free()
