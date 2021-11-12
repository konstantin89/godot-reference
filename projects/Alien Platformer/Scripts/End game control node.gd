extends Control


func _ready():
	pass


func _on_ExitButton_pressed():
	get_tree().quit(0)

func _on_RestartButton_pressed():
	get_tree().change_scene("res://Level1.tscn")
