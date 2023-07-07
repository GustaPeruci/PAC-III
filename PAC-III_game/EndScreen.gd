extends Control

func _ready():
	pass
	
func _on_restartBtn_pressed():
	get_tree().change_scene("res://main.tscn")

func _on_quitBtn_pressed():
	get_tree().quit()


