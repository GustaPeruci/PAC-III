extends Area2D

func _on_Carrot_seed_body_entered(body):
	if body.ui_canvas.add_item_inventory($Sprite.texture):
		queue_free()

func _on_Tomato_seed_body_entered(body):
	if body.ui_canvas.add_item_inventory($Sprite.texture):
		queue_free()

func _on_Strawberry_seed_body_entered(body):
	if body.ui_canvas.add_item_inventory($Sprite.texture):
		queue_free()

func _on_Pumpkin_seed_body_entered(body):
	if body.ui_canvas.add_item_inventory($Sprite.texture):
		queue_free()

#func _on_Lettuce_seed_body_entered(body):
#	if body.ui_canvas.add_item_inventory($Sprite.texture):
#		queue_free()

#func _on_Corn_seed_body_entered(body):
#	if body.ui_canvas.add_item_inventory($Sprite.texture):
#		queue_free()
