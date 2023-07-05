extends Area2D

func _on_Area2D_body_entered(body):
	if body.ui_canvas.add_item_inventory($Sprite.texture):
		queue_free()
