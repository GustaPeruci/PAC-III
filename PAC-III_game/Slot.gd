extends Control

var selected_slot: Control = null
var in_area
var d_file
var infos
var toolbar
var inventory
var seed_type
var inventory_toolbar


func _ready():
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")

	inventory_toolbar = get_parent().get_parent().get_parent()
	infos = inventory_toolbar.get_node("Inventory/Infos")
	toolbar = inventory_toolbar.get_node("ToolBar/Container")
	inventory = inventory_toolbar.get_node("Inventory/Container")

func _on_mouse_entered():
	in_area = true
	
func _on_mouse_exited():
	in_area = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("click") and event.button_index == BUTTON_LEFT and in_area:
			_on_slot_clicked()
	if event is InputEventKey:
		if Input.is_action_pressed("select_1"):
			selected_slot = toolbar.get_node("Slot1")
			toolbar.get_node("Slot1")._on_slot_clicked()
		if Input.is_action_pressed("select_2"):
			toolbar.get_node("Slot2")._on_slot_clicked()
		if Input.is_action_pressed("select_3"):
			toolbar.get_node("Slot3")._on_slot_clicked()
		if Input.is_action_pressed("select_4"):
			toolbar.get_node("Slot4")._on_slot_clicked()
		if Input.is_action_pressed("select_5"):
			toolbar.get_node("Slot5")._on_slot_clicked()
		if Input.is_action_pressed("select_6"):
			toolbar.get_node("Slot6")._on_slot_clicked()
		if Input.is_action_pressed("select_7"):
			toolbar.get_node("Slot7")._on_slot_clicked()
		if Input.is_action_pressed("select_8"):
			toolbar.get_node("Slot8")._on_slot_clicked()
		if Input.is_action_pressed("select_9"):
			toolbar.get_node("Slot9")._on_slot_clicked()
		if Input.is_action_pressed("select_0"):
			toolbar.get_node("Slot10")._on_slot_clicked()

func _on_slot_clicked() -> void:
	if $sprite.texture != null:		
		if selected_slot == self:
			# Deselecionar o slot atual
			selected_slot = null
			Global.plantselected = 0
			self.modulate = Color(1, 1, 1)  # Retorna à cor original do slot
			infos.clear_infos()
			infos.get_node("NextButton").visible = false
			infos.get_node("PreviewtButton").visible = false
		else:
			# Deselecionar o slot anterior, se houver
			if selected_slot != null:
				selected_slot.modulate = Color(1, 1, 1)
			# Selecionar o slot atual
			selected_slot = self
			Global.plantselected = seed_type
			self.modulate = Color(0.5, 0.5, 1)  # Define uma cor diferente para o slot
			# Desmarcar todos os outros slots
			var parent = get_parent()
			for child in parent.get_children():
				if child != self and child is Control:
					child.selected_slot = null
					child.modulate = Color(1, 1, 1)
					infos.clear_infos()
					infos.get_node("NextButton").visible = false
					infos.get_node("PreviewtButton").visible = false

			if infos != null and selected_slot != null:
				infos.load_dialogue(d_file)
				infos._on_NextButton_pressed()
				infos.get_node("NextButton").visible = true
				infos.get_node("PreviewtButton").visible = true
			else:
				infos.visible = false
				
	return


func get_drag_data(position: Vector2):
	var data = {
		"sprite" : $sprite.texture,
		"amount" : $amount.text,
		"d_file" : d_file,
		"seed_type" : seed_type,
		"backup" : self
	}
	
	var preview = self.duplicate()
	preview.get_node("amount").hide()
	
	set_empty_slot()
	set_drag_preview(preview)
	
	return data
	
func set_empty_slot() -> void:
	$sprite.texture = null
	$amount.text = ""
	d_file = null
	seed_type = 0
	
func can_drop_data(position: Vector2, data) -> bool:
	return true

func drop_data(position: Vector2, data) -> void:	
	if $sprite.texture == data.sprite:
		var drop_item = int($amount.text)
		drop_item += int(data.amount)
		$amount.text = String(drop_item)
		
	else:		
		data.backup.get_node("sprite").texture = $sprite.texture
		data.backup.get_node("amount").text = $amount.text
		data.backup.d_file = d_file
		data.backup.seed_type = seed_type
		
		d_file = data.d_file
		seed_type = data.seed_type
		$sprite.texture = data.sprite
		$amount.text = data.amount
		
func get_selected_seed() -> int:
	var item
	var slot_seed_type
	for slot_toolbar in toolbar.get_children():

		if slot_toolbar.selected_slot:
			slot_seed_type = slot_toolbar.seed_type
			item = (int(slot_toolbar.get_node("amount").text))-1
			if item == 0:
				slot_toolbar.get_node("sprite").texture = null				
				slot_toolbar.get_node("amount").text = ''
				slot_toolbar.seed_type = 0
				slot_toolbar.d_file = null
				slot_toolbar.selected_slot = null
				
				infos.clear_infos()
				infos.get_node("NextButton").visible = false
				infos.get_node("PreviewtButton").visible = false
			else:	
				slot_toolbar.get_node("amount").text = String(item)
			
			return slot_seed_type

	for slot_inventory in inventory.get_children():
		if slot_inventory.selected_slot:
			slot_seed_type = slot_inventory.seed_type
			item = (int(slot_inventory.get_node("amount").text))-1
			if item == 0:
				slot_inventory.get_node("sprite").text = null				
				slot_inventory.get_node("amount").text = ''
				slot_inventory.seed_type = 0
				slot_inventory.d_file = null
				slot_inventory.selected_slot = null
				
				infos.clear_infos()
				infos.get_node("NextButton").visible = false
				infos.get_node("PreviewtButton").visible = false
			else:	
				slot_inventory.get_node("amount").text = String(item)
				
			return slot_seed_type
			
	return 0
