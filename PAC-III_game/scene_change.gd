extends Node

var next_scene

onready var current_scene = $Main
onready var animation = $AnimationPlayer

func _ready() -> void:
	current_scene.connect("Scene changed", self, "handle_scene_change")
	
func handle_scene_change(current_scene_name: String):
	var next_scene_name: String
	
	match current_scene_name:
		"main":
			next_scene_name = "Secondary_screen"
		"Secondary_screen":
			next_scene_name = "main"
		_:
			return
	next_scene = load("res://" + next_scene_name +".tscn").instace()
	next_scene.z_index = 1
	add_child(next_scene)
	animation.play("fade_ion")
	next_scene.connect("Scene changed", self, "handle_scene_change")

func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"fade_ion":
			current_scene.queue_free()
			current_scene = next_scene
			current_scene.z_index = 0
			next_scene = null
			animation.play("fade_out")
