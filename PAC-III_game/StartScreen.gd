extends Control

func _ready():
	pass


func _on_startBtn_pressed():
	get_tree().change_scene("res://main.tscn")


func _on_controlsBtn_pressed():
	var controlScreen = load("res://ControlsScreen.tscn").instance()
	get_tree().current_scene.add_child(controlScreen)


func _on_quitBtn_pressed():
	get_tree().quit()
