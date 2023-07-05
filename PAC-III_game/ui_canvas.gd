extends CanvasLayer

var invetory_size = Vector2(60,60)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		$InventoryToolbar/Inventory.visible = not $InventoryToolbar/Inventory.visible
		$InventoryToolbar/Infos.visible = not $InventoryToolbar/Infos.visible
		$Color.visible = not $Color.visible

func add_item_inventory(sprite: Texture, d_file, seed_type) -> bool:
	for slot_toolbar in $InventoryToolbar/ToolBar/Container.get_children():
		var slot_sprite = slot_toolbar.get_node("sprite")
		var slot_amount = slot_toolbar.get_node("amount")

		if slot_sprite.texture != null and slot_toolbar.seed_type == seed_type and slot_toolbar.d_file == d_file:
			# Item já existe no inventário, somar quantidade
			var current_amount = int(slot_amount.text)
			current_amount += 1
			slot_amount.text = str(current_amount)
			return true

		if slot_sprite.texture == null:
			# Encontrou um slot vazio, adicionar o item
			slot_sprite.texture = sprite
			slot_sprite.rect_scale = Vector2(3, 3)
			slot_amount.text = "1"
			slot_toolbar.d_file = d_file
			slot_toolbar.seed_type = seed_type
			return true

	for slot in $InventoryToolbar/Inventory/Container.get_children():
		var slot_sprite = slot.get_node("sprite")
		var slot_amount = slot.get_node("amount")

		if slot_sprite.texture != null and slot.seed_type == seed_type and slot.d_file == d_file:
			# Item já existe no inventário, somar quantidade
			var current_amount = int(slot_amount.text)
			current_amount += 1
			slot_amount.text = str(current_amount)
			return true

		if slot_sprite.texture == null:
			# Encontrou um slot vazio, adicionar o item
			slot_sprite.texture = sprite
			slot_sprite.rect_scale = Vector2(3, 3)
			slot_amount.text = "1"
			slot.d_file = d_file
			slot.seed_type = seed_type
			return true

	return false

func remove_item_inventory(sprite: Texture):
	pass

func _on_AreaToolbar_body_entered(body):
	if body.name == "Player":
		$InventoryToolbar/ToolBar.rect_position = Vector2(85,5)

func _on_AreaToolbar_body_exited(body):
	if body.name == "Player":
		$InventoryToolbar/ToolBar.rect_position = Vector2(85,474)
