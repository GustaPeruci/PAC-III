extends CanvasLayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		$InventoryToolbar/Inventory.visible = not $InventoryToolbar/Inventory.visible
		$Color.visible = not $Color.visible

func add_item_inventory(sprite: Texture) -> bool:
	for slot_toolbar in $InventoryToolbar/ToolBar/Container.get_children():
		if slot_toolbar.get_node("sprite").texture == null:
			slot_toolbar.get_node("sprite").texture = sprite
			slot_toolbar.get_node("sprite").rect_scale = Vector2(3,3)
			slot_toolbar.get_node("amount").text = "1"
			return true
			
	for slot in $InventoryToolbar/Inventory/Container.get_children():
		if slot.get_node("sprite").texture == null:
			slot.get_node("sprite").texture = sprite
			slot.get_node("sprite").rect_scale = Vector2(3,3)
			slot.get_node("amount").text = "1"
			return true	
			
	return false
