extends Node2D

signal scene_changed(scene_name)
var entered = false

export (String) var scene_name = "scene"

func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			print("Entered")
			emit_signal("Scene has changed", scene_name)
			
func _on_Area2D_body_entered(body: PhysicsBody2D):
	entered = true

func _on_Area2D_body_exited(body):
	entered = false

