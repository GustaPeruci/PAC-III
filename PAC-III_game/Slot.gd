extends Control

var selected_slot: Control = null
var in_area
var d_file
var infos
var seed_type
var inventory_toolbar


func _ready():
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")

	inventory_toolbar = get_parent().get_parent().get_parent()
	infos = inventory_toolbar.get_node("Infos")

func _on_mouse_entered():
	in_area = true
	
func _on_mouse_exited():
	in_area = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("click") and event.button_index == BUTTON_LEFT and in_area:
			_on_slot_clicked(BUTTON_LEFT)
		elif event.is_action_pressed("click") and event.button_index == BUTTON_RIGHT and in_area:
			_on_slot_clicked(BUTTON_RIGHT)

func _on_slot_clicked(button_index: int) -> void:
	if $sprite.texture == null:
		return
	if button_index == BUTTON_LEFT:
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


func get_drag_data(position: Vector2):
	var data := {
		"sprite" : $sprite.texture,
		"amount" : $amount.text,
		"d_file" : d_file,
		"seed_type" : seed_type,
		"backup" : self
	}
	
	var preview = self.duplicate()
	preview.get_node("amount").hide()
	preview.get_node("sprite").rect_position = Vector2(0,0)
	
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
