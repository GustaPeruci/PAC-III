extends Area2D

export var seed_type = 0
export(String, FILE, "*.json") var d_file

func _on_Seedpack_body_entered(body):
	if body.name == "Player":
		var ui_canvas = body.ui_canvas
		if ui_canvas.add_item_inventory($Sprite.texture, d_file, seed_type):
			queue_free()
