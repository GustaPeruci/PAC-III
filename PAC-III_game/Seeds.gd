extends Area2D

func _on_Seed_body_entered(body: Node) -> void:
		if body.ui_canvas.add_item_inventory($Sprite.texture):
			queue_free()
