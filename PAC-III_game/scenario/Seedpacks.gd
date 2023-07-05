extends Area2D

var selected = false
export var seed_type = 0
export var seed_text = ''

onready var text_box_instance = $TextBox

func _on_Seedpacks_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		selected = true

	if event.is_action_released("click"):
		selected = false

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)

func _on_Seedpacks_body_entered(body):
	if body.ui_canvas.add_item_inventory($Label.texture):
		queue_free()
	
	if body.is_in_group("Player"):
		text_box_instance.visible = true	

func _on_Seedpacks_body_exited(body):
	if body.is_in_group("Player"):
		text_box_instance.visible = false

func _input(event):
	if event.is_action_pressed("ui_accept") and text_box_instance.visible:
		text_box_instance.visible = false
	else:
		text_box_instance.visible = true

